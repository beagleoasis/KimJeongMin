package com.cambak21.persistence.prodReviewsLike;


public interface ProdReviewsLikeDAO {

	// like를 눌렀을 때,
	// (1)ProdReviewsLike 테이블 인서트
	public void create(String id, int bno) throws Exception;
	
	// (2)해당 글의 like 수 1 증가
	public void updateLikeCnt(int prodReview_no) throws Exception;
	
	// unlike를 눌렀을 때
	// (1)해당 like 데이터를 delete
	public void delete(String id, int bno) throws Exception;
	
	// (2)like 수 1 감소
	public void deleteLikeCnt(int prodReview_no) throws Exception;
	
}
