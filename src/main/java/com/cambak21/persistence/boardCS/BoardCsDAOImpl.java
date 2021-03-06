package com.cambak21.persistence.boardCS;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardCsVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardCsDAOImpl implements BoardCsDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.cambakBoard.BoardCsMapper";

	@Override
	public void writeBoardCS(InsertCSBoardDTO dto) throws Exception {
		ses.insert(ns + ".insertBoardCS", dto);
	}

	@Override
	public int modiBoardCS(UpdateCSBoardDTO dto) throws Exception {
		return ses.update(ns + ".updateBoardCS", dto);
	}

	@Override
	public int deleteBoardCS(int board_no) throws Exception {
		
		return ses.delete(ns+".deleteBoardCS", board_no);
	}

	@Override
	public List<BoardCsVO> listBoardCS(PagingCriteria cri) throws Exception {
		
		return ses.selectList(ns + ".listBoardCS", cri);
	}

	@Override
	public int boardCStotalCnt() throws Exception {

		return ses.selectOne(ns + ".totalCnt");
	}

	@Override
	public void boardCSViewUpdate(int board_no) throws Exception {
		
		ses.selectOne(ns + ".updateView", board_no);
	}

	@Override
	public void boardCSLikeUpdate(int board_no) throws Exception {
		ses.selectOne(ns + ".updateLike", board_no);

	}

	@Override
	public List<BoardCsVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchBoard", map);
	}

	@Override
	public int searchBoardCStotalCnt(SearchCriteria scri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		
		return ses.selectOne(ns + ".searchBoardCnt", map);
	}

	@Override
	public BoardCsVO readBoardCS(int board_no) throws Exception {
		return ses.selectOne(ns + ".readBoardCS", board_no);

	}

	/**
	  * @Method Name : getBoard_no
	  * @????????? : 2021. 3. 17.
	  * @????????? : goott6
	  * @???????????? : 
	  * @Method ?????? : ????????? insert ??? ?????? ????????? ?????? ????????????, ??????????????? ????????? ??????
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getBoard_no(String member_id) throws Exception {
		
		return ses.selectOne(ns + ".getBoardNo", member_id);
	}

	@Override
	public String prevNo(int board_no) throws Exception {
		return ses.selectOne(ns + ".prevNo", board_no);
	}

	@Override
	public String nextNo(int board_no) throws Exception {
		return ses.selectOne(ns + ".nextNo", board_no);
	}

	/**
	  * @Method Name : checkLike
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? : ?????? ????????? ?????? ??? ???????????? ???????????? ???????????????
	  * @param dto
	  * @return
	  * @throws Exception
	  */
	@Override
	public String checkLike(InsertLikeBoard dto) throws Exception {
		return ses.selectOne(ns + ".checkLike", dto);
	}

	/**
	  * @Method Name : insertLikeBoard
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? : LikeBoard???????????? ?????? ????????????
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void insertLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.insert(ns + ".insertLikeBoards", dto);
	}

	/**
	  * @Method Name : updateLikeCnt
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? : ????????? ????????? ??? + 1
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updatePlusLike", dto.getBoard_no());
	}

	/**
	  * @Method Name : getLikeCnt
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? : ?????? ??? ????????? ??? ????????????
	  * @param dto
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getLikeCnt(InsertLikeBoard dto) throws Exception {
		return ses.selectOne(ns + ".getLikeCnt", dto.getBoard_no());
	}

	/**
	  * @Method Name : deleteLikeBoard
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? : ?????? ???????????? delete
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void deleteLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.delete(ns + ".deleteLikeBoard", dto);
	}

	/**
	  * @Method Name : updateMinusLikeCnt
	  * @????????? : 2021. 3. 26.
	  * @????????? : ??????
	  * @???????????? : 
	  * @Method ?????? :
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updateMinusLike", dto.getBoard_no());
	}

	/**
	  * @Method Name : preCheckLike
	  * @????????? : 2021. 3. 31.
	  * @????????? : goott6
	  * @???????????? : 
	  * @Method ?????? :
	  * @param member_id
	  * @param board_no
	  * @return
	  * @throws Exception
	  */
	@Override
	public int preCheckLike(String member_id, int board_no) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("board_no", board_no);
		
		return ses.selectOne(ns + ".preCheckLike", map);
	}

}
