package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.util.ProdListPagingCriteria;

public interface ProdListDAO {
	
	// 상품 리스트 페이지 출력
	public List<ProductDetailListVO> prodCategoryList(ProductDetailOrderVO detail, ProdListPagingCriteria cri) throws Exception;
	
	// 상품 리스트 총 개수 출력
	public int prodCategoryNum(ProductDetailOrderVO detail) throws Exception;
	
	// 상품 리뷰 개수 가져오기
	public int getProductReviewNum(int product_id) throws Exception;
	
	// 상품 검색 결과 리스트 페이지 출력
	public List<ProductDetailListVO> prodSearchList(ProductDetailOrderVO detail, String keyword, ProdListPagingCriteria cri) throws Exception;
	
	// 상품 검색 결과 리스트 총 개수 출력
	public int prodSearchNum(ProductDetailOrderVO detail, String keyword) throws Exception;
	
	// 캠박몰 인기 상품 6개 출력
	public List<ProductDetailListVO> popularProdList() throws Exception;
	
}
