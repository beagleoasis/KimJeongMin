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
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 해당 유저가 해당 글 좋아요를 눌렀는지 안눌렀는지
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
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : LikeBoard테이블의 정보 업데이트
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void insertLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.insert(ns + ".insertLikeBoards", dto);
	}

	/**
	  * @Method Name : updateLikeCnt
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 좋아요 수 + 1
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updatePlusLike", dto.getBoard_no());
	}

	/**
	  * @Method Name : getLikeCnt
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 해당 글 좋아요 수 가져오기
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
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 이미 눌렀으면 delete
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void deleteLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.delete(ns + ".deleteLikeBoard", dto);
	}

	/**
	  * @Method Name : updateMinusLikeCnt
	  * @작성일 : 2021. 3. 26.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param dto
	  * @throws Exception
	  */
	@Override
	public void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(ns + ".updateMinusLike", dto.getBoard_no());
	}

	/**
	  * @Method Name : preCheckLike
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
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
