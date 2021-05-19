package com.cambak21.persistence.cambakMain;

import java.util.List;

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
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface MyMallDAO {

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 환불내역 총 갯수 가져오기
	public int getTotalRefund(String member_id) throws Exception;
	//환불내역 내용 가져오기
	List<RefundVO> getRefundList(String member_id, PagingCriteria cri) throws Exception;
	// 총 내 주문 가져오기
	public int getTotalOrder(String member_id) throws Exception;
	// 모든 주문내역 가져오기
	public List<BuyProductPaymentVO> getTotalOrderList(String member_id, PagingCriteria cri)throws Exception;
	
	public List<BuyProductPaymentVO> searchOrder(SearchCriteria scri, PagingCriteria cri, String member_id)throws Exception;
	
	public int searchOrderCnt(SearchCriteria scri, String member_id);
	
	public BuyProductVO getOrder(String member_id, int payment_serialNo)throws Exception;
	
	public int getDest(String member_id, int buyProduct_no)throws Exception;
	
	public DestinationVO getDestOne(int destNo)throws Exception;
	
	public int getPayno(String member_id, int buyProduct_no)throws Exception;
	
	public PayInfoVO getPayInfo(int payInfo_no)throws Exception;
	
	public void purchaseSubmit(int payInfo_no, String payment_date)throws Exception;
	
	public void changePointDate(String member_id, String payment_date)throws Exception;
	
	public int getPointVal(String member_id, String payment_date)throws Exception;
	
	public void plusPoint(String member_id, int pointVal)throws Exception;
	
	public CheckReviewVO checkReview(String payment_isComit, int buyProduct_no)throws Exception;

	public int plusTotPurchase(int payment_no)throws Exception;
	
	public void insertTotPurchase(String member_id, int totPrice)throws Exception;
	
	public int getpaymentNoCnt(int payment_no)throws Exception;
	
	public List<paymentVO> getPaymentSerialNo(int payment_no)throws Exception;
	
	public void insertRnE(int serialNo, String member_id, String refundnExchange_reason, String refundnExchange_status)throws Exception;
	
	public void changePayComit(String refundnExchange_status, int payment_no)throws Exception;
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Override
	
	// 마이페이지-나의 적립금 포인트 적립내역 가져오기
	public List<MyPointVO> getPointList(String member_id, PagingCriteria cri) throws Exception;
	// 마이페이지-나의 적립금 총 게시물 개수 가져오기
	public int getPointListCnt(String member_id) throws Exception;
	// 마이페이지-나의 적립금 총 보유 포인트 가져오기
	public int getTotMyPoint(String member_id) throws Exception;
	// 마이페이지-나의 적립금 총 적립예정 포인트 가져오기
	public int getTotMyFuturePoint(String member_id) throws Exception;
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<MyQAVO> getMyQAList(String member_id) throws Exception;
	
	public int getQaCnt(String member_id) throws Exception;
	
	// 답변 가져오기
	public ProdQAVO getProdQAVO(int prodQA_no) throws Exception;



	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@










		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	public List<MemberLittleOrderVO> MemberLittleOrder(PagingCriteria cri,String userName);

	public MemberOrderVO MemberDetailOrder(int serialNo, String userName);
	
	
	
	
	
	
	
	
	
	
	
	
	
	



	


		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
