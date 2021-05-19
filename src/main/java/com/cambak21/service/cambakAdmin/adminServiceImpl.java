package com.cambak21.service.cambakAdmin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambak21.domain.AdminMemberListVO;
import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;
import com.cambak21.domain.OrderManagementPayInfoVO;
import com.cambak21.domain.ProductAnalysisVO;

import com.cambak21.domain.OrderManagementSearchVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueEachWeekVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
import com.cambak21.dto.AdminBoardDTO;
import com.cambak21.dto.AdminProdQADTO;
import com.cambak21.dto.AdminProdReviewDTO;
import com.cambak21.dto.AdminProductListDTO;
import com.cambak21.dto.AdminReplyBoardDTO;
import com.cambak21.dto.AdminReplyProdReviewDTO;
import com.cambak21.dto.OrderDetailDestinationModifyDTO;
import com.cambak21.dto.OrderInfoModifyDTO;
import com.cambak21.persistence.cambakAdmin.AdminDAO;
import com.cambak21.util.BoardAdminSearchCriteria;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;


@Service
public class adminServiceImpl implements adminService {
	@Inject
	private AdminDAO dao;

	
	// ======================================== 도연 ============================================================================
	
	@Override
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception {
		return dao.getMember(cri);
	}
	
	@Override
	public int getTotMemberCnt() throws Exception {
		return dao.getTotMemberCnt();
	}
	
	@Override
	public boolean deleteMember(String member_id) throws Exception {
		boolean result = false;
		
		int i = dao.deleteMember(member_id);
		
		if(i == 1) {
			result = true;
		}
		
		return result;	
	}
	
	@Override
	public boolean updateMember(UpdateAdminMemberDTO dto) throws Exception {
		boolean result = false;
		
		int i = dao.updateMember(dto);
		
		if(i == 1) {
			result = true;
		}
		
		return result;	
	}
	
	@Override
	public List<MemberVO> memberSearch(AdminMemberListVO vo, PagingCriteria cri) throws Exception {
		return dao.memberSearch(vo, cri);
	}
	
	@Override
	public int getmemberSearchCnt(AdminMemberListVO vo) throws Exception {
		return dao.getmemberSearchCnt(vo);
	}
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	   
	   @Override
	   public RevenueVO getDayRevenue() throws Exception {
	      
	      return dao.getDayRevenue();
	   }


	   @Override
	   public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
	      
