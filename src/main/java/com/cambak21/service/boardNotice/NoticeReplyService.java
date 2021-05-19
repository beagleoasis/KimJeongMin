package com.cambak21.service.boardNotice;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface NoticeReplyService {
	
		public List<ReplyBoardVO> listNoticeReply(int bno) throws Exception; 
		
		public void modiReplyBoard(ReplyBoardVO vo) throws Exception;
		
		public void insertReplyBoard(ReplyBoardVO vo) throws Exception;
		
		public boolean dropReply(int no) throws Exception;
}
