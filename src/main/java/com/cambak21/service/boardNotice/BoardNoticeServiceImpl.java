package com.cambak21.service.boardNotice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.persistence.boardNotice.BoardNoticeDAO;
import com.cambak21.persistence.boardNotice.NoticeReplyDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;


@Service
public class BoardNoticeServiceImpl implements BoardNoticeService {

	@Inject
	private BoardNoticeDAO dao;
	
	@Inject
	private NoticeReplyDAO rdao;
	
	
	// 테스트용 - 공지사항 전체 보기	
	@Override
	public List<BoardVO> getNoticeAll() throws Exception {
		return dao.getNoticeAll();
	}
	// 공지사항 게시글 페이징 처리
	@Override
	public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception {
		return dao.getListCriteria(cri);
	}
	// 공지사항 전체 게시글 수 
	@Override
	public int getTotalNoticeCnt() throws Exception {
			return dao.getTotalNoticeCnt();
	}
	// 공지사항 상세글 보기
	@Override
	public BoardVO noticeRead(int no, String already) throws Exception {
		System.out.println("얼레디는 : " + already);
		
		if(already == "up") {
			dao.noticeViewCnt(no, 1);
		}
		
		BoardVO vo = dao.noticeRead(no);
		System.out.println("리드 서비스" + vo.toString());
		return vo;	
	}
	
	
	// 공지사항 등록
	@Override
	public boolean insertNotice(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertNotice(vo);
		
		if(i == 1) {
			result = true;
		}
		return result;
	}
	
	// 공지사항 삭제 - 댓글도 같이 삭제
	@Transactional
	@Override
	public boolean removeNoticeBoard(int no) throws Exception {
		boolean result = false;
		
		rdao.dropReplyAll(no);
		
		int i = dao.removeNoticeBoard(no);
		if(i == 1) {
			result = true;
		}
		return false;
	}
	// 검색글 페이징 처리
	@Override
	public List<BoardVO> noticeSearch(SearchCriteria scri, PagingCriteria cri) throws Exception {
			return dao.noticeSearch(scri, cri);
	}
	// 검색글 총 갯수 
	@Override
	public int getSearchTotalNoticeBoardCnt(SearchCriteria scri) throws Exception {
		return dao.getSearchTotalNoticeBoardCnt(scri);
	}
	
	// 공지사항 수정하기
	@Override
	public boolean modiNoticeBoard(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.modiNoticeBoard(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}
	@Override
	public void downReplyCnt(int bno) throws Exception {
			dao.downReplyCnt(bno, 1);
	}

}
