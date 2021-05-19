package com.cambak21.persistence.prodReviewsLike;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ProdReviewsLikeDAOImpl implements ProdReviewsLikeDAO {

	@Inject
	private SqlSession ses;
	private static final String namespace ="com.cambak21.mapper.ProdReviewsLikeMapper";
	
	@Override
	public void create(String id, int bno) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("bno", bno);
		ses.insert(namespace + ".create", param);
	}

	@Override
	public void updateLikeCnt(int prodReview_no) throws Exception {
		ses.update(namespace + ".updateLikeCnt", prodReview_no);
	}

	@Override
	public void delete(String id, int bno) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("bno", bno);
		ses.delete(namespace + ".delete", param);
	}

	@Override
	public void deleteLikeCnt(int prodReview_no) throws Exception {
		ses.update(namespace + ".deleteLikeCnt", prodReview_no);
	}

}
