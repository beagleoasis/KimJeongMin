package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.domain.ProductDetailListVO;

@Repository
public class ChattingDAOImpl implements ChattingDAO {
	
	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.ChattingMapper";
	private static String MallMapper = "com.cambak21.mappers.cambakMallMapper";
	
	/**
	  * @Method Name : fromAdmin
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 유저가 메시지 보낼 시
	  * @param member_id
	  * @param chatting_content
	  * @throws Exception
	  */
	@Override
	public void fromUser(String member_id, String chatting_content) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("chatting_content", chatting_content);
		ses.insert(namespace + ".fromUser", map);
	}

	@Override
	public List<ChattingListVO> chattingList() throws Exception {
		return ses.selectList(namespace + ".getChattingList");
	}

	@Override
	public List<ChattingListVO> getChatting(String member_id) throws Exception {
		return ses.selectList(namespace + ".getChatting", member_id);
	}

	/**
	  * @Method Name : fromAdmin
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 운영자가 메시지 보낼 시
	  * @param member_id
	  * @param chatting_content
	  * @throws Exception
	  */
	@Override
	public void fromAdmin(String member_id, String chatting_content) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("chatting_content", chatting_content);
		ses.insert(namespace + ".fromAdmin", map);
	}

	/**
	  * @Method Name : popularProdList
	  * @작성일 : 2021. 4. 21.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ProductDetailListVO> popularProdList() throws Exception {
		return ses.selectList(MallMapper + ".popularProdList");
	}

	@Override
	public void updateIsRead(String member_id, String who) throws Exception {
		System.out.println("채팅다오-member_id : " + member_id);
		System.out.println("채팅다오-who : " + who);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("who", who); // 동적 쿼리문을 위한 ...
		ses.update(namespace + ".updateIsRead", map);
	}

}
