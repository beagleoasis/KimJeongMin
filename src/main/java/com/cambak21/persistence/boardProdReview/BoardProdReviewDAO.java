package com.cambak21.persistence.boardProdReview;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.dto.ProdReviewWritingInfoDTO;
import com.cambak21.util.PagingCriteria;

public interface BoardProdReviewDAO {

	// 게시글 작성
	public int insert(ProdReviewVO vo) throws Exception;
	
	// 전체 글 출력
	public List<ProdReviewVO> listProdBoard(int product_id) throws Exception;
	
	// 페이징
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id, String orderList) throws Exception;
	
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception;
	
	// 전체 게시글 수 가져오기
	public int getTotalBoardCnt(int product_id) throws Exception;

	
	// 게시글 상세 조회
	public ProdReviewVO readProdBoard(int no) throws Exception;

	// 게시글 수정
	public int updateProdBoard(ProdReviewVO vo) throws Exception;

	// 게시글 작성, 수정 시 상품 평점 업데이트
	public int updateProductAvgStarScore(int product_id) throws Exception;
	
	// 게시글 삭제 시 업데이트
	public int deleteProductAvgStarScore(int prodId) throws Exception;
	
	// 게시글 삭제
	public int deleteProdBoard(int prodReview_no) throws Exception;

	// 게시글 좋아요 인서트
	public void insertLikeProdReviews(String member_id, int prodReview_no) throws Exception;
	// 게시글 좋아요 후 게시판 좋아요 카운트 1증가
	public void updateLikeProdReviews(int prodReview_no) throws Exception;
	
	// 게시글 좋아요 가져오기
	public int getProdReviewsLike(String member_id, int prodReview_no) throws Exception;
	
	// 게시글 좋아요 취소하기
	public void deleteLikeProdReviews(String member_id, int prodReview_no) throws Exception;
	// 취소 후 카운트 1 감소
	public void updateDisLikeProdReviews(int prodReview_no) throws Exception;
	
	// 게시글 좋아요 수 가져오기
	public int getProdReviewsLikeCnt(int prodReview_no) throws Exception;
	
	// 주문 확정된 개수 가져오기
	public String getConfirmedOrder(String member_id, int prodId) throws Exception;

	// 해당 상품 평균 별점 가져오기
	public int getStarRating(int product_id) throws Exception;

	// 상품후기 게시글 작성을 위한 prodId, buyProduct_no 가져오기
	public ProdReviewWritingInfoDTO getReviewInfo(int payment_serialNo) throws Exception;



	
	// 아이디, 상품번호로 해당 상품에 작성된 후기 수 가져오기
	//public int getWrittenReviewCnt(String member_id, int prodId) throws Exception;
	
	
	// 검색 결과 전체 글 수 가져오기
	//public int getSearchCount(SearchCriteria scri) throws Exception;
	
	//public List<ProdReviewVO> goSearch(SearchCriteria scri, PagingCriteria cri) throws Exception;
	
	// 게시글에 답글이 달렸을 때, 답글 수 update
	//public void updateReply(int no, int amount) throws Exception;
	
	
}
