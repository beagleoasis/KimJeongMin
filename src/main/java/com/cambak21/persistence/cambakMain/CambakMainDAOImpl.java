package com.cambak21.persistence.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class CambakMainDAOImpl implements CambakMainDAO {
	
	@Inject
	private SqlSession session;
	private static String nameSpace = "com.cambak21.mappers.cambakMain.CambakMainPageMapper.";
	
	
//	=============================효원 DAO=======================================================
	@Override
	public List<CampingVO> randomCambakInfo() throws Exception {
		// 랜덤 캠핑장 조회
		return session.selectList(nameSpace + "randomCapingsite");
	}

	@Override
	public List<BoardVO> readNoticeReview() throws Exception {
		// 메인페이지에 캠핑 리뷰 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readNoticeReview");
	}

	@Override
	public List<BoardVO> readRecentTip() throws Exception {
		// 메인페이지에 캠핑팁 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentTip");
	}

	@Override
	public List<ResellBoardVO> readRecentResell() throws Exception {
		// 메인페이지에 캠박마켓 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentResell");
	}

	@Override
	public List<BoardVO> readRecentQA() throws Exception {
		// 메인페이지에 Q&A 게시판의 최신 게시글 5개 출력
		return session.selectList(nameSpace + "readRecentQA");
	}

	@Override
	public List<String> autoSearch(String keyword) throws Exception {
		// 메인페이지 자동검색
		return session.selectList(nameSpace + "autoSearch", keyword);
	}
	
//	=============================효원 DAO 끝=======================================================
	
//	=============================도연 DAO=======================================================
	@Override
	public List<CampingVO> getCampings(String searchWord, PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", searchWord);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return session.selectList(nameSpace + "getCampings", params);
	}

	@Override
	public int getTotCnt(String keyword) throws Exception {
		return session.selectOne(nameSpace + "getTotCnt", keyword);
	}
	
	@Override
	public int getTotBoardCnt(String searchWord, int flag) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", searchWord);
		params.put("flag", flag);
		
		return session.selectOne(nameSpace + "getTotBoardCnt", params);
	}
	
	@Override
	public List<BoardVO> getBoards(String searchWord, PagingCriteria cri, int flag) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", searchWord);
		params.put("flag", flag);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return session.selectList(nameSpace + "getBoards", params);
	}	
	
	
	
//	=============================도연 DAO 끝=======================================================
	
//	=============================정민 DAO=======================================================
	// 캠핑장 상세 내용 가져오기
	@Override
	public CampingVO getCampingDetail(String camping_contentId) throws Exception {
		
		return session.selectOne(nameSpace +"getCampingDetail", camping_contentId);
	}

	
	
	
	
	
	
	
	
//	=============================정민 DAO 끝=======================================================

}
