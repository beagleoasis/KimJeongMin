package com.cambak21.service.boardQA;

import java.util.List;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyQABoardDTO;
import com.cambak21.dto.UpdateReplyQABoardDTO;

public interface ReplyBoardQAService {
	
	// 댓글 작성
	void insertReplyBoardQA(InsertReplyQABoardDTO dto) throws Exception;
	
	// 댓글 수정
	int updateReplyBoardQA(UpdateReplyQABoardDTO dto) throws Exception;
	
	// 댓글 삭제
	int deleteReplyBoardQA(int replyBoard_no) throws Exception;
	
	// 댓글 리스트 출력
	List<ReplyBoardVO> getReplyListBoardQA(int board_no) throws Exception;
	
}