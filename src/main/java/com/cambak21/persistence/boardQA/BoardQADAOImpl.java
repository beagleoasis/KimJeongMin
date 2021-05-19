package com.cambak21.persistence.boardQA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.domain.SearchBoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardQADAOImpl implements BoardQADAO {
	
	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.QABoardMapper";

	@Override
	public void writeBoardQA(InsertBoardQADTO dto) throws Exception {
		ses.insert(ns + ".insertBoardQA", dto);
	}

	@Override
	public int modiBoardQA(UpdateBoardQADTO dto) throws Exception {
		return ses.update(ns + ".updateBoardQA", dto);
	}

	@Override
	public int delBoardQA(int board_no) throws Exception {
		return ses.delete(ns + ".deleteBoardQA", board_no);
	}

	@Override
	public List<BoardQAVO> listBoardQA(PagingCriteria cri) throws Exception {
		return ses.selectList(ns + ".listBoardQA", cri);
	}

	@Override
	public void modiBoardQALike(int board_no) throws Exception {
		ses.selectOne(ns + ".updateQALike", board_no);
	}

	@Override
	public List<BoardQAVO> searchListBoardQA(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchWord", scri.getSearchWord());
		param.put("searchType", scri.getSearchType());
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchBoard", param);
	}

	@Override
	public BoardQAVO readBoardQA(int board_no) throws Exception {
		return ses.selectOne(ns + ".readBoardQA", board_no);
	}

	@Override
	public int boardQAtotalCnt() throws Exception {
		return ses.selectOne(ns + ".totalCnt");
	}

	@Override
	public int searchBoardQAtotalCnt(SearchCriteria scri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		
		return ses.selectOne(ns + ".searchQACnt", map);
	}

	@Override
	public int boardQAReplyCnt(int board_no) throws Exception {
		return ses.selectOne(ns + ".QAReplyCnt", board_no);
	}
	
	@Override
	public int getBoard_no(String member_id) throws Exception {
		
		return ses.selectOne(ns + ".getBoardNo", member_id);
	}

	@Override
	public void boardQAViewUpdate(int board_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardQAVO> listBoardQAPaging(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return ses.selectList(ns + ".listBoardPaging", page);
	}

	@Override
	public List<BoardQAVO> listBoardCriteria(PagingCriteria cri) throws Exception {
		return ses.selectList(ns + ".listBoardCriteria", cri);
	}

	@Override
	public boolean viewQACnt(int board_no) throws Exception {
		boolean result = false;
		if (ses.update(ns + ".viewQACount", board_no) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public String checkLike(InsertLikeBoard dto) throws Exception {
		return ses.selectOne(ns + ".checkLike", dto);
	}

	@Override
	public void insertLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.insert(ns + ".insertLikeBoards", dto);
	}

	@Override
	public void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updatePlusLike", dto.getBoard_no());
	}

	@Override
	public int getLikeCnt(InsertLikeBoard dto) throws Exception {
		return ses.selectOne(ns + ".getLikeCnt", dto.getBoard_no());
	}

	@Override
	public void deleteLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.delete(ns + ".deleteLikeBoard", dto);
	}

	@Override
	public void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updateMinusLike", dto.getBoard_no());
	}

	@Override
	public int preCheckLike(String member_id, int board_no) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("board_no", board_no);
		
		return ses.selectOne(ns + ".preCheckLike", map);
	}

}