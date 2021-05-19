package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;

public interface MainDAO {
	
		public List<mallMainTopCountDTO> getNewProduct4(int i) throws Exception;
	
		public List<mallMainTotalDTO> getTotalCount() throws Exception;
		
		public List<mallMainTopCountDTO> getTopReview() throws Exception;
		
		public List<mallMainTopCountDTO> getTopSelling() throws Exception;
		
		public List<mallMainTopCountDTO> countReviews() throws Exception;
		
		public int getStar(int id) throws Exception;

		public String getProduct_img(int id) throws Exception;
		
		public int checkReview(int id) throws Exception;
		
		public ProductsVO getBasicInfo(int id) throws Exception;
		
		public InsertintoBucketDTO getProductAll(int product_id) throws Exception;
		
		public int getTotalReviewsNum(int id) throws Exception;
		
		
	}
