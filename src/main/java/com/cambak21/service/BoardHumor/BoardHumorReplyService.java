package com.cambak21.service.BoardHumor;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardHumorReplyService {
	public List<ReplyBoardVO> listReply(int bno) throws Exception;
	
	public void insert(ReplyBoardVO vo) throws Exception;
	
	public void update(ReplyBoardVO vo) throws Exception;

	void delete(int reply_no, int board_no) throws Exception;




	
}
