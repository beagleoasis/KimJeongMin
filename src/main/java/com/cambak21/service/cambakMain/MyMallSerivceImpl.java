package com.cambak21.service.cambakMain;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.BuyProductPaymentVO;
import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.CheckReviewVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.domain.MyPointVO;
import com.cambak21.domain.MyQAVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.RefundVO;
import com.cambak21.domain.paymentVO;
import com.cambak21.persistence.cambakMain.MyMallDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class MyMallSerivceImpl implements MyMallService {
	
	@Inject
	private MyMallDAO dao;

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public int getTotalRefund(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalRefund(member_id);
	}
	
	@Override
	public List<RefundVO> getRefundList(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getRefundList(member_id, cri);
	}
	@Override
	public int getTotalOrder(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalOrder(member_id);
	}
	@Override
	public List<BuyProductPaymentVO> getTotalOrderList(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalOrderList(member_id, cri);
	}
	
	// 내 주문내역 검색
	@Override
	public List<BuyProductPaymentVO> searchOrder(SearchCriteria scri, PagingCriteria cri, String member_id) throws Exception {
		
		return dao.searchOrder(scri, cri, member_id);
	}
	
	@Override
	public int searchOrderCnt(SearchCriteria scri, String member_id) throws Exception {
		
		return dao.searchOrderCnt(scri, member_id);
	}
	
	@Override
	public BuyProductVO getOrder(String member_id, int payment_serialNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getOrder(member_id, payment_serialNo);
	}
	
	@Override
	public int getDest(String member_id, int buyProduct_no) throws Exception {
		
		return dao.getDest(member_id, buyProduct_no);
	}
	
	@Override
	public DestinationVO getDestOne(int destNo) throws Exception {
		
		return dao.getDestOne(destNo);
	}
	
	@Override
	public int getPayno(String member_id, int buyProduct_no) throws Exception {
		
		return dao.getPayno(member_id, buyProduct_no);
	}
	
	@Override
	public PayInfoVO getPayInfo(int payInfo_no) throws Exception {
		
		return dao.getPayInfo(payInfo_no);
	}
	
	@Override
	public void purchaseSubmit(int payInfo_no, String payment_date) throws Exception {
		dao.purchaseSubmit(payInfo_no, payment_date);
		
	}

	@Override
	public void changePointDate(String member_id, String payment_date) throws Exception {
		dao.changePointDate(member_id, payment_date);
		
	}
	@Override
	public int getPointVal(String member_id, String payment_date) throws Exception {
		
		return dao.getPointVal(member_id, payment_date);
	}

	@Override
	public void plusPoint(String member_id, int pointVal) throws Exception {
		dao.plusPoint(member_id, pointVal);
		
	}
	
	@Override
	public CheckReviewVO checkReview(String member_id,
			int buyProduct_no) throws Exception {
		
		return dao.checkReview(member_id, buyProduct_no);
	}
	
	@Override
	public int plusTotPurchase(int payment_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.plusTotPurchase(payment_no);
	}
	
	@Override
	public void insertTotPurchase(String member_id, int totPrice) throws Exception {
		dao.insertTotPurchase(member_id, totPrice);
		
	}
	
	@Override
	public int getpaymentNoCnt(int payment_no) throws Exception {
		
		return dao.getpaymentNoCnt(payment_no);
	}

	@Override
	public List<paymentVO> getPaymentSerialNo(int payment_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPaymentSerialNo(payment_no);
	}

	@Override
	public void insertRnE(int serialNo, String member_id, String refundnExchange_reason, String refundnExchange_status)
			throws Exception {
		// TODO Auto-generated method stub
		dao.insertRnE(serialNo, member_id, refundnExchange_reason, refundnExchange_status);
	}

	@Override
	public void changePayComit(String refundnExchange_status, int payment_no) throws Exception {
		// TODO Auto-generated method stub
		dao.changePayComit(refundnExchange_status, payment_no);
		
	}

	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 마이페이지-나의 적립금 포인트 적립내역 가져오기
	@Override
	public List<MyPointVO> getPointList(String member_id, PagingCriteria cri) throws Exception {
		return dao.getPointList(member_id, cri);
	}
	
	// 마이페이지-나의 적립금 총 게시물 개수 가져오기
	@Override
	public int getPointListCnt(String member_id) throws Exception {
		return dao.getPointListCnt(member_id);
	}
	
	// 마이페이지-나의 적립금 총 보유 포인트 가져오기
	@Override
	public int getTotMyPoint(String member_id) throws Exception {
		return dao.getTotMyPoint(member_id);
	}
	// 마이페이지-나의 적립금 총 적립예정 포인트 가져오기
	@Override
	public int getTotMyFuturePoint(String member_id) throws Exception {
		return dao.getTotMyFuturePoint(member_id);
	}
	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	  * @Method Name : getMyQAList
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 게시글 가져오기
	  * @param member_id : 현재 로그인한 회원 아이디
	  * @return
	  * @throws Exception
	  */
	@Override
	public List<MyQAVO> getMyQAList(String member_id) throws Exception {
		return dao.getMyQAList(member_id);
	}
	
	/**
	  * @Method Name : getQaCnt
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : goott6
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @return
	  * @throws Exception
	  */
	@Override
	public int getQaCnt(String member_id) throws Exception {
		return dao.getQaCnt(member_id);
	}
	
	/**
	  * @Method Name : getProdQAVO
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 답변 가져오기
	  * @param member_id
	  * @param prodQA_no
	  * @return
	  * @throws Exception
	  */
	@Override
	public ProdQAVO getProdQAVO(int prodQA_no) throws Exception {
		return dao.getProdQAVO(prodQA_no);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	

	
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public List<MemberLittleOrderVO> MemberLittleOrder(PagingCriteria cri, String userName) {
		// TODO Auto-generated method stub
		return dao.MemberLittleOrder(cri, userName);
	}

	@Override
	public MemberOrderVO MemberDetailOrder(int serialNo, String userName) throws Exception {
		// TODO Auto-generated method stub
		return dao.MemberDetailOrder(serialNo, userName);
	}

	
	

	
	
	
	
	

	

	

	
	
	
	

	

	

	

	

	

	

	

	
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
