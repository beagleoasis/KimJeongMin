package com.cambak21.persistence.boardCampingReview;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertCRBoardDTO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCRBoardDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardCampingReviewDAOImpl implements BoardCampingReviewDAO {

	@Inject
	private SqlSession ses;

	private static String ns = "com.cambak21.mappers.cambakBoard.CampingReview";

	@Override
	public void writeBoardCR(InsertCRBoardDTO dto) throws Exception {
		ses.insert(ns + ".writeBoardCR", dto);
	}

	@Override
	public int modiBoardCR(UpdateCRBoardDTO dto) throws Exception {
		return ses.update(ns + ".updateBoardCR", dto);
	}

	@Override
	public int deleteBoardCR(int board_no) throws Exception {
		
		return ses.delete(ns+".deleteBoardCR", board_no);
	}


	@Override
	public List<BoardVO> listBoardCampingReview(PagingCriteria cri) throws Exception {
		
		return ses.selectList(ns + ".listBoardCampingReview", cri);
	}

	@Override
	public int boardCRtotalCnt() throws Exception {

		return ses.selectOne(ns + ".getTotalCRCnt");
	}

	@Override
	public void boardCRViewUpdate(int board_no) throws Exception {
		
		ses.selectOne(ns + ".updateView", board_no);
	}

	@Override
	public void boardCRLikeUpdate(int board_no) throws Exception {
		ses.selectOne(ns + ".updateLike", board_no);

	}

	@Override
	public List<BoardVO> searchListBoardCR(SearchCriteria scri, PagingCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", scri.getSearchType());
		map.put("searchWord", scri.getSearchWord());
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchBoard", map);
	}

	@Override
	public int searchBoardCnt(SearchCriteria scri) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("searchType", scri.getSearchType());
//		map.put("searchWord", scri.getSearchWord());
		
		return ses.selectOne(ns + ".searchBoardCnt", scri);
	}


	@Override
	public BoardVO readBoardCampingReview(int board_no) throws Exception {
		return ses.selectOne(ns + ".readBoardCampingReview", board_no);

	}

	/**
	  * @Method Name : getBoard_no
	  * @작성일 : 2021. 3. 17.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 게시글 insert 후 해당 게시글 번호 가져오기, 리다이렉트 시키기 위함
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getBoard_no(String member_id) throws Exception {
		
		return ses.selectOne(ns + ".getBoardNo", member_id);
	}

}
