package com.cambak21.service.cambakAdmin;

import java.util.List;
import java.util.Map;

import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.AdminMemberListVO;
import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;

import com.cambak21.domain.ProductAnalysisVO;

import com.cambak21.domain.OrderManagementSearchVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.BoardAdminSearchCriteria;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueEachWeekVO;
import com.cambak21.domain.RevenueMonthVO;
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
import com.cambak21.util.PagingCriteria;

public interface adminService {

	
	// ======================================== 도연 ============================================================================
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception;
	
	public int getTotMemberCnt() throws Exception;
	
	public boolean deleteMember(String member_id) throws Exception;
	
	public boolean updateMember(UpdateAdminMemberDTO dto) throws Exception;
	
	public List<MemberVO> memberSearch(AdminMemberListVO vo, PagingCriteria cri) throws Exception;
	
	public int getmemberSearchCnt(AdminMemberListVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	public RevenueVO getDayRevenue() throws Exception;

	public List<RevenueVO> getPerDayRevenue(int dateVal)throws Exception;

	public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception;

	public List<RevenueMonthVO> selectMonthly(int revenueMonthly) throws Exception;

	public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception;

	public RevRefundVO thisMonthRevenue() throws Exception;

	public RevRefundVO prevMonthRevenue() throws Exception;

	public RevRefundVO thisMonthRefund() throws Exception;

	public RevRefundVO prevMonthRefund() throws Exception;

	public RevRefundVO thisWeekRevenue() throws Exception;

	public RevRefundVO prevWeekRevenue() throws Exception;

	public RevRefundVO thisWeekRefund() throws Exception;

	public RevRefundVO prevWeekRefund() throws Exception;
	
	public RevenueEachWeekVO selectEachWeek(int revenueWeekly)throws Exception;
	
	public RevenueEachWeekVO selectEachWeekRefund(int revenueWeekly)throws Exception;
	
	public List<ProductAnalysisVO> productAnalysis(int perDate)throws Exception;
	
	public List<RevenueVO> productSelectDate(String startDate, String endDate)throws Exception;
	
	

		
//		---------------------------------------------- 대기 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 승권 ==============================================================================
		// 상품 등록
		int insertProduct(ProductsVO vo) throws Exception;
		
		ProductsVO getProduct(String product_id) throws Exception;
		
		int updateProduct(ProductsVO vo) throws Exception;
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		
		
		public List<AdminProdQADTO> getAdmin_ProdQA(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception;

		public List<AdminProdReviewDTO> getAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception;

		public List<AdminReplyProdReviewDTO> getAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception;
		
		public List<AdminProdQADTO> searchgetAdmin_ProdQA(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception;

		public List<AdminProdReviewDTO> searchgetAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception;
		
		public List<AdminReplyProdReviewDTO> searchgetAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception;
		
		public int ProdQA_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception;
		
		public int ProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception;
		
		public int ReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception;
		
		public int searchProdQA_adminCnt_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception;
		
		public int searchProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception;

		public int searchReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception;
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		// 페이징 처리한 productList 출력
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception;
		
		// 게시물 총 개수
		public int getTotalProdListCnt() throws Exception;
		
		// 검색된 게시글 총 개수
		public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception;
		
		// 검색 게시글 목록 출력
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception;
		
		// ajax 방식으로 메인카테고리 목록 가져오기
		public List<MainCategoryVO> getMainCategories() throws Exception;
		
		// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
		public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception;

		// deleteProdList
		public String deleteProdList(List<String> prodList) throws Exception;
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		public List<AdminBoardDTO> goGetBoard_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception;

		public List<AdminReplyBoardDTO> goGetreply_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception;
		
		public List<AdminBoardDTO> searchGetBoard_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception;
		
		public List<AdminReplyBoardDTO> searchGetreply_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc) throws Exception;
		
		public int getTodayTotCnt() throws Exception;
	
		public int getTodayreplyTotCnt() throws Exception;
		
		public int getBoard_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception;
		
		public int getReply_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception;
		
		public int getsearchBoard_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception;
		
		public int getsearchReply_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception;
		
		public void deleteBoardAdmin(int no) throws Exception;

		public void deleteReplyAdmin(int no) throws Exception;
		
		public List<BoardVO> admin_PreviewRead(int no) throws Exception;
		
		public List<ReplyBoardVO> replyBoard_admin_Preview(int no) throws Exception;
		
		public void recoveryReplyBoard(int recoveryNum) throws Exception;

		public void recoveryBoard(int recoveryNum) throws Exception;
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
		
		public Map<String, Object> readOrderList(PagingCriteria cri) throws Exception;
		
		public Map<String, Object> orderManageSearch(OrderManagementSearchVO vo, PagingCriteria cri) throws Exception;

		public Map<String, Object> readBuyOrderInfo(int payment_no) throws Exception;
		
		public boolean modifyDestinationInfo(OrderDetailDestinationModifyDTO dto, int payment_no) throws Exception;
		
		public boolean orderStatusModi(int payment_no, OrderInfoModifyDTO dto) throws Exception;


		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