	      return dao.getPerDayRevenue(dateVal);
	   }


	   @Override
	   public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
	      
	      return dao.selectDate(startDate, endDate);
	   }
	   
	   @Override
		public List<RevenueVO> productSelectDate(String startDate, String endDate) throws Exception {
			// TODO Auto-generated method stub
			return dao.productSelectDate(startDate, endDate);
		}

		


	   @Override
	   public List<RevenueMonthVO> selectMonthly(int revenueMonthly) throws Exception {
	      System.out.println("서비스 : " + revenueMonthly);
	      return dao.selectMothly(revenueMonthly);
	   }


	   @Override
	   public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
	      
	      System.out.println(dao.selectWeekly(revenueWeekly).toString());
	      return dao.selectWeekly(revenueWeekly);
	      
	   }


	   @Override
	   public RevRefundVO thisMonthRevenue() throws Exception {
	      
	      return dao.thisMonthRevenue();
	   }


	   @Override
	   public RevRefundVO prevMonthRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevMonthRevenue();
	   }


	   @Override
	   public RevRefundVO thisMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisMonthRefund();
	   }


	   @Override
	   public RevRefundVO prevMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevMonthRefund();
	   }


	   @Override
	   public RevRefundVO thisWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisWeekRevenue();
	   }


	   @Override
	   public RevRefundVO prevWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevWeekRevenue();
	   }


	   @Override
	   public RevRefundVO thisWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.thisWeekRefund();
	   }


	   @Override
	   public RevRefundVO prevWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return dao.prevWeekRefund();
	   }
	   
	   @Override
		public RevenueEachWeekVO selectEachWeek(int revenueWeekly) throws Exception {
			
			return dao.selectEachWeek(revenueWeekly);
		}
		
		@Override
		public RevenueEachWeekVO selectEachWeekRefund(int revenueWeekly) throws Exception {
			// TODO Auto-generated method stub
			return dao.selectEachWeekRefund(revenueWeekly);
		}

		@Override
		public List<ProductAnalysisVO> productAnalysis(int perDate) throws Exception {
			
			return dao.productAnalysis(perDate);
		}

		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
	   /**
		  * @Method Name : insertProduct
		  * @작성일 : 2021. 4. 28.
		  * @작성자 : goott6
		  * @변경이력 : 
		  * @Method 설명 :
		  * @param vo
		  * @return
		  * @throws Exception
		  */
		@Override
		public int insertProduct(ProductsVO vo) throws Exception {
			return dao.insertProduct(vo);
		}
		
		@Override
		public ProductsVO getProduct(String product_id) throws Exception {
			return dao.getProduct(product_id);
		}
		
		@Override
		public int updateProduct(ProductsVO vo) throws Exception{
			return dao.updateProduct(vo);
		}
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================

		@Override
		public List<AdminProdQADTO> getAdmin_ProdQA(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception {
			return dao.getAdmin_ProdQA(BAcri1, pc);
		}

		@Override
		public List<AdminProdReviewDTO> getAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			return dao.getAdmin_ProdReviewlst(BAcri1, pc);
		}

		@Override
		public List<AdminReplyProdReviewDTO> getAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			return dao.getAdmin_ReplyProdReviewlst(BAcri1, pc);
		}

		@Override
		public List<AdminProdQADTO> searchgetAdmin_ProdQA(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			return dao.searchgetAdmin_ProdQA(BAcri2, pc);
		}

		@Override
		public List<AdminProdReviewDTO> searchgetAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			return dao.searchgetAdmin_ProdReviewlst(BAcri2, pc);
		}

		@Override
		public List<AdminReplyProdReviewDTO> searchgetAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri2,
				PagingCriteria pc) throws Exception {
			return dao.searchgetAdmin_ReplyProdReviewlst(BAcri2, pc);
		}

		@Override
		public int ProdQA_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			return dao.ProdQA_adminCnt(BAcri1);
		}

		@Override
		public int ProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			return dao.ProdReviewlst_adminCnt(BAcri1);
		}

		@Override
		public int ReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			return dao.ReplyProdReviewlst_adminCnt(BAcri1);
		}

		@Override
		public int searchProdQA_adminCnt_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			return dao.searchProdQA_adminCnt_adminCnt(BAcri2);
		}

		@Override
		public int searchProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			return dao.searchProdReviewlst_adminCnt(BAcri2);
		}

		@Override
		public int searchReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			return dao.searchReplyProdReviewlst_adminCnt(BAcri2);
		}

		
				
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
		// 페이징 처리한 productList 출력
		@Override
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception {
			return dao.prodList(cri);
		}
		
		// 게시물 총 개수 가져오기
		@Override
		public int getTotalProdListCnt() throws Exception {
			return dao.getTotalProdListCnt();
		}
		
		// 검색한 결과의 총 게시글 수
		@Override
		public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception {
			return dao.getTotalSearchProdListCnt(scri, dto);
		}
		
		// 검색한 결과 리스트 가져오기
		@Override
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception {
			return dao.goSearchProdList(scri,cri, dto);
		}

		
		// ajax를 통한 메인 카테고리 리스트 출력
		@Override
		public List<MainCategoryVO> getMainCategories() throws Exception {
			return dao.getMainCategories();
		}

		// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
		@Override
		public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception {
			return dao.getMiddleCategories(mainCategory_id);
		}
		
		// deleteProdList
		@Override
		public String deleteProdList(List<String> prodList) throws Exception {
			return dao.deleteProdList(prodList);
		}
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		

		@Override
		public List<AdminBoardDTO> goGetBoard_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception {
			// TODO Auto-generated method stub
			return dao.goGetBoard_admin(BAcri1, pc);
		}
		
		@Override
		public List<AdminReplyBoardDTO> goGetreply_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception {
			// TODO Auto-generated method stub
			return dao.goGetreply_admin(BAcri1, pc);
		}
		
		@Override
		public List<AdminBoardDTO> searchGetBoard_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception {
			
			return dao.searchGetBoard_admin(BAcri2, pc);
		}
		
		@Override
		public List<AdminReplyBoardDTO> searchGetreply_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception {
			
			return dao.searchGetreply_admin(BAcri2, pc);
		}

		public int getTodayTotCnt() throws Exception {
			
			return dao.getTodayTotCnt();
		}
		
		public int getTodayreplyTotCnt() throws Exception {
			
			return dao.getTodayreplyTotCnt();
		}
		
		
		public int getBoard_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception{
			return dao.getBoard_adminCnt(BAcri1);
		}
			
		public int getReply_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception{
			return dao.getReply_adminCnt(BAcri1);
		}
	
		public int getsearchBoard_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception{
			return dao.getsearchBoard_adminCnt(BAcri2);
		}
			
		public int getsearchReply_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception{
			return dao.getsearchReply_adminCnt(BAcri2);
		}
		
		@Transactional
		@Override
		public void deleteBoardAdmin(int no) throws Exception {
			dao.deleteBoardAdmin(no);
			dao.deleteReplyBoardAdmin(no);
			
		}
		@Override
		public void deleteReplyAdmin(int no) throws Exception {
		
			dao.deleteReplyAdmin(no);
			
		}
		
		@Override
		public List<BoardVO> admin_PreviewRead(int no) throws Exception {
			return dao.admin_PreviewRead(no);
		}
	

		@Override
		public List<ReplyBoardVO> replyBoard_admin_Preview(int no) throws Exception {
			return dao.replyBoard_admin_Preview(no);
		}
		
		@Override
		public void recoveryReplyBoard(int recoveryNum) throws Exception {
			dao.recoveryReplyBoard(recoveryNum);
			
		}

		@Override
		public void recoveryBoard(int recoveryNum) throws Exception {
			dao.recoveryBoard(recoveryNum);
			
		}


		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
	@Override
	public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<AdminOrderListVO> vo = dao.readOrderList(cri);
		
		for (int i = 0; i < vo.size(); i++) {
			vo.get(i).setOrderProductNum(dao.orderProductNum(vo.get(i).getPayment_no()) - 1); // 해당 상품의 리뷰 개수 넣기
			vo.get(i).setBuyProduct_totPrice(dao.orderTotalPrice(vo.get(i).getPayment_no())); // 해당 주문의 총 결제 금액 넣기
		}
		
		param.put("orderList", vo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.readOrderListNum());
		param.put("paging", pp);
		
		return param;
	}

	@Override
	public Map<String, Object> orderManageSearch(OrderManagementSearchVO vo, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		List<AdminOrderListVO> lst = dao.orderManageSearch(vo, cri);
		
		for (int i = 0; i < lst.size(); i++) {
			lst.get(i).setOrderProductNum(dao.orderProductNum(lst.get(i).getPayment_no()) - 1); // 해당 상품의 리뷰 개수 넣기
			lst.get(i).setBuyProduct_totPrice(dao.orderTotalPrice(lst.get(i).getPayment_no())); // 해당 주문의 총 결제 금액 넣기
		}
		
		param.put("orderList", lst);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(dao.orderManageSearchNum(vo));
		param.put("paging", pp);
		
		return param;
	}

	@Override
	public Map<String, Object> readBuyOrderInfo(int payment_no) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 주문자 정보 가져오기
		param.put("buyerInfo", dao.readBuyerInfo(payment_no));
		
		// 배송지 정보 가져오기
		param.put("destinationInfo", dao.readDestinationInfo(payment_no));
		
		// 주문/결제 금액 정보 가져오기
		OrderManagementPayInfoVO payInfo = dao.readPayInfo(payment_no);
		payInfo.setPayment_no(payment_no);
		param.put("payInfo", payInfo);
		
		// 주문 배송상태, 구매 확정 정보 가져오기
		param.put("orderStatusInfo", dao.readOrderStatusInfo(payment_no));
		
		// 주문 교환, 환불 요청 여부 가져오기
		
		if (dao.readOrderRequestNum(payment_no) == 0) {
			param.put("orderRequestInfo", "noRequest");
		} else {
			param.put("orderRequestInfo", dao.readOrderRequestInfo(payment_no));
		}
		
		// 전체 주문 상품 정보 가져오기
		param.put("orderProductInfo", dao.readOrderProductInfo(payment_no));
		
		return param;
	}

	@Override
	public boolean modifyDestinationInfo(OrderDetailDestinationModifyDTO dto, int payment_no) throws Exception {
		boolean result = false;
		if (dao.modifyDestinationInfo(dto) != 0) if (dao.modifyDestinationMsg(dto.getPayment_deliveryMsg(), payment_no) != 0) result = true;
		return result;
	}

	@Override
	public boolean orderStatusModi(int payment_no, OrderInfoModifyDTO dto) throws Exception {
		boolean result = true;
		String delivery_status = "";
		String payment_isComit = "";
		String payment_isChecked = "";
		Date orderDate = dao.getOrderDate(payment_no);
		
		int payment_serialNo = dao.getOrderSerialNo(payment_no);
		
		if (dto.getDeliveryInfo().equals("orderDeliveryReady")) delivery_status = "배송전";
		else if (dto.getDeliveryInfo().equals("orderOnDelivery")) delivery_status = "배송중";
		else if (dto.getDeliveryInfo().equals("orderDeliveryCompleted")) delivery_status = "배송완료";
		
		// 배송 상태 업데이트
		if (dao.modifyDeliveryInfo(payment_serialNo, delivery_status) == 0) result = false;
		
		if (!dto.getPurchaseStatus().equals("noChange")) {
			
			if (dto.getPurchaseStatus().equals("purchaseConfirmationBefore")) {
				payment_isComit = "결제완료";
				payment_isChecked = "N";
				
				String tmpDate = "2000-12-31 00:00:00";
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date defaultDate = format.parse(tmpDate);
				
				if (dao.modifyPurchaseConfirmationBefore(orderDate, defaultDate) == 0) result = false;
			} else if (dto.getPurchaseStatus().equals("purchaseConfirmation")) {
				payment_isComit = "결제완료";
				payment_isChecked = "Y";
				if (dao.modifyPurchaseConfirmation(orderDate) == 0) result = false;
			}
			
			// 구매 확정 업데이트
			if (dao.modifyPurchaseInfo(payment_no, payment_isComit, payment_isChecked) == 0) result = false;
		}
		
		if (!dto.getCsStatus().equals("noRequest")) {
			String modifyContent = "";
			String isChecked = "Y";
			String point_reason = "";
			PointVO pointHistory = dao.getOrderUsedPoint(orderDate);
			
			// 주문 취소, 환불 시 상품 판매 재고 변경
			if (dto.getCsStatus().equals("csCancelRequest") || dto.getCsStatus().equals("csRefundRequest")) {
				List<Integer> buyProductList = dao.getOrderBuyProductList(payment_no);
				
				for (int i = 0; i < buyProductList.size(); i++) {
					List<BuyProductVO> productIdList = dao.getOrderProductIdList(buyProductList.get(i));
					
					for (int j = 0; i < productIdList.size(); i++) {
						if (dao.modifyProductQty(productIdList.get(j).getBuyProduct_qty(), productIdList.get(j).getProduct_id()) == 0) result = false;
					}
				}
			}
			
			// 교환, 취소, 환불 처리
			if (dto.getCsStatus().equals("csCancelCompleted")) {
				List<Integer> paymentSerialNoList = dao.getOrderProductSerialNo(payment_no);
				modifyContent = "주문취소완료";
				point_reason = "주문취소";
				
				if(dao.infoCanclePoint(point_reason, pointHistory) == 0) result = false;
				if(dao.changeMemberPoint(pointHistory) == 0) result = false;
				
				for (int i = 0; i < paymentSerialNoList.size(); i++) {
					if (dao.modifyCsStatusRnE(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
					if(dao.modifyCsStatusPayment(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
				}
			} else if (dto.getCsStatus().equals("csChangeCompleted")) {
				List<Integer> paymentSerialNoList = dao.getOrderProductSerialNo(payment_no);
				modifyContent = "교환완료";
				
				for (int i = 0; i < paymentSerialNoList.size(); i++) {
					if (dao.modifyCsStatusRnE(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
					if(dao.modifyCsStatusPayment(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
				}
			} else if (dto.getCsStatus().equals("csRefundCompleted")) {
				List<Integer> paymentSerialNoList = dao.getOrderProductSerialNo(payment_no);
				modifyContent = "환불완료";
				point_reason = "환불";
				
				if(dao.infoCanclePoint(point_reason, pointHistory) == 0) result = false;
				if(dao.changeMemberPoint(pointHistory) == 0) result = false;
				
				for (int i = 0; i < paymentSerialNoList.size(); i++) {
					if (dao.modifyCsStatusRnE(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
					if(dao.modifyCsStatusPayment(paymentSerialNoList.get(i), modifyContent, isChecked) == 0) result = false;
				}
			}
			
			String grade_name = "";
			int totalPay = dao.memberTotalPayment(pointHistory.getMember_id());
			
			if (totalPay < 100000) grade_name = "C";
			else if (totalPay < 300000 && totalPay > 100000) grade_name = "B";
			else if (totalPay < 500000) grade_name = "A";
			
			if(dao.updateMemberGrade(pointHistory.getMember_id(), grade_name) == 0) result = false;
		}
		
		return result;
	}




	


		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
