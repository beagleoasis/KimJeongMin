package com.cambak21.persistence.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.util.ProdListPagingCriteria;

@Repository
public class ProdListDAOImpl implements ProdListDAO {

	@Inject
	private SqlSession session;
	private static String nameSpace = "com.cambak21.mappers.cambakMallMapper.";
	
	@Override
	public List<ProductDetailListVO> prodCategoryList(ProductDetailOrderVO detail, ProdListPagingCriteria cri) throws Exception {
		// 상품 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 필터별 변수
		param.put("mainCategory_id", detail.getMainCategory_id());
		param.put("middleCategory_id", detail.getMiddleCategory_id());
		param.put("priceRangeOrder", detail.getPriceRangeOrder());
		param.put("minPrice", detail.getMinPrice());
		param.put("maxPrice", detail.getMaxPrice());
		param.put("ratingSorter", detail.getRatingSorter());
		param.put("prodScore", detail.getProdScore());
		param.put("prodRankOrder", detail.getProdRankOrder());
		
		// 페이징 변수
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		if (detail.getProdRankOrder().equals("rvRank")) {
			return session.selectList(nameSpace + "prodCategoryReviewOrder", param);
		} else {
			return session.selectList(nameSpace + "prodCategoryList", param);
		}
		
	}

	@Override
	public int prodCategoryNum(ProductDetailOrderVO detail) throws Exception {
		// 상품 리스트 총 개수 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 필터별 변수
		param.put("mainCategory_id", detail.getMainCategory_id());
		param.put("middleCategory_id", detail.getMiddleCategory_id());
		param.put("priceRangeOrder", detail.getPriceRangeOrder());
		param.put("minPrice", detail.getMinPrice());
		param.put("maxPrice", detail.getMaxPrice());
		param.put("ratingSorter", detail.getRatingSorter());
		param.put("prodScore", detail.getProdScore());
		param.put("prodRankOrder", detail.getProdRankOrder());
		
		if (detail.getProdRankOrder().equals("rvRank")) {
			return session.selectOne(nameSpace + "prodCategoryReviewOrderNum", param);
		} else {
			return session.selectOne(nameSpace + "prodCategoryNum", param);
		}
		
	}

	@Override
	public int getProductReviewNum(int product_id) throws Exception {
		// 상품 리뷰 개수 가져오기
		return session.selectOne(nameSpace + "getProductReviewNum", product_id);
	}

	@Override
	public List<ProductDetailListVO> prodSearchList(ProductDetailOrderVO detail, String keyword, ProdListPagingCriteria cri) throws Exception {
		// 상품 검색 결과 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 필터별 변수
		param.put("mainCategory_id", detail.getMainCategory_id());
		param.put("middleCategory_id", detail.getMiddleCategory_id());
		param.put("priceRangeOrder", detail.getPriceRangeOrder());
		param.put("minPrice", detail.getMinPrice());
		param.put("maxPrice", detail.getMaxPrice());
		param.put("ratingSorter", detail.getRatingSorter());
		param.put("prodScore", detail.getProdScore());
		param.put("prodRankOrder", detail.getProdRankOrder());
		
		// 키워드 변수
		param.put("keyword", keyword);
		
		// 페이징 변수
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		if (detail.getProdRankOrder().equals("rvRank")) {
			return session.selectList(nameSpace + "prodCategorySearchReviewOrder", param);
		} else {
			return session.selectList(nameSpace + "prodSearchList", param);
		}
		
	}

	@Override
	public int prodSearchNum(ProductDetailOrderVO detail, String keyword) throws Exception {
		// 상품 검색 결과 리스트 총 개수 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 필터별 변수
		param.put("mainCategory_id", detail.getMainCategory_id());
		param.put("middleCategory_id", detail.getMiddleCategory_id());
		param.put("priceRangeOrder", detail.getPriceRangeOrder());
		param.put("minPrice", detail.getMinPrice());
		param.put("maxPrice", detail.getMaxPrice());
		param.put("ratingSorter", detail.getRatingSorter());
		param.put("prodScore", detail.getProdScore());
		param.put("prodRankOrder", detail.getProdRankOrder());
		
		// 키워드 변수
		param.put("keyword", keyword);
		
		if (detail.getProdRankOrder().equals("rvRank")) {
			return session.selectOne(nameSpace + "prodCategorySearchReviewOrderNum", param);
		} else {
			return session.selectOne(nameSpace + "prodSearchNum", param);
		}
		
	}

	@Override
	public List<ProductDetailListVO> popularProdList() throws Exception {
		// 캠박몰 인기 상품 6개 출력
		return session.selectList(nameSpace + "popularProdList");
	}

}
