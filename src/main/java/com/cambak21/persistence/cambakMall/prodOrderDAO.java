package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.changeStockVO;
import com.cambak21.domain.orderCompleteInfoVO;
import com.cambak21.dto.PaymentInfoSave;
import com.cambak21.dto.savePointHistoryDTO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

public interface prodOrderDAO {
	// 김대기 DAO -->
		public List<DestinationVO> selectDestNickName(String member_id) throws Exception;
		
		public DestinationVO selectOneDest(int destination_no) throws Exception;
		
		public DestinationVO defaultDest(String member_id) throws Exception;
//	  	<!-- 장원영 DAO -->
	  	public List<ProdInfoVO> prodOrderInfo(String member_id) throws Exception;
	  	
	  	public int payInfo(PayInfoVO vo) throws Exception;
	  	
	  	public int payInfoNo() throws Exception;
	  	
	  	public int readSerialNo() throws Exception;
	  	
	  	public int orderInfoSave(PaymentInfoSave vo) throws Exception;
	  	
	  	public changeStockVO searchProductNo(int buyProduct_no) throws Exception;
	  	
	  	public int updateStockNum(changeStockVO vo) throws Exception;
	  	
	  	public int makeDeliveryInfo(int serialNo) throws Exception;
	  	
	  	public int savePointHistory(savePointHistoryDTO dto) throws Exception;
	  	
	  	public int deleteBucketHistory(String member_id) throws Exception;
	  	
	  	public int updateOrderFinish(int buyProduct_no) throws Exception;
	  	
	  	public orderCompleteInfoVO orderCompleteInfo(int payment_no) throws Exception;
	  	
	  	public MemberVO refreshLoginMember(int payment_no) throws Exception;
	  	
	 // 결제 완료 시 멤버 토탈 포인트 업데이트
		public int controllTotPoint(int usePointNum, String member_id) throws Exception;

//	  	<!-- 김도연 DAO -->
	  	
	  	
//	  	<!-- 김정민 DAO -->
	  	
	  	
//	  	<!-- 김태훈 DAO -->
	  	public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception;
	  	public int prodBoardReadAllCnt()throws Exception;
	  	public List<ProductsVO> prodBoardRead(PagingCriteria cri,SearchCriteria scri) throws Exception;
	  	public int prodBoardReadCnt(SearchCriteria scri)throws Exception;
	  	public List<ProductsVO> prodBoardSearch(PagingCriteria cri,SearchCriteria scri)throws Exception;
	  	public int prodBoardSearchId(SearchCriteria scri)throws Exception;
//	  	<!-- 백승권 DAO -->
	  	
	  	
//	  	<!-- 서효원 DAO -->
	  	
	  	
//	  	<!-- 박종진 DAO -->
	  	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception;
	  	
	  	public int defaultModyAjax(String member_id, int destination_no) throws Exception;
	  	
	  	public int deleteDestiny(String member_id, int destination_no) throws Exception;
	
	  	public int destiModyAjax(DestinationVO vo) throws Exception;

	  	public int insertDestiny(DestinationVO vo) throws Exception;

	  	public DestinationVO GetModifydst(int dstno) throws Exception;

		

	  	
	  	
	  	
//	  	<!-- 이영광 DAO -->
}
