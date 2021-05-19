package com.cambak21.service.boardProdReview;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.dto.ProdReviewWritingInfoDTO;
import com.cambak21.persistence.boardProdReview.BoardProdReviewDAO;
import com.cambak21.util.PagingCriteria;

@Service
public class ProdReviewServiceImpl implements ProdReviewService {

	@Inject
	private BoardProdReviewDAO dao;
	


	@Override
	public List<ProdReviewVO> listProdBoard(int product_id) throws Exception {
		return dao.listProdBoard(product_id);
	}



	@Override
	public int insert(ProdReviewVO vo) throws Exception {
		int result = dao.insert(vo);
		
		if (result == 1) {
			dao.updateProductAvgStarScore(vo.getProduct_id());
		}
		return result;
	}

	
	@Override
	public List<ProdReviewVO> listProdBoardCriteria(PagingCriteria cri, int product_id, String orderList) throws Exception {
		return dao.listProdBoardCriteria(cri, product_id, orderList);
	}
	

	@Override
	public List<ProdReviewVO> listProdBoardPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getTotalBoardCnt(int product_id) throws Exception {
		return dao.getTotalBoardCnt(product_id);
	}



	@Override
	public ProdReviewVO readProdBoard(int no) throws Exception {
		return dao.readProdBoard(no);
	}


	// 게시판 수정
		@Override
		public int updateProdBoard(ProdReviewVO vo) throws Exception {
			int result = dao.updateProdBoard(vo);
			System.out.println("Service result : " + result);
			if (result == 1) {
				dao.updateProductAvgStarScore(vo.getProduct_id());
			}
			
			return result;
		}


	// 게시글 삭제
	@Override
	public int deleteProdBoard(int prodReview_no, int prodId) throws Exception {

		int result =0;
		if(dao.deleteProdBoard(prodReview_no)==1) {
			result = 1;
			System.out.println("updateProductAvgStarScore : " + dao.deleteProductAvgStarScore(prodId));
			dao.deleteProductAvgStarScore(prodId);
			System.out.println("Service deleteProdBoard : " + result);
		}
		return result;
		
	}


	// 게시글 좋아요 인서트 및 게시글 좋아요 +1 업데이트/딜리트
	@Override
	public int insertLikeProdReviews(String member_id, int prodReview_no) throws Exception {
		if(dao.getProdReviewsLike(member_id, prodReview_no)==0) {
			//좋아요 인서트 후
			dao.insertLikeProdReviews(member_id, prodReview_no);
			//게시글 좋아요 +1 처리
			dao.updateLikeProdReviews(prodReview_no);
			
			return 1;
		} else {
			//좋아요 삭제 후
			dao.deleteLikeProdReviews(member_id, prodReview_no);
			//게시글 좋아요 -1 처리
			dao.updateDisLikeProdReviews(prodReview_no);
			return 0;
		}
		
	}


	// 게시글 좋아요 가져오기
	@Override
	public int getProdReviewsLike(String member_id, int prodReview_no) throws Exception {
		return dao.getProdReviewsLike(member_id, prodReview_no);
	}


	// 게시글 좋아요 수 가져오기
	@Override
	public int getProdReviewsLikeCnt(int prodReview_no) throws Exception {
		return dao.getProdReviewsLikeCnt(prodReview_no);
	}

	// 주문 확정된 개수 가져오기

	@Override
	public String getConfirmedOrder(String member_id, int prodId) throws Exception {
		return dao.getConfirmedOrder(member_id, prodId);
	}


	// 해당 상품 평균 별점 가져오기
	@Override
	public int getStarRating(int product_id) throws Exception {
		return dao.getStarRating(product_id);
	}


	// 상품후기 게시글 작성을 위한 prodId, buyProduct_no 가져오기
	@Override
	public ProdReviewWritingInfoDTO getReviewInfo(int payment_serialNo) throws Exception {
		return dao.getReviewInfo(payment_serialNo);
	}



	// 아이디, 상품번호로 해당 상품에 작성된 후기 수 가져오기
	/*@Override
	public int getWrittenReviewCnt(String member_id, int prodId) throws Exception {
		return dao.getWrittenReviewCnt(member_id, prodId);
	}*/


}
