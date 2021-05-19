package com.cambak21.persistence.boardQA;

import java.util.List;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyQABoardDTO;
import com.cambak21.dto.UpdateReplyQABoardDTO;

public interface ReplyBoardQADAO {
	// 부모댓글 max 구하기
	int getRefMax() throws Exception;
	
	// refOrder Update
	void updateRefOrder(GetReplyInfo vo) throws Exception;
	
	// 부모 댓글 작성
	void insertReplyBoardQA(InsertReplyQABoardDTO dto, int replyBoard_ref) throws Exception;
	
	// 자식 댓글 작성
	void insertChildReplyBoardQA(GetReplyInfo vo, InsertReplyQABoardDTO dto) throws Exception;
	
	// 댓글 수정
	int updateReplyBoardQA(UpdateReplyQABoardDTO dto) throws Exception;
	
	// 댓글 삭제
	int deleteReplyBoardQA(int replyBoard_no) throws Exception;
	
	// 댓글 리스트 출력
	List<ReplyBoardVO> getReplyListBoardQA(int board_no) throws Exception;

	// 부모댓글의 정보 가져요기
	GetReplyInfo getParentReplyInfo(int replyBoard_no) throws Exception;

	// 댓글 갯수 가져오기
	int getReplyCnt(int board_no) throws Exception;
}