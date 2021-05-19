package com.cambak21.persistence.resell;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ResellLikeBoardVO;
@Repository
public class ResellBoardLikeDAOImpl implements ResellBoardLikeDAO {
	@Inject
	private SqlSession ses;
	private String namespace ="com.cambak21.mapper.ResellBoardLikeMapper";
	@Override
	public int ResellBoardLikeInsert(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.insert(namespace+".ResellBoardLikeInsert",vo);
	}

	@Override
	public int ResellBoardLikeDelete(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.delete(namespace+".ResellBoardLikeDelete",vo);
	}

	@Override
	public int ResellBoardLikeCnt(ResellLikeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace+".ResellBoardLikeCnt",vo);
	}

	@Override
	public ResellLikeBoardVO ResellBoardlikeRead(ResellLikeBoardVO vo) throws Exception {

		return ses.selectOne(namespace+".ResellBoardlikeRead",vo);
	}

}
