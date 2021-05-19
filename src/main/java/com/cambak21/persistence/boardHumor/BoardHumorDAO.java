package com.cambak21.persistence.boardHumor;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardHumorDAO {
	
	//유머 게시판 글 입력
	public int insertBoardHumor(BoardVO vo) throws Exception;
	
	//유머게시판 상세 글 보기
	public BoardVO readBoardHumor(int no) throws Exception;
	
	//유머게시판 업데이트
	public int updateBoardHumor(BoardVO vo) throws Exception;
	
	//유머게시판 삭제
	public int deleteBoardHumor(int no) throws Exception;
	
	//페이징
	public List<BoardVO> listBoardHumor(int page) throws Exception;
	
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception;
	
	// 페이징을 위해 총 게시물 수
	public int getTotalBoardHumorCnt() throws Exception;
	
	public List<BoardVO> goSearchBoardHumor(SearchCriteria scri, PagingCriteria cri) throws Exception;
	
	public int searchBoardHumorCnt(SearchCriteria scri) throws Exception;
	
	// 검색결과 글 수 가져오기
	public void updateReply(int no) throws Exception;
	
	public void updateViewCnt(int no) throws Exception;
	
	public void minusReply(int no) throws Exception;
	
	// 게시글 좋아요수 + 1 업데이트
	public void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception;
	// 게시글 좋아요수 - 1 update
	public void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception;
	// 게시글 좋아요수 가져오기
	public int getLikeCnt(InsertLikeBoard dto) throws Exception;
	
	// 해당 유저가 이 글 좋아요를 눌렀는지 안눌렀는지
	String checkLike(InsertLikeBoard dto) throws Exception;
	// LikeBoards테이블에 insert
	void insertLikeBoard(InsertLikeBoard dto) throws Exception;
	// LikeBoards테이블에서 delete
	void deleteLikeBoard(InsertLikeBoard dto) throws Exception;

	public Integer preCheckLike(String member_id, int board_no);
	
}
