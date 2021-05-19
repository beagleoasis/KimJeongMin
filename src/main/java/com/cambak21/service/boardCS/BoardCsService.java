package com.cambak21.service.boardCS;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.BoardCsVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardCsService {
	// 게시글 작성
	int writeBoardCS(InsertCSBoardDTO dto) throws Exception;

	// 게시글 수정
	int modiBoardCS(UpdateCSBoardDTO dto) throws Exception;

	// 게시글 삭제
	int deleteBoardCS(int board_no) throws Exception;

	// 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> listBoardCS(PagingCriteria cri) throws Exception;

	// 좋아요 업데이트
	void boardCSLikeUpdate(int board_no) throws Exception;

	// 제목 검색
	// 내용 검색
	// 작성자 검색
	// 내용 + 제목 검색
	//List<BoardVO> searchBoardCS(SearchCriteria scri) throws Exception;

	// 검색결과 게시글 리스트
	// 페이징 제약조건 넘겨야댐
	List<BoardCsVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception;

	// 게시글 상세보기
	BoardCsVO readBoardCS(int board_no, String status) throws Exception;
	
	// 상세보기 들어갔을시 체크여부 가져오기
	int preCheckLike(String member_id, int board_no ) throws Exception;
	
	// 게시글 총 수 구하기 (페이징 하기 위한)
	int boardCStotalCnt() throws Exception;

	// 검색된 게시글 총 수 구하기 (페이징 하기 위한)
	int searchBoardCStotalCnt(SearchCriteria scri) throws Exception;
	
	// 이전 게시글 번호 가져오기
	String prevNo(int board_no) throws Exception;

	// 이전 게시글 번호 가져오기
	String nextNo(int board_no) throws Exception;
	
	// 추천하기
	Map<String, Object> insertLikeBoard(InsertLikeBoard dto) throws Exception;

}
