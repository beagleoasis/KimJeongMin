package com.cambak21.persistence.boardHumor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Repository
public class BoardHumorDAOImpl implements BoardHumorDAO {
	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mapper.BoardHumor";
	
	@Override
	public int insertBoardHumor(BoardVO vo) throws Exception {
		
		return ses.insert(namespace + ".insertBoardHumor", vo);
	}

	@Override
	public BoardVO readBoardHumor(int no) throws Exception {
		
		return ses.selectOne(namespace + ".readBoardHumor", no);
	}

	@Override
	public int updateBoardHumor(BoardVO vo) throws Exception {
		return ses.update(namespace + ".updateBoardHumor", vo);
	}

	@Override
	public int deleteBoardHumor(int no) throws Exception {
		return ses.update(namespace + ".deleteBoardHumor", no );
	}

	@Override
	public List<BoardVO> listBoardHumor(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		page = (page -1) * 10;
		return ses.selectList(namespace + ".listBoardHumor", page);
	}

	@Override
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception {
		
		return ses.selectList(namespace + ".listBoardHumorCriteria", cri);
	}

	@Override
	public int getTotalBoardHumorCnt() throws Exception {
		
		return ses.selectOne(namespace + ".getToatalBoardHumorCnt");
	}

	@Override
	public List<BoardVO> goSearchBoardHumor(SearchCriteria scri, PagingCriteria cri) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchType", scri.getSearchType());
		param.put("searchWord", scri.getSearchWord());
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		return ses.selectList(namespace + ".searchBoard", param);
	}

	@Override
	public int searchBoardHumorCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
	
		return ses.selectOne(namespace + ".searchBoardCnt", scri);
	}

	@Override
	public void updateReply(int no) throws Exception {
		ses.update(namespace + ".updateReplyCnt", no);

	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		ses.update(namespace + ".updateViewCnt", no);

	}

	@Override
	public void minusReply(int no) throws Exception {
		System.out.println("여기가 마이너스 리플 다오");
		System.out.println(no);
		ses.update(namespace + ".minusReplyCnt" , no);
		
	}

	@Override
	public void updatePlusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(namespace + ".updatePlusLike", dto);
		
	}

	@Override
	public void updateMinusLikeCnt(InsertLikeBoard dto) throws Exception {
		ses.update(namespace +".minusReplyCnt", dto);
		
		
	}

	@Override
	public int getLikeCnt(InsertLikeBoard dto) throws Exception {
		
		return ses.selectOne(namespace +".getLikeCnt", dto);
	}

	@Override
	public String checkLike(InsertLikeBoard dto) throws Exception {
		
		return ses.selectOne(namespace + ".checkLike", dto);
	}

	@Override
	public void insertLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.insert(namespace + ".insertLikeBoards", dto);
		
	}

	@Override
	public void deleteLikeBoard(InsertLikeBoard dto) throws Exception {
		ses.delete(namespace + ".deleteLikeBoard", dto);
		
	}

	@Override
	public Integer preCheckLike(String member_id, int board_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("board_no", board_no);
		
		return ses.selectOne(namespace + ".preCheckLike", map);
	}

}
