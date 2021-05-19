package com.cambak21.persistence.boardNotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;


@Repository
public class BoardNoticeDAOImpl implements BoardNoticeDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.cambakBoard.BoardNotice";
	
	@Override
	public List<BoardVO> getNoticeAll() throws Exception {
		System.out.println("다오 임플 getNoticeAll");
		return ses.selectList(namespace + ".getNoticeAll");
	}

	@Override
	public List<BoardVO> getListCriteria(PagingCriteria cri) throws Exception {
		System.out.println("다오 임플  getListCritera");
		return ses.selectList(namespace + ".getListCriteria", cri);
		
	}

	@Override
	public int getTotalNoticeCnt() throws Exception {
		return ses.selectOne(namespace + ".getTotalNoticeCnt");
	}
	
	public BoardVO noticeRead(int no) throws Exception{
		return ses.selectOne(namespace + ".noticeRead", no);
	}

	@Override
	public void noticeViewCnt(int no, int amount) throws Exception {
		Map<String, Object> para = new HashMap<String, Object>();
		para.put("no", no);
		para.put("amount", amount);
		
		ses.update(namespace + ".noticeViewCnt", para);
	}

	@Override
	public int insertNotice(BoardVO vo) throws Exception {
		return ses.insert(namespace + ".insertNotice", vo);
	}

	@Override
	public void updateNoticeReivewCnt(int board_no, int amount) throws Exception {
		Map<String, Object> para = new HashMap<String, Object>();
		para.put("board_no", board_no);
		para.put("amount", amount);
		
		ses.update(namespace + ".updateNoticeReivewCnt", para);
		
	}

	@Override
	public int removeNoticeBoard(int board_no) throws Exception {
		return ses.delete(namespace + ".removeNoticeBoard", board_no);
	}

	@Override
	public List<BoardVO> noticeSearch(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchType", scri.getSearchType());
		param.put("searchWord", scri.getSearchWord());
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(namespace + ".noticeSearch", param);
	}

	@Override
	public int getSearchTotalNoticeBoardCnt(SearchCriteria scri) throws Exception {
		return ses.selectOne(namespace + ".getSearchTotalNoticeBoardCnt", scri);
	}

	@Override
	public int modiNoticeBoard(BoardVO vo) throws Exception {
		return ses.update(namespace + ".modiNoticeBoard", vo);
	}

	@Override
	public void downReplyCnt(int board_no, int amount) throws Exception {
		Map<String, Object> para = new HashMap<String, Object>();
		para.put("board_no", board_no);
		para.put("amount", amount);
		
			ses.update(namespace + ".downReplyCnt", para);
		
	}
	

}
