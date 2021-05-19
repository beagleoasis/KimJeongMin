package com.cambak21.service.cambakMall;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProductDetailListVO;
import com.cambak21.domain.ProductDetailOrderVO;
import com.cambak21.persistence.cambakMall.ProdListDAO;
import com.cambak21.util.ProdListPagingCriteria;
import com.cambak21.util.ProdListPagingParam;

@Service
public class ProdListServiceImpl implements ProdListService {
	
	@Inject
	private ProdListDAO dao;
	
	@Override
	public Map<String, Object> prodCategoryList(ProductDetailOrderVO detail, ProdListPagingCriteria cri) throws Exception {
		// 상품 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<ProductDetailListVO> vo = dao.prodCategoryList(detail, cri);
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, - 31);
		Date weekAgo = cal.getTime();
		
		for (int i = 0; i < vo.size(); i++) {
			vo.get(i).setProduct_reviewNum(dao.getProductReviewNum(vo.get(i).getProduct_id())); // 해당 상품의 리뷰 개수 넣기
			
			if (vo.get(i).getProduct_totQty() == 0) {
				vo.get(i).setProduct_info("soldOut");
			} else if (vo.get(i).getProduct_popularProduct().equals("Y")) {
				vo.get(i).setProduct_info("popular");
			} else if (weekAgo.getTime() <= vo.get(i).getProduct_date().getTime()) {
				vo.get(i).setProduct_info("new");
			}
			
		}
		
		param.put("prodList", vo);
		
		
		ProdListPagingParam pp = new ProdListPagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.prodCategoryNum(detail));
		param.put("paging", pp);
		
		// 인기 상품 6개 출력
		param.put("popularList", dao.popularProdList());
		
		return param;
	}

	@Override
	public Map<String, Object> prodSearchList(ProductDetailOrderVO detail, String keyword, ProdListPagingCriteria cri) throws Exception {
		// 상품 검색 결과 리스트 페이지 출력
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<ProductDetailListVO> vo = dao.prodSearchList(detail, keyword, cri);
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, - 31);
		Date weekAgo = cal.getTime();
		
		for (int i = 0; i < vo.size(); i++) {
			vo.get(i).setProduct_reviewNum(dao.getProductReviewNum(vo.get(i).getProduct_id())); // 해당 상품의 리뷰 개수 넣기
			
			if (vo.get(i).getProduct_totQty() == 0) {
				vo.get(i).setProduct_info("soldOut");
			} else if (vo.get(i).getProduct_popularProduct().equals("Y")) {
				vo.get(i).setProduct_info("popular");
			} else if (weekAgo.getTime() <= vo.get(i).getProduct_date().getTime()) {
				vo.get(i).setProduct_info("new");
			}
			
		}
		
		param.put("prodList", vo);
		
		int resultNum = dao.prodSearchNum(detail, keyword);
		ProdListPagingParam pp = new ProdListPagingParam();
		pp.setCri(cri);
		pp.setTotalCount(resultNum);
		param.put("paging", pp);
		
		// 인기 상품 6개 출력
		param.put("popularList", dao.popularProdList());
		param.put("searchResultNum", resultNum);
		
		return param;
	}


}
