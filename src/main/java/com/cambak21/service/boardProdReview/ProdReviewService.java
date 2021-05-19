package com.cambak21.service.boardProdReview;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.dto.ProdReviewWritingInfoDTO;
import com.cambak21.util.PagingCriteria;

public interface ProdReviewService {

	// 게시글 작성
		public int insert(ProdReviewVO vo) throws Exception;
		
		// 전체 글 출력
		public List<ProdReviewVO> listProdBoard(int product_id) throws Exception;
		
		// 페이징
		public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id, String orderList) throws Exception;
		
		public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception;

		// 전체 게시글 수 가져오기
		public int getTotalBoardCnt(int product_id) throws Exception;

		// 게시글 조회
		public ProdReviewVO readProdBoard(int no) throws Exception;

		// 게시글 수정
		public int updateProdBoard(ProdReviewVO vo) throws Exception;
		
		// 게시글 삭제
		public int deleteProdBoard(int prodReview_no, int prodId) throws Exception;

		// 게시글 좋아요 인서트
		public int insertLikeProdReviews(String member_id, int prodReview_no) throws Exception;

		// 게시글 좋아요 여부 가져오기
		public int getProdReviewsLike(String member_id, int prodReview_no) throws Exception;
		
		// 게시글 좋아요 수 가져오기
		public int getProdReviewsLikeCnt(int prodReview_no) throws Exception;
		
		// 주문 확정된 개수 확인하기
		public String getConfirmedOrder(String member_id, int prodId) throws Exception;
		
		// 해당 상품 평균 별점 가져오기
		public int getStarRating(int product_id) throws Exception;

		// 상품후기 게시글 작성을 위한 prodId, buyProduct_no 가져오기
		public ProdReviewWritingInfoDTO getReviewInfo(int payment_serialNo) throws Exception;
		
		// 아이디, 상품번호로 해당 상품에 작성된 후기 수 가져오기
		//public int getWrittenReviewCnt(String member_id, int prodId) throws Exception;
		

	
}
