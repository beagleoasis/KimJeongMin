package com.cambak21.service.boardCampingReview;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;

import com.cambak21.dto.InsertCRBoardDTO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.UpdateCRBoardDTO;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.persistence.boardCampingReview.BoardCampingReviewDAO;

import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class CampingReviewServiceImpl implements CampingReviewService {

	@Inject
	private BoardCampingReviewDAO dao;
	
	@Transactional
	@Override
	public int writeBoardCR(InsertCRBoardDTO dto) throws Exception {
		// 글 작성
		dao.writeBoardCR(dto);
		
		// 해당 글 번호 반환
		return dao.getBoard_no(dto.getMember_id());
	}

	@Override
	public int modiBoardCR(UpdateCRBoardDTO dto) throws Exception {
		return dao.modiBoardCR(dto);
	}

	@Override
	public int deleteBoardCR(int board_no) throws Exception {
		return dao.deleteBoardCR(board_no);
	}

	/**
	  * @Method Name : listBoardCS
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 리스트 페이징
	  * @param cri : 페이징 객체
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> listBoardCampingReview(PagingCriteria cri) throws Exception {
		return dao.listBoardCampingReview(cri);
	}

	@Override
	public void boardCRLikeUpdate(int board_no) throws Exception {
		dao.boardCRLikeUpdate(board_no);
	}

	/**
	  * @Method Name : searchListBoardCS
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 검색된 결과 리스트 페이징
	  * @param scri : 검색 객체 (Type, Word)
	  * @param cri : 페이징 객체
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<BoardVO> searchListBoardCR(SearchCriteria scri, PagingCriteria cri) throws Exception {
		
		return dao.searchListBoardCR(scri, cri);
	}

	@Transactional
	@Override
	public BoardVO readBoardCampingReview(int board_no) throws Exception {
		dao.boardCRViewUpdate(board_no);
		
		return dao.readBoardCampingReview(board_no);
		
	}

	/**
	  * @Method Name : boardCStotalCnt
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 페이징을 위한 게시글 총 수 가져오기
	  * @return
	  * @throws Exception
	  */
	@Override
	public int boardCRtotalCnt() throws Exception {
		
		return dao.boardCRtotalCnt();
	}

	/**
	  * @Method Name : searchBoardCStotalCnt
	  * @작성일 : 2021. 3. 15.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 검색결과 페이징을 위한...
	  * @param scri : 검색 객체 (Type, Word)
	  * @return
	  * @throws Exception
	  */
	@Override
	public int searchBoardCnt(SearchCriteria scri) throws Exception {
		
		return dao.searchBoardCnt(scri);
	}

}
