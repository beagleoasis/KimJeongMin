package com.cambak21.persistence.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class MyMallDAOImpl implements MyMallDAO {
	
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.mappers.cambakMain.MyMallMapper";
	private static String nsOrder ="com.mapper.MemberOrderMapper";
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public int getTotalRefund(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".getTotalRefund", member_id);
	}
	
	

	@Override
	public List<RefundVO> getRefundList(String member_id, PagingCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("pageStart", cri.getListCount(1));
		params.put("perPageNum", cri.getPerPageNum());
		System.out.println(params);
		return ses.selectList(ns + ".getRefundList", params);
	}

	@Override
	public int getTotalOrder(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".getTotalOrder", member_id);
	}
	
	@Override
	public List<BuyProductPaymentVO> getTotalOrderList(String member_id, PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		return ses.selectList(ns + ".getTotalOrderList", params);
	}
	
	@Override
	public List<BuyProductPaymentVO> searchOrder(SearchCriteria scri, PagingCriteria cri, String member_id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("searchWord", scri.getSearchWord());
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".searchOrder", params);
	}
	@Override
	public int searchOrderCnt(SearchCriteria scri, String member_id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", scri.getSearchWord());
		params.put("member_id", member_id);
		return ses.selectOne(ns + ".searchOrderCnt" , params);
	}
	
	@Override
	public BuyProductVO getOrder(String member_id, int payment_serialNo) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("payment_serialNo", payment_serialNo);
		
		return ses.selectOne(ns + ".getOrder", params);
	}

	@Override
	public int getDest(String member_id, int buyProduct_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("buyProduct_no", buyProduct_no);
		return ses.selectOne(ns +".getDest", params);
	}
	@Override
	public DestinationVO getDestOne(int destination_no) throws Exception {
		
		return ses.selectOne(ns + ".getDestOne", destination_no);
	}

	@Override
	public int getPayno(String member_id, int buyProduct_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("buyProduct_no", buyProduct_no);
		return ses.selectOne(ns + ".getPayno", params);
	}
	
	@Override
	public PayInfoVO getPayInfo(int payInfo_no) throws Exception {
		
		return ses.selectOne(ns + ".getPayInfo", payInfo_no);
	}

	@Override
	public void purchaseSubmit(int payInfo_no, String payment_date) throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("payInfo_no", payInfo_no);
		params.put("payment_date", payment_date);
		ses.update(ns + ".purchaseSubmit", params);
	}
	@Override
	public void changePointDate(String member_id, String payment_date) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("payment_date", payment_date);
		ses.update(ns + ".changePointDate", params);
		
	}
	
	@Override
	public int getPointVal(String member_id, String payment_date) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("payment_date", payment_date);
		return ses.selectOne(ns + ".getPointVal", params);
		
	}

	@Override
	public void plusPoint(String member_id, int pointVal) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("pointVal", pointVal);
		ses.update(ns + ".plusPoint", params);
		
	}

	// 정민
	@Override
	public CheckReviewVO checkReview(String member_id,
			int buyProduct_no) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("buyProduct_no", buyProduct_no);
		return ses.selectOne(ns + ".checkReview", params);
	}
	
	@Override
	public int plusTotPurchase(int payment_no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".plusTotPurchase", payment_no);
	}
	
	@Override
	public void insertTotPurchase(String member_id, int totPrice) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("totPrice", totPrice);
		
		ses.update(ns + ".insertTotPurchase", params);
	}
	
	@Override
	public int getpaymentNoCnt(int payment_no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectOne(ns + ".getpaymentNoCnt", payment_no);
	}
	
	@Override
	public List<paymentVO> getPaymentSerialNo(int payment_no) throws Exception {
		// TODO Auto-generated method stub
		return ses.selectList(ns + ".getPaymentSerialNo", payment_no);
	}
	
	@Override
	public void insertRnE(int serialNo, String member_id, String refundnExchange_reason,
			String refundnExchange_status) throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("member_id", member_id);
		params.put("serialNo", serialNo);
		params.put("refundnExchange_reason", refundnExchange_reason);
		params.put("refundnExchange_status", refundnExchange_status);
		
		ses.insert(ns + ".insertRnE", params);
	}
	
	@Override
	public void changePayComit(String refundnExchange_status, int payment_no) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("refundnExchange_status", refundnExchange_status);
		params.put("payment_no", payment_no);
		
		ses.update(ns +".changePayComit", params);
		
	}
	
	


	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 마이페이지-나의 적립금 포인트 적립 내역 가져오기
	@Override
	public List<MyPointVO> getPointList(String member_id, PagingCriteria cri) throws Exception {

	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("member_id", member_id);
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".getPointList", params);
	}
	
	// 마이페이지-나의 적립금 총 게시물 개수 가져오기
	@Override
	public int getPointListCnt(String member_id) throws Exception {
		return ses.selectOne(ns + ".getPointListCnt", member_id);
	}
	// 마이페이지-나의 적립금 총 보유 포인트 가져오기
	@Override
	public int getTotMyPoint(String member_id) throws Exception {
		return ses.selectOne(ns + ".getTotMyPoint", member_id);
	}
	// 마이페이지-나의 적립금 총 적립예정 포인트 가져오기
	@Override
	public int getTotMyFuturePoint(String member_id) throws Exception {
		return ses.selectOne(ns + ".getTotMyFuturePoint", member_id);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	  * @Method Name : getMyQAList
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 내가 작성한 상품문의 가져오기
	  * @return List<MyQAVO> : 내가 작성 상품문의 리스트
	  * @throws Exception
	  */
	@Override
	public List<MyQAVO> getMyQAList(String member_id) throws Exception {
		return ses.selectList(ns + ".getListProdQa", member_id);
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
		return ses.selectOne(ns + ".prodQaCnt", member_id);
	}
	
	/**
	  * @Method Name : getProdQAVO
	  * @작성일 : 2021. 4. 6.
	  * @작성자 : 답변 가져오기
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param member_id
	  * @param prodQA_no
	  * @return
	  * @throws Exception
	  */
	@Override
	public ProdQAVO getProdQAVO(int prodQA_no) throws Exception {
		return ses.selectOne(ns + ".getAnswer", prodQA_no);
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@






	


	

	
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	@Override
	public List<MemberLittleOrderVO> MemberLittleOrder(PagingCriteria cri, String userName) {
		System.out.println("userName : "+userName+"\n PageStart"+cri.getPageStart()+"\n PerPageNum"+cri.getPerPageNum());
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userName", userName);
		param.put("pageStert", cri.getPageStart());
		param.put("pageNum", cri.getPerPageNum());
		return ses.selectList(nsOrder+".MemberLittleOrder",param);
	}



	@Override
	public MemberOrderVO MemberDetailOrder(int serialNo, String userName) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("serialNo", serialNo);
		param.put("userName", userName);
		return ses.selectOne(nsOrder+".MemberDetailOrder",param);
	}



	


	



	


	


	



	




	


	


	
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
