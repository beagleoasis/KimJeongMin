package com.cambak21.persistence.boardNotice;

import java.util.List;

import com.cambak21.domain.ReplyBoardVO;

public interface NoticeReplyDAO {

		public List<ReplyBoardVO> listNoticeReply(int bno) throws Exception;
		
		public void modiReplyBoard(ReplyBoardVO vo) throws Exception;
		
		public void insertReplyBoard(ReplyBoardVO vo) throws Exception;
	
		// 댓글 삭제시 게시판 목록 출력할 때 댓글 수를 출력하기 위한...
		public int getboard_no(int replyBoard_no) throws Exception;
		
		public int dropReply(int replyBoard_no) throws Exception;
		
		public void dropReplyAll(int board_no) throws Exception;
		
}
