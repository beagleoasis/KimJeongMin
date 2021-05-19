package com.cambak21.service.cambakMain;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageAllCountVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.persistence.cambakMain.MyPostingDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class MyPostingServiceImpl implements MyPostingService {
	
	@Inject
	private MyPostingDAO dao;
	
	
	/**
	  * @Method Name : getMyLikePostng
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 좋아요 누른 글
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyLikeBoardListVO> getMyLikePostng(String member_id, PagingCriteria cri, String category) throws Exception {
		return dao.getMyLikePostng(member_id, cri, category);
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
		return dao.getMyLikePostngCnt(member_id, category);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	  * @Method Name : getMyPosting
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 글
	  * @param member_id
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> getMyPosting(String member_id, PagingCriteria cri, String board_category) throws Exception {

		
		return dao.getMyPosting(member_id, cri, board_category);
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
		return dao.getMyPostingCnt(member_id, board_category);
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
		return dao.getMyResellPosting(member_id, cri, category);
	}

	/**
	  * @Method Name : getMyPageResellList
	  * @작성일 : 2021. 04. 05.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :마이페이지 중고장터 총 게시글 수
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	
	@Override
	public int getMyPageResellList(String member_id, String category) throws Exception {
		return dao.getMyPageResellList(member_id, category);
	}

	/**
	  * @Method Name : getMyResellReply
	  * @작성일 : 2021. 04. 05.
	  * @작성자 : Kim Jeong Min
	  * @변경이력 : 
	  * @Method 설명 :마이페이지 중고장터 총 댓글 수
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<ReplyResellVO> getMyResellReply(String member_id, PagingCriteria cri, String category) throws Exception {
		return dao.getMyResellReply(member_id, cri, category);
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
		return dao.getMyResellCnt(member_id);
	}

	//--------------------------------------------------------------- 서효원 service ---------------------------------------------------------------
	
	
	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 
	  * @param member_id
	  * @param board_category
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyPageReplyVO> myWriteReply(String member_id, String board_category, PagingCriteria cri) throws Exception {
		// 내가 작성한 댓글 가져오기
		return dao.myWriteReply(member_id, board_category, cri);
	}

	/**
	  * @Method Name : myWriteReply
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 댓글 기본 검색 
	  * @param member_id
	  * @param board_category
	  * @param cri
	  * @return
	  * @throws Exception
	  */
	@Override
	public int myReplyTotal(String member_id, String board_category) throws Exception {
		// 가져온 내 댓글 총 개수
		return dao.myReplyTotal(member_id, board_category);
	}
	
	@Override
	public MyPageAllCountVO myPageAllCount(String member_id) throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 게시글, 댓글, 좋아요, 문의 개수 가져오기
		
		MyPageAllCountVO vo = new MyPageAllCountVO();
		vo.setBoardCnt(dao.bringBoardCnt(member_id));
		vo.setReplyCnt(dao.bringReplyCnt(member_id));
		vo.setLikeCnt(dao.bringLikeCnt(member_id));
		vo.setMyQuestion(dao.bringMyQuestion(member_id));
		
		return vo;
	}
	
	
	//--------------------------------------------------------------- 서효원 service ---------------------------------------------------------------
	
	
	
	
	
	
	//--------------------------------------------------------------- 박종진 service ---------------------------------------------------------------

	

	/**
	  * @Method Name : getCheckList
	  * @작성일 : 2021. 3. 16.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 갖고 오기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 지우기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :체크리스트 수정하기
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
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 : 체크리스트 등록하기
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<CheckListVO> resisterCheckList(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	//--------------------------------------------------------------- 박종진 service ---------------------------------------------------------------















































	
	
	
	
	
	
	
	
	
	
	
}
