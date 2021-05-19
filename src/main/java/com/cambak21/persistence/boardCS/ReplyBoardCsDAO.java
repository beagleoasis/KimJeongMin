package com.cambak21.persistence.boardCS;

import java.util.List;

import com.cambak21.domain.GetReplyInfo;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyCSBoardDTO;
import com.cambak21.dto.UpdateReplyCSBoardDTO;

public interface ReplyBoardCsDAO {
	// 부모댓글 max 구하기
	int getRefMax() throws Exception;
	
	// refOrder Update
	void updateRefOrder(GetReplyInfo vo) throws Exception;
	
	// 부모 댓글 작성
	void insertReplyBoardCS(InsertReplyCSBoardDTO dto, int replyBoard_ref) throws Exception;
	
	// 자식 댓글 작성
	void insertChildReplyBoardCs(GetReplyInfo vo, InsertReplyCSBoardDTO dto) throws Exception;
	
	// 댓글 수정
	int updateReplyBoardCS(UpdateReplyCSBoardDTO dto) throws Exception;
	
	// 댓글 삭제
	int deleteReplyBoardCS(int replyBoard_no) throws Exception;
	
	// 댓글 리스트 출력
	List<ReplyBoardVO> getReplyListBoardCS(int board_no) throws Exception;

	// 부모댓글의 정보 가져요기
	GetReplyInfo getParentReplyInfo(int replyBoard_no) throws Exception;
	
	// 댓글 갯수 가져오기
	int getReplyCnt(int board_no) throws Exception;
}
