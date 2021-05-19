package com.cambak21.service.resell;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.persistence.resell.ResellBoardLikeDAO;
@Service
public class ResellBoardLikeServiceImpl implements ResellBoardLikeService {
	@Inject
	private ResellBoardLikeDAO dao;
	@Override
	public boolean ResellBoardLikeInsert(ResellLikeBoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardLikeInsert(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean ResellBoardLikeDelete(ResellLikeBoardVO vo) throws Exception {
		boolean result = false;
		int i = dao.ResellBoardLikeDelete(vo);
		if (i == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public int ResellBoardLikeCnt(ResellLikeBoardVO vo) throws Exception {

		return dao.ResellBoardLikeCnt(vo);
	}

	@Override
	public ResellLikeBoardVO ResellBoardlikeRead(ResellLikeBoardVO vo) throws Exception {
		return dao.ResellBoardlikeRead(vo);
	}

}
