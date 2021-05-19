package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.domain.ProductDetailListVO;

public interface ChattingService {
	void fromUser(String member_id, String chatting_content) throws Exception;
	
	List<ChattingListVO> chattingList() throws Exception;
	
	List<ChattingListVO> getChatting(String member_id) throws Exception;
	
	void fromAdmin(String member_id, String chatting_content) throws Exception;
	
	List<ProductDetailListVO> popularProdList() throws Exception;
	
	void updateIsRead(String member_id, String who) throws Exception;
}
