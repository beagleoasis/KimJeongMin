package com.cambak21.service.cambakMall;

import java.text.*;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.OrderCompleteInfoSessionVO;
import com.cambak21.domain.PayInfoVO;
import com.cambak21.domain.PaymentsInfoVO;
import com.cambak21.domain.ProdInfoVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.orderCompleteInfoVO;
import com.cambak21.domain.paymentVO;
import com.cambak21.dto.PaymentInfoSave;
import com.cambak21.dto.savePointHistoryDTO;
import com.cambak21.persistence.cambakMall.prodOrderDAO;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

@Service
public class prodOrderServiceImpl implements prodOrderService {
	@Inject
	private prodOrderDAO dao;
	
	// 김대기 DAO -->
	
	//주소록 닉네임들을 가져옴
	@Override
	public List<DestinationVO> selectDestNickName(String member_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectDestNickName(member_id);
	}

	@Override
	public DestinationVO selectDestOne(int destination_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOneDest(destination_no);
	}

	@Override
	public DestinationVO defaultDest(String member_id) throws Exception {
		
		return dao.defaultDest(member_id);
	}
	
//		  	<!-- 장원영 DAO -->
	@Override
	public List<ProdInfoVO> prodOrderInfo(String member_id) throws Exception {

		return dao.prodOrderInfo(member_id);
	}
	
	@Override
	public int payInfo(PayInfoVO vo) throws Exception {
		
		return dao.payInfo(vo);
		
	}

	@Override
	public int payInfoNo() throws Exception {
	
		return dao.payInfoNo();
	}
	
	@Override
	public int readSerialNo() throws Exception {
		return dao.readSerialNo();
	}
	
	@Override
	public orderCompleteInfoVO orderCompleteInfo(OrderCompleteInfoSessionVO vo) throws Exception {
		orderCompleteInfoVO infoVO = dao.orderCompleteInfo(vo.getPayment_no());
		infoVO.setTotPrice(vo.getTotPrice());
		infoVO.setPayment_no(vo.getPayment_no());
		
		return infoVO;
	}
	
	@Transactional
	@Override
	public boolean payInfoSave(PaymentsInfoVO vo, int payment_no, int serialNo) throws Exception {
		boolean result = false;
		Date payTime = new Date();
		System.out.println(vo.toString());
		
		
		if (vo.getBuyProduct_no1() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no1());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no1())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no1()) == 0) return false;
		}
		if (vo.getBuyProduct_no2() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no2());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no2())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no2()) == 0) return false;
		}
		if (vo.getBuyProduct_no3() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no3());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no3())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no3()) == 0) return false;
		}
		if (vo.getBuyProduct_no4() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no4());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no4())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no4()) == 0) return false;
		}
		if (vo.getBuyProduct_no5() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no5());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no5())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no5()) == 0) return false;
		}
		if (vo.getBuyProduct_no6() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no6());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no6())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no6()) == 0) return false;
		}
		if (vo.getBuyProduct_no7() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no7());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no7())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no7()) == 0) return false;
		}
		if (vo.getBuyProduct_no8() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no8());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no8())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no8()) == 0) return false;
		}
		if (vo.getBuyProduct_no9() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no9());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no9())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no9()) == 0) return false;
		}
		if (vo.getBuyProduct_no10() != 0) {
			PaymentInfoSave tmpVo = new PaymentInfoSave();
			tmpVo.setPayment_no(payment_no);
			tmpVo.setMember_id(vo.getMember_id());
			tmpVo.setPayInfo_no(vo.getPayInfo_no());
			tmpVo.setDestination_no(vo.getDestination_no());
			tmpVo.setPayment_date(payTime);
			tmpVo.setBuyProduct_no(vo.getBuyProduct_no10());
			tmpVo.setPayment_deliveryMsg(vo.getPayment_deliveryMsg());
			if (dao.orderInfoSave(tmpVo) == 0) return false;
			if (dao.updateStockNum(dao.searchProductNo(vo.getBuyProduct_no10())) == 0) return false;
			if (dao.updateOrderFinish(vo.getBuyProduct_no10()) == 0) return false;
		}
		
		if (dao.makeDeliveryInfo(serialNo) == 0) return false;
		
		savePointHistoryDTO dto = new savePointHistoryDTO();
		
		dto.setMember_id(vo.getMember_id());
		dto.setGrade_name(vo.getGrade_name());
		dto.setPoint_usedPoint(vo.getUsePointNum());
		dto.setPoint_futurePoint(vo.getSavePointNum());
		dto.setPayment_date(payTime);
		
		if (dao.savePointHistory(dto) == 0) return false;
		if (dao.deleteBucketHistory(vo.getMember_id()) == 0) return false;
		
		result = true;
		return result;
	}
		  	
	@Override
	public MemberVO refreshLoginMember(int payment_no) throws Exception {
		return dao.refreshLoginMember(payment_no);
	}
	
	// 결제 완료 시 멤버 토탈 포인트 업데이트
	@Override
	public int controllTotPoint(int usePointNum, String member_id) throws Exception {
		return dao.controllTotPoint(usePointNum, member_id);
	}


//		  	<!-- 김도연 DAO -->
		  	
		  	
//		  	<!-- 김정민 DAO -->
		  	
		  	
//		  	<!-- 김태훈 DAO -->
		@Override
		public List<ProductsVO> prodBoardReadAll(PagingCriteria cri) throws Exception {
			cri.setPerPageNum(9);
			List<ProductsVO>  vo = dao.prodBoardReadAll(cri);
			return vo;
		}
	
		@Override
		public int prodBoardReadAllCnt() throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardReadAllCnt();
		}

		@Override
		public List<ProductsVO> prodBoardRead(PagingCriteria cri, SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardRead(cri,scri);
		}

		@Override
		public int prodBoardReadCnt(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardReadCnt(scri);
		}
		
		@Override
		public List<ProductsVO> prodBoardSearch(PagingCriteria cri, SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardSearch(cri,scri);
		}

		@Override
		public int prodBoardSearchId(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return dao.prodBoardSearchId(scri);
		}

			  	
//		  	<!-- 백승권 DAO -->
		  	
		  	
//		  	<!-- 서효원 DAO -->
		  	
		  	
//		  	<!-- 박종진 DAO -->

	@Override
	public List<DestinationVO> destinationsListAjax(String member_id) throws Exception {
			return dao.destinationsListAjax(member_id);
	}

	@Override
	public boolean defaultModyAjax(String member_id, int destination_no) throws Exception {
			boolean result = false;
			int i = 0;
			i = dao.defaultModyAjax(member_id, destination_no);
			if(i >= 1) {
				result = true;
			}
			return result;
	}

	@Override
	public boolean destiModyAjax(DestinationVO vo) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.destiModyAjax(vo);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean insertDestiny(DestinationVO vo) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.insertDestiny(vo);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteDestiny(String member_id, int destination_no) throws Exception {
		boolean result = false;
		int i = 0;
		i = dao.deleteDestiny(member_id, destination_no);
		if(i >= 1) {
			result = true;
		}
		return result;
	}

	@Override
	public DestinationVO GetModifydst(int dstno) throws Exception {
		return dao.GetModifydst(dstno);
	}

	

	



	
		  	
//		  	<!-- 이영광 DAO -->
}
