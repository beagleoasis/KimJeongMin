package com.cambak21.service.boardQA;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardQAService {
	// 글쓰기
	int writeBoardQA(InsertBoardQADTO idto) throws Exception;
	
	// 수정
	int modiBoardQA(UpdateBoardQADTO udto) throws Exception;
	
	// 삭제
	int delBoardQA(int board_no) throws Exception;
	
	// 리스트
	List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception;
	
	// 좋아요
	void modiBoardQALike(int board_no) throws Exception;

	// 검색
	List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception;

	// 상세보기
	BoardQAVO readBoardQA(int board_no) throws Exception;

	// 게시글 총 수량 (페이징)
	int boardQAtotalCnt() throws Exception;

	// 검색된 게시글 총 수량 (페이징)
	int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception;

	// 댓글 갯수
	int boardQAReplyCnt(int board_no) throws Exception;

	// 게시글 조회수
	public boolean viewQACnt(int board_no) throws Exception;

	// 추천하기
	Map<String, Object> insertLikeBoard(InsertLikeBoard dto) throws Exception;;

	// Detail에 Like체크여부 확인
	int preCheckLike(String member_id, int board_no ) throws Exception;
	
}