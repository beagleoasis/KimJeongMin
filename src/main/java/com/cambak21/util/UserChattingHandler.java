package com.cambak21.util;

import java.io.IOException;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import com.cambak21.service.cambakMall.ChattingService;

@ServerEndpoint("/userChatting/{member_id}")
public class UserChattingHandler {

	// 유저들 리스트
	static List<User> sessionList = Collections.synchronizedList(new ArrayList<>());

	// 유저 객체
	private class User {
		Session session;
		String member_id; // 유저의 아이디, 유니크
	}

	// 유저 본인에게 뿌리기 위한
	// session으로 검색
	/**
	  * @Method Name : getUser
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 세션으로 검색
	  * @param session
	  * @return
	  */
	private static User getUser(Session session) {
		for (User user : sessionList) {
			if (user.session == session) {
				return user;
			}
		}

		return null;
	}

	/**
	  * @Method Name : getUser
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : key로 검색
	  * @param key
	  * @return
	  */
	private static User getUser(String member_id) {
		for (User user : sessionList) {
			if (user.member_id.equals(member_id)) {
				return user;
			}
		}

		return null;
	}

	/**
	  * @Method Name : handleOpen
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 웹소켓 연결 시 실행, User클래스를 이용해 key와 session을 세팅해주고 sessionList에 넣어준다
	  * @param session
	  */
	@OnOpen
	public void handleOpen(Session session, @PathParam("member_id") String member_id) {
		User user = new User();
		user.member_id = member_id;
		user.session = session;
		sessionList.add(user);
		
		// 운영자에게 접속한것을 알리기 위해...
		AdminChattingHandler.sendMsg(member_id, "existSession");
	}

	/**
	  * @Method Name : handleMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저페이지에서 메시지를 보낼 시, admin 웹소켓서버로 메시지 전송
	  * @param msg
	  * @param session
	  */
	@OnMessage
	public void handleMsg(String msg, Session session) {
		User findUser = getUser(session);
		
		// 유저가 null 아니라면...
		if (findUser != null) {
			// 운영자 세션이 있다면 ...
			if(AdminChattingHandler.getSession() != null) {
				try {
					// 운영자한테 메시지 전송
					AdminChattingHandler.sendMsg(findUser.member_id, msg);
					// 운영자 세션이 있기 때문에 1을 보냄, 읽음 안읽음 구현하기 위한 ...
					findUser.session.getBasicRemote().sendText("existSession");
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else { // 운영자 세션이 null이라면 ...
				try {
					// 세션이 null이기 0을 보냄, 읽음 안읽음 구현하기 위한 ...
					findUser.session.getBasicRemote().sendText("noExistSession");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	  * @Method Name : sendMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : AdminChattingHandler.java에서 사용하기 위한 메서드, key로 검색해 해당 key를 가진 유전 세션으로 메시지 전송
	  * @param msg
	  * @param key
	  */
	public static void sendMsg(String msg, String member_id) {
		User findUser = getUser(member_id);

		if (findUser != null) {
			try {
				// 운영자가 보낸 메시지
				findUser.session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	  * @Method Name : handleClose
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저가 채팅 종료시 실행되는 메서드, sessionList에서 해당 유저세션을 제거해준다
	  * @param session
	  */
	@OnClose
	public void handleClose(Session session) {
		
		User user = getUser(session);

		if (user != null) {
			// 웹소켓이 닫히면 리스트에서 제거
			sessionList.remove(user);
		}

	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	// 세션 getter
	public static Session getSession(String member_id) {
		Session findSession = null;
		for (User user : sessionList) {
			if(user.member_id.equals(member_id)) {
				findSession = user.session;
			}
		}
		return findSession;
	}
	
}
