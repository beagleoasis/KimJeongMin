package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;
import com.cambak21.persistence.cambakMall.MainDAO;



@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO dao;
	
	
	@Override
	public List<mallMainTopCountDTO> getNewProduct4(int i) throws Exception {
		
		return dao.getNewProduct4(i);
	}


	@Override
	public List<mallMainTotalDTO> getTotalCount() throws Exception {
		
		return dao.getTotalCount();
	}


	@Override
	public List<mallMainTopCountDTO> getTopReview() throws Exception {
		
		return dao.getTopReview();
	}


	@Override
	public List<mallMainTopCountDTO> getTopSelling() throws Exception {
		return dao.getTopSelling();
	}


	@Override
	public List<mallMainTopCountDTO> countReviews() throws Exception {
		return dao.countReviews();
	}


	@Override
	public int getStar(int id) throws Exception {
		if(dao.checkReview(id) != 0) {
			return dao.getStar(id);
		}
		return 0;
	}


	@Override
	public ProductsVO getBasicInfo(int id) throws Exception {
	
		return dao.getBasicInfo(id);
	}


	@Override
	public String getProduct_img(int id) throws Exception {
		
		return dao.getProduct_img(id);
	}


	@Override
	public InsertintoBucketDTO getProductAll(int product_id) throws Exception {
		
		return dao.getProductAll(product_id);
	}


	@Override
	public int getTotalReviewsNum(int id) throws Exception {
		
		return dao.getTotalReviewsNum(id);
	}



}
