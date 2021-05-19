package com.cambak21.persistence.boardCampingReview;

import java.util.List;



import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertCRBoardDTO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCRBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardCampingReviewDAO {
	// 게시글 작성
	void writeBoardCR(InsertCRBoardDTO dto) throws Exception;

	// 게시글 insert 후 해당 게시글 번호 가져오기
	int getBoard_no(String member_id) throws Exception;
	
	// 게시글 수정
	int modiBoardCR(UpdateCRBoardDTO dto) throws Exception;

	// 게시글 삭제
	int deleteBoardCR(int board_no) throws Exception;

	// 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardVO> listBoardCampingReview(PagingCriteria cri) throws Exception;

	// 게시글 총 수 구하기 (페이징 하기 위한)
	int boardCRtotalCnt() throws Exception;

	// 조회수 업데이트
	void boardCRViewUpdate(int board_no) throws Exception;

	// 좋아요 업데이트
	void boardCRLikeUpdate(int board_no) throws Exception;

	// 제목 검색
	// 내용 검색
	// 작성자 검색
	// 내용 + 제목 검색
//	List<BoardVO> searchBoardCS(SearchCriteria scri) throws Exception;

	// 검색결과 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardVO> searchListBoardCR(SearchCriteria scri, PagingCriteria cri) throws Exception;

	// 검색된 게시글 총 수 구하기 (페이징 하기 위한)
	int searchBoardCnt(SearchCriteria scri) throws Exception;

	// 게시글 상세보기

	BoardVO readBoardCampingReview(int board_no) throws Exception;

	

}
