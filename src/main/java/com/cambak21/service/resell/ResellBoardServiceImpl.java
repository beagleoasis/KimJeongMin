package com.cambak21.service.resell;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.util.PagingCriteria;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.util.SearchCriteria;
import com.cambak21.dto.ResellBoardDeteDTO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.dto.ResellLikeBoardInsertDTO;
import com.cambak21.persistence.resell.ResellBoardDAO;
@Service
public class ResellBoardServiceImpl implements ResellBoardService {
	@Inject
	private ResellBoardDAO dao;
	@Override
	public boolean ResellBoardInsert(ResellBoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardInsert(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<ResellBoardVO> ResellBoardReadAll(PagingCriteria cri) throws Exception {
		cri.setPerPageNum(9);
		List<ResellBoardVO>  vo = dao.ResellBoardReadAll(cri);
		return vo;
	}

	@Override
	public int ResellBoardReadAllCnt() throws Exception {
		return dao.ResellBoardReadAllCnt();
	}

	@Override
	public List<ResellBoardVO> ResellBoardRead(PagingCriteria cri, SearchCriteria scri) throws Exception {
		
		return dao.ResellBoardRead(cri,scri);
	}

	@Override
	public int ResellBoardReadCnt(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.ResellBoardReadCnt(scri);
	}

	@Override
	public boolean ResellBoardUpdate(ResellBoardUpdateDTO dto) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardUpdate(dto);
		if (i == 1) {
			result = true;
		}

		return result;
	}

	@Override
	public boolean ResellBoardDelete(int no) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardDelete(no);
		if (i == 1) {
			result = true;
		}

		return result;
	}

	@Override
	public void ResellBoardViewcnt(int no) throws Exception {
		dao.ResellBoardViewcnt(no);

	}

	@Override
	public void ResellBoardUpdateReply(int no, int amount) throws Exception {
		dao.ResellBoardUpdateReply(no,amount);


	}

	@Override
	public ResellBoardVO ResellBoardReadDetail(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.ResellBoardReadDetail(no);
	}

}
