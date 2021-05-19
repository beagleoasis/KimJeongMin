package com.cambak21.service.BoardHumor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.persistence.boardHumor.BoardHumorDAO;
import com.cambak21.persistence.boardHumor.BoardHumorReplyDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class BoardHumorServiceImpl implements BoardHumorService{

	@Inject
	private BoardHumorDAO dao;
	
	@Inject
	private BoardHumorReplyDAO rdao;
	
	@Override
	public boolean insertBoardHumor(BoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.insertBoardHumor(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO readBoardHumor(int no) throws Exception {
		
		
		return dao.readBoardHumor(no);
	}
	
	@Override
	public void updateViewCnt(int no) throws Exception {
		dao.updateViewCnt(no);
		
	}


	@Override
	public boolean modifyBoardHumor(BoardVO vo) throws Exception {
		boolean result = false;
		
		int i = dao.updateBoardHumor(vo);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean removeBoardHumor(int no) throws Exception {
		boolean result = false;
		
		int i = dao.deleteBoardHumor(no);
		rdao.deleteAll(no);
		if(i == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public List<BoardVO> listBoardHumorCriteria(PagingCriteria cri) throws Exception {
		
		return dao.listBoardHumorCriteria(cri);
	}

	@Override
	public int getTotalBoardHumorCnt() throws Exception {
		
		return dao.getTotalBoardHumorCnt();
	}

	@Override
	public List<BoardVO> goSearch(SearchCriteria scri, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		
		return dao.goSearchBoardHumor(scri, cri);
	}

	@Override
	public int searchBoardCnt(SearchCriteria scri) throws Exception {
		
		return dao.searchBoardHumorCnt(scri);
	}

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

	@Override
	public Integer preCheckLike(String member_id, int board_no) {
		
		return dao.preCheckLike(member_id, board_no);
	}

	

	

}
