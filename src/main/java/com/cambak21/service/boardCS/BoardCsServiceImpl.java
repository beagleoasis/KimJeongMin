package com.cambak21.service.boardCS;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardCsVO;
import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.persistence.boardCS.BoardCsDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class BoardCsServiceImpl implements BoardCsService {

	@Inject
	private BoardCsDAO dao;

	@Transactional
	@Override
	public int writeBoardCS(InsertCSBoardDTO dto) throws Exception {
		// 글 작성
		dao.writeBoardCS(dto);

		// 해당 글 번호 반환
		return dao.getBoard_no(dto.getMember_id());
	}

	@Override
	public int modiBoardCS(UpdateCSBoardDTO dto) throws Exception {
		return dao.modiBoardCS(dto);
	}

	@Override
	public int deleteBoardCS(int board_no) throws Exception {
		return dao.deleteBoardCS(board_no);
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
	public List<BoardCsVO> listBoardCS(PagingCriteria cri) throws Exception {
		return dao.listBoardCS(cri);
	}

	@Override
	public void boardCSLikeUpdate(int board_no) throws Exception {
		dao.boardCSLikeUpdate(board_no);
	}

	/**
	 * @Method Name : searchListBoardCS
	 * @작성일 : 2021. 3. 15.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 검색된 결과 리스트 페이징
	 * @param scri : 검색 객체 (Type, Word)
	 * @param cri  : 페이징 객체
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<BoardCsVO> searchListBoardCS(SearchCriteria scri, PagingCriteria cri) throws Exception {

		return dao.searchListBoardCS(scri, cri);
	}

	/**
	  * @Method Name : readBoardCS
	  * @작성일 : 2021. 4. 3.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param board_no : 게시글 번호
	  * @param status : 쿠키 존재여부
	  * @return
	  * @throws Exception
	  */
	@Transactional
	@Override
	public BoardCsVO readBoardCS(int board_no, String status) throws Exception {
		// 쿠키가 존재하지 않는다면 조회수 1 증가 처리
		if(status.equals("noExist")) {
			dao.boardCSViewUpdate(board_no);
		}
		
		return dao.readBoardCS(board_no);

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
	public int boardCStotalCnt() throws Exception {

		return dao.boardCStotalCnt();
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
	public int searchBoardCStotalCnt(SearchCriteria scri) throws Exception {

		return dao.searchBoardCStotalCnt(scri);
	}

	@Override
	public String prevNo(int board_no) throws Exception {
		return dao.prevNo(board_no);
	}

	@Override
	public String nextNo(int board_no) throws Exception {
		return dao.nextNo(board_no);
	}

	/**
	 * @Method Name : insertLikeBoard
	 * @작성일 : 2021. 3. 26.
	 * @작성자 : 승권
	 * @변경이력 :
	 * @Method 설명 : 게시글 추천하기
	 * @param dto : member_id와 board_no가 담긴 객체
	 * @return
	 * @throws Exception
	 */
	@Transactional
	@Override
	public Map<String, Object> insertLikeBoard(InsertLikeBoard dto) throws Exception {
		// 반환값이 null이면 좋아요 누르지 않은 글, else 이면 누른 글
		Map<String, Object> map = new HashMap<String, Object>();

		if (dao.checkLike(dto) == null) {
			dao.insertLikeBoard(dto);
			dao.updatePlusLikeCnt(dto);
			map.put("status", "on");
			map.put("cnt", dao.getLikeCnt(dto));
		} else {
			dao.deleteLikeBoard(dto);
			dao.updateMinusLikeCnt(dto);
			map.put("status", "off");
			map.put("cnt", dao.getLikeCnt(dto));
		}

		return map;
	}

	/**
	  * @Method Name : preCheckLike
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param dto
	  * @return
	  * @throws Exception
	  */
	@Override
	public int preCheckLike(String member_id, int board_no) throws Exception {
		return dao.preCheckLike(member_id, board_no);
	}

}
