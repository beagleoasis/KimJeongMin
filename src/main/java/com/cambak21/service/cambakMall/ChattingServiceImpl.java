package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.persistence.cambakMall.ChattingDAO;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Inject
	private ChattingDAO dao;
	
	@Override
	public void fromUser(String member_id, String chatting_content) throws Exception {
		dao.fromUser(member_id, chatting_content);
	}

	@Override
	public List<ChattingListVO> chattingList() throws Exception {
		return dao.chattingList();
	}

	@Override
	public List<ChattingListVO> getChatting(String member_id) throws Exception {
		return dao.getChatting(member_id);
	}

	/**
	  * @Method Name : fromAdmin
	  * @작성일 : 2021. 4. 20.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 운영자가 메시지 보낼 시
	  * @param member_id : 답장 받는 유저
	  * @param chatting_content : 내용
	  * @throws Exception
	  */
	@Override
	public void fromAdmin(String member_id, String chatting_content) throws Exception {
		dao.fromAdmin(member_id, chatting_content);
	}

	/**
	  * @Method Name : popularProdList
	  * @작성일 : 2021. 4. 21.
	  * @작성자 : 
	  * @변경이력 : 
	  * @Method 설명 : 하단에 인기상품 가져오기
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ProductDetailListVO> popularProdList() throws Exception {
		
		return dao.popularProdList();
	}

	@Override
	public void updateIsRead(String member_id, String who) throws Exception {
		dao.updateIsRead(member_id, who);
	}

}
