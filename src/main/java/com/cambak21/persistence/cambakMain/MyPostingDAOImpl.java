/**
 * 
 */
package com.cambak21.persistence.cambakMain;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.PagingCriteria;

@Repository
public class MyPostingDAOImpl implements MyPostingDAO {
	
	@Inject
	private SqlSession ses;
	private static String ns = "com.cambak21.mappers.cambakMain.myPostMapper";
	//Resell 카운트용
	private static String names="com.cambak21.mapper.ResellBoardMapper";
	
	
	
	
	
	
	
	
	/**
	  * @Method Name : getMyLikePostng
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 백승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 좋아요 누른 글 리스트 출력, 페이징
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyLikeBoardListVO> getMyLikePostng(String member_id, PagingCriteria cri, String category) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		map.put("category", category);
		return ses.selectList(ns + ".getList", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : getMyLikePostngCnt
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 백승권
	  * @변경이력 : 
	  * @Method 설명 : 페이징 처리 위한 갯수 구하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getMyLikePostngCnt(String member_id, String category) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("category", category);
		return ses.selectOne(ns + ".myLikeBoardCnt", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	

	//--------------------------------------------------------------- 김정민 dao ---------------------------------------------------------------	
	/**
	  * @Method Name : getMyPosting
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :내가 게시한 글 리스트 출력, 페이징
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> getMyPosting(String member_id, PagingCriteria cri, String board_category) throws Exception {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		System.out.println("board_category : " + board_category);
		if(board_category.equals("all")) {

			System.out.println("all : " + param);
			return ses.selectList(ns + ".getMyPosting", param);
		} else {
			param.put("board_category", board_category);
			System.out.println("else : " + param);
			return ses.selectList(ns + ".getMyPostingWithCategory", param);
		}
	}
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : getMyPostingCnt
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 : 페이징 처리 위한 갯수 구하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getMyPostingCnt(String member_id, String board_category) throws Exception {

		System.out.println("board_category : " + board_category);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		System.out.println(param);
		if(board_category.equals("all")) {
			System.out.println("allCnt : " + param);
			return ses.selectOne(ns + ".getMyPostingCnt", param);
		} else {
			param.put("board_category", board_category);
			System.out.println("allCntCategory : " + param);
			return ses.selectOne(ns + ".getMyPostingCntWithCategory", param);
		}
	}
	
	
	/**
	  * @Method Name : getMyResellPosting
	  * @작성일 : 2021. 04. 05.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :마이페이지 중고장터
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ResellBoardVO> getMyResellPosting(String member_id, PagingCriteria cri, String category) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		if(category.equals("myWriting")) {
			return ses.selectList(ns + ".getMyResellPosting", param);
		}else {
			return ses.selectList(ns + ".getMyResellmyLike", param);
		}
		
	}
	
	/**
	  * @Method Name : getMyResellPosting
	  * @작성일 : 2021. 04. 05.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 : 총게시글 수
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	
	@Override
	public int getMyPageResellList(String member_id, String category) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("category", category);
		
		if(category.equals("myWriting")) {
			return ses.selectOne(ns + ".getMyPageResellList", param);
		}else if(category.equals("myReply")) {
			return ses.selectOne(ns + ".getMyResellReplyList", param);
		}else {
			return ses.selectOne(ns + ".getMyResellmyLikeList", param);
		}
	}
	
	/**
	  * @Method Name : getMyResellReply
	  * @작성일 : 2021. 04. 05.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 : 총 댓글
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ReplyResellVO> getMyResellReply(String member_id, PagingCriteria cri, String category) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		return ses.selectList(ns + ".getMyResellReply", param);
	}
	
	
	/**
	  * @Method Name : getMyResellCnt
	  * @작성일 : 2021. 04. 07.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :마이페이지 중고장터 카운트
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public ResellBoardCntVO getMyResellCnt(String member_id) throws Exception {
		// 중고마켓 내가 작성한 글, 좋아요한 글, 내가 작성한 댓글 카운트 가져오기
		ResellBoardCntVO result = new ResellBoardCntVO();
		result.setResellBoardWriteCnt(ses.selectOne(names + ".ResellBoardWriteCnt", member_id));
		result.setResellBoardLikeCnt(ses.selectOne(names + ".ResellBoardLikeCnt", member_id));
		result.setResellBoardReplyCnt(ses.selectOne(names + ".ResellBoardReplyCnt", member_id));
		return result;
	}
	//--------------------------------------------------------------- 서효원 dao ---------------------------------------------------------------
	
	

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 효원
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 페이지
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception {
		// 내가 작성한 댓글 가져오기
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("board_category", board_category);
		param.put("pageStart", cri.getListCount(6));
		param.put("perPageNum", cri.getPerPageNum());
		return ses.selectList(ns + ".readMyReplyList", param);
	}
	
	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 효원
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 페이지
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public int myReplyTotal(String member_id, String board_category) throws Exception {
		// 가져온 내 댓글 총 개수
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("board_category", board_category);
		return ses.selectOne(ns + ".readMyReplyTotal", param);
	}
	
	
	@Override
	public int bringBoardCnt(String member_id) throws Exception {
		// 내가 작성한 총 게시글
		return ses.selectOne(ns + ".bringBoardCnt", member_id);
	}


	@Override
	public int bringResellBoardCnt(String member_id) throws Exception {
		// 내가 작성한 중고마켓 총 게시글
		return ses.selectOne(ns + ".bringResellBoardCnt", member_id);
	}


	@Override
	public int bringReplyCnt(String member_id) throws Exception {
		// 내가 작성한 총 댓글
		return ses.selectOne(ns + ".bringReplyCnt", member_id);
	}



	@Override
	public int bringResellReplyCnt(String member_id) throws Exception {
		// 내가 작성한 중고마켓 총 댓글
		return ses.selectOne(ns + ".bringResellReplyCnt", member_id);
	}



	@Override
	public int bringLikeCnt(String member_id) throws Exception {
		// 내가 작성한 총 좋아요
		return ses.selectOne(ns + ".bringLikeCnt", member_id);
	}



	@Override
	public int bringResellLikeCnt(String member_id) throws Exception {
		// 내가 작성한 중고마켓 총 좋아요
		return ses.selectOne(ns + ".bringResellLikeCnt", member_id);
	}





	@Override
	public int bringMyQuestion(String member_id) throws Exception {
		// 내가 작성한 총 문의글
		return ses.selectOne(ns + ".bringMyQuestion", member_id);
	}
	
	
	//--------------------------------------------------------------- 서효원 dao ---------------------------------------------------------------
	
	

	/**
	  * @Method Name : getCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 얻어오기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> getCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : delCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 삭제하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> delCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : modyCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 수정하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> modyCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/**
	  * @Method Name : resisterCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 종진
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 등록
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}




























































	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}