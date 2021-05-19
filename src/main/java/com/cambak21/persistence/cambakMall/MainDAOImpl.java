package com.cambak21.persistence.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Inject
	private SqlSession ses;
	private static String namespace = "com.cambak21.mappers.mallMainMapper";
	
	@Override
	public List<mallMainTopCountDTO> getNewProduct4(int no) throws Exception {
		
		return ses.selectList(namespace + ".getNewProduct4", no);
	}
	
	public List<mallMainTotalDTO> getTotalCount() throws Exception {
		return ses.selectList(namespace + ".getTotalCount");
	}

	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
	
		return ses.selectList(namespace + ".getTopReview");
	}

	@Override
	public List<mallMainTopCountDTO> getTopSelling() throws Exception {
		return ses.selectList(namespace + ".getTopSelling");
	}

	@Override
	public List<mallMainTopCountDTO> countReviews() throws Exception {
		return ses.selectList(namespace + ".countReviews");
	}

	@Override
	public int getStar(int id) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(namespace + ".getStar", id);
	}

	@Override
	public int checkReview(int id) throws Exception {
		
		return ses.selectOne(namespace + ".checkReview", id);
	}

	@Override
	public ProductsVO getBasicInfo(int id) throws Exception {
		return ses.selectOne(namespace + ".getBasicInfo", id);
	}

	@Override
	public String getProduct_img(int id) throws Exception {
		return ses.selectOne(namespace + ".getProduct_img", id);
	}

	@Override
	public InsertintoBucketDTO getProductAll(int product_id) throws Exception {
	
		return ses.selectOne(namespace + ".getProductAll", product_id);
	}

	@Override
	public int getTotalReviewsNum(int id) throws Exception {
		
		return ses.selectOne(namespace + ".getTotalReviewsNum", id);
	}


}
