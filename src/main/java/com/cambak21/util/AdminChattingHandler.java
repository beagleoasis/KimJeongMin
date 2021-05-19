package com.cambak21.util;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/adminChatting/{member_id}")
public class AdminChattingHandler {

	private static Session admin = null;

	/**
	  * @Method Name : handleOpen
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : admin이 채팅 페이지에 접속했을 시 실행
	  * @param adminSession
	  */
	@OnOpen
	public void handleOpen(Session adminSession, @PathParam("member_id") String member_id) {
		// 운영자 계정이 1개임을 가정
		if (admin != null) {
			try {
				admin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		admin = adminSession;
		// 유저에게 메시지를 읽은것을 알려주기 위해...
		UserChattingHandler.sendMsg("existSession", member_id);
	}

	/**
	  * @Method Name : sendMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : UserChattingHandler.java에서 사용하기 위한 메서드
	  * @param key
	  * @param msg
	  */
	public static void sendMsg(String member_id, String msg) {
		if (admin != null) {
			try {
				// 유저가 보내온 메시지
				admin.getBasicRemote().sendText(msg + ":" + member_id);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	  * @Method Name : handleMsg
	  * @작성일 : 2021. 4. 18.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : admin이 메시지를 보낼 시 실행되는 함수, UserChattingHandler에 있는 sendMsg를 호출해서 유저 세션으로 메시지를 보낸다
	  * @param session
	  * @param msg
	  */
	@OnMessage
	public void handleMsg(Session session, String msg) {
		// 운영자가 메시지를 보낼 때, 유저의 key값과 msg를 보낸다
		String[] split = msg.split(":");
		// 메시지
		String message = split[0];
		// key
		String member_id = split[1];

		// 유저 세션이 null이 아니면 ...
		if(UserChattingHandler.getSession(member_id) != null) {
			try {
				// 자기자신한테 메시지 보내기
				admin.getBasicRemote().sendText("existSession");
				// 유저한테 메시지 보내기
				UserChattingHandler.sendMsg(message, member_id);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else { // 유저 세션이 null이면...
			try {
				// 운영자 서버로 존재하지 않는다고 보냄
				admin.getBasicRemote().sendText("noExistSession");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@OnClose
	public void handleClose(Session session) {
		// 운영자가 접속을 끊는다면 null로 바꿈
		admin = null;
	}

	
	/**
	  * @Method Name : getSession
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 운영자 세션 getter, 유저쪽에서 사용하기 위한 getter
	  * @return
	  */
	public static Session getSession() {
		return admin;
	}
}
