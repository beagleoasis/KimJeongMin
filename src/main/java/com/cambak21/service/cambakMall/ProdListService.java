package com.cambak21.service.cambakMall;

import java.util.Map;

import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.util.ProdListPagingCriteria;

public interface ProdListService {

	// 상품 리스트 페이지 출력
	public Map<String, Object> prodCategoryList(ProductDetailOrderVO detail, ProdListPagingCriteria cri) throws Exception;
	
	// 상품 검색 결과 리스트 페이지 출력
	public Map<String, Object> prodSearchList(ProductDetailOrderVO detail, String keyword, ProdListPagingCriteria cri) throws Exception;
	
}
