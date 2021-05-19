package com.cambak21.persistence.boardCS;

import java.util.List;

import com.cambak21.domain.BoardCsVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardCsDAO {
	// 게시글 작성
	void writeBoardCS(InsertCSBoardDTO dto) throws Exception;

	// 게시글 insert 후 해당 게시글 번호 가져오기
	int getBoard_no(String member_id) throws Exception;

	// 게시글 수정
	int modiBoardCS(UpdateCSBoardDTO dto) throws Exception;

	// 게시글 삭제
	int deleteBoardCS(int board_no) throws Exception;

	// 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> listBoardCS(PagingCriteria cri) throws Exception;

	// 게시글 총 수 구하기 (페이징 하기 위한)
	int boardCStotalCnt() throws Exception;

	// 조회수 업데이트
	void boardCSViewUpdate(int board_no) throws Exception;

	// 좋아요 업데이트
	void boardCSLikeUpdate(int board_no) throws Exception;

	// 제목 검색
	// 내용 검색
	// 작성자 검색
	// 내용 + 제목 검색
//	List<BoardVO> searchBoardCS(SearchCriteria scri) throws Exception;

	// 검색결과 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception;

	// 검색된 게시글 총 수 구하기 (페이징 하기 위한)
	int searchBoardCStotalCnt(SearchCriteria scri) throws Exception;

	// 게시글 상세보기
	BoardCsVO readBoardCS(int board_no) throws Exception;
	
	// 페이지 들어갔을시 ajax로 좋아요 체크여부 가져오기
	int preCheckLike(String member_id, int board_no) throws Exception;

	// 이전 게시글 번호 가져오기
	String prevNo(int board_no) throws Exception;

	// 이전 게시글 번호 가져오기
	String nextNo(int board_no) throws Exception;
	
	// 해당 유저가 이 글 좋아요를 눌렀는지 안눌렀는지
	String checkLike(InsertLikeBoard dto) throws Exception;
	
	// LikeBoards테이블에 insert
	void insertLikeBoard(InsertLikeBoard dto) throws Exception;
	
	// 게시글 좋아요수 + 1 업데이트
	void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception;
	
	// LikeBoards테이블에서 delete
	void deleteLikeBoard(InsertLikeBoard dto) throws Exception;
	
	// 게시글 좋아요수 - 1 update
	void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception;
	
	// 게시글 좋아요수 가져오기
	int getLikeCnt(InsertLikeBoard dto) throws Exception;
}
