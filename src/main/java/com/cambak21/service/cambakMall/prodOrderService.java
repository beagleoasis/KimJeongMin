package com.cambak21.service.cambakMall;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.OrderCompleteInfoSessionVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.PaymentsInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.orderCompleteInfoVO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface prodOrderService {
	
	
	// 김대기 DAO -->
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
	
	public DestinationVO selectDestOne(int destination_no) throws Exception;
	
	public DestinationVO defaultDest(String member_id) throws Exception;

	// 장원영 service
	public List<ProdInfoVO> prodOrderInfo(String member_id) throws Exception;
	
	public int payInfo(PayInfoVO vo) throws Exception;
	
	public int payInfoNo() throws Exception;
	
	public boolean payInfoSave(PaymentsInfoVO vo, int payment_no, int serialNo) throws Exception;
  	
	public int readSerialNo() throws Exception;
	
	public orderCompleteInfoVO orderCompleteInfo(OrderCompleteInfoSessionVO vo) throws Exception;
	
	// 결제 완료 시 멤버 토탈 포인트 업데이트
	public int controllTotPoint(int usePointNum, String member_id) throws Exception;
	
	public MemberVO refreshLoginMember(int payment_no) throws Exception;
	
//  	<!-- 김도연 DAO -->
  	
  	
//  	<!-- 김정민 DAO -->
  	
  	
//  	<!-- 김태훈 DAO -->
  	public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception;
  	public int prodBoardReadAllCnt()throws Exception;
  	public List<ProductsVO> prodBoardRead(PagingCriteria cri,SearchCriteria scri) throws Exception;
  	public int prodBoardReadCnt(SearchCriteria scri)throws Exception;
  	public List<ProductsVO> prodBoardSearch(PagingCriteria cri,SearchCriteria scri) throws Exception;
  	public int prodBoardSearchId(SearchCriteria scri)throws Exception;
  	
//  	<!-- 백승권 DAO -->
  	
  	
//  	<!-- 서효원 DAO -->
  	
  	
//  	<!-- 박종진 DAO -->
  	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception;
  	
  	public boolean defaultModyAjax(String member_id, int dstno) throws Exception;

  	public boolean deleteDestiny(String member_id, int dstno) throws Exception;

  	public boolean destiModyAjax(DestinationVO vo) throws Exception;

  	public boolean insertDestiny(DestinationVO vo) throws Exception;

  	public DestinationVO GetModifydst(int dstno) throws Exception;


  	
//  	<!-- 이영광 DAO -->
}
