package com.cambak21.persistence.boardNotice;

import java.util.List;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface BoardNoticeDAO {
		// 공지사항 전체 불러오기
		public List<BoardVO> getNoticeAll() throws Exception;
		// 공지사항 페이지 처리 글 보기
		public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception;
		// 공지사항 게시글 총 수 보기
		public int getTotalNoticeCnt() throws Exception;
		// 공지시항 상세글 보기
		public BoardVO noticeRead(int no) throws Exception;
		// 게시글 상세페이지 이동시 읽은 수 증가
		public void noticeViewCnt(int no, int amount) throws Exception;
		// 게시글 작성
		public int insertNotice(BoardVO vo) throws Exception;
		// 댓글 달리면 원게시글 댓글 증가
		public void updateNoticeReivewCnt(int no, int amount) throws Exception;
		// 공지사항 삭제
		public int removeNoticeBoard(int no) throws Exception;
		// 공지사항 검색글 페이징
		public List<BoardVO> noticeSearch(SearchCriteria scri, PagingCriteria cri) throws Exception;
		// 공지사항 검색글 총 수
		public int getSearchTotalNoticeBoardCnt(SearchCriteria scri) throws Exception;
		// 공지사항 수정하기
		public int modiNoticeBoard(BoardVO vo) throws Exception;
		
		public void downReplyCnt(int bno, int amount) throws Exception;
}
