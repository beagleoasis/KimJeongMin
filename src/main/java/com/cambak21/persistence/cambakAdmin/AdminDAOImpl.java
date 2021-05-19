package com.cambak21.persistence.cambakAdmin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.cambak21.domain.AdminMemberListVO;
import com.cambak21.domain.AdminOrderListVO;
import com.cambak21.domain.MainCategoryVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.BuyProductVO;
import com.cambak21.domain.DestinationVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MiddleCategoryVO;
import com.cambak21.domain.OrderManagementBuyerInfoVO;
import com.cambak21.domain.OrderManagementDestinationInfoVO;
import com.cambak21.domain.OrderManagementPayInfoVO;
import com.cambak21.domain.ProductAnalysisVO;

import com.cambak21.domain.OrderManagementSearchVO;
import com.cambak21.domain.OrderProductInfoVO;
import com.cambak21.domain.OrderStatusInfo;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.RefundnExchangeVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.RevenueVO;
import com.cambak21.util.BoardAdminSearchCriteria;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.SearchCriteria;

import com.cambak21.domain.RevRefundVO;
import com.cambak21.domain.RevenueEachWeekVO;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.dto.UpdateAdminMemberDTO;
import com.cambak21.dto.AdminBoardDTO;
import com.cambak21.dto.AdminProdQADTO;
import com.cambak21.dto.AdminProdReviewDTO;
import com.cambak21.dto.AdminProductListDTO;
import com.cambak21.dto.AdminReplyBoardDTO;
import com.cambak21.dto.AdminReplyProdReviewDTO;
import com.cambak21.dto.OrderDetailDestinationModifyDTO;
import com.cambak21.util.PagingCriteria;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession ses;
	
	private static String ns = "com.cambak21.mappers.cambakAdmin.adminMapper";
	
	// ======================================== 도연 ============================================================================
	
	@Override
	public List<MemberVO> getMember(PagingCriteria cri) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".getMember", params);
	}
	
	@Override
	public int getTotMemberCnt() throws Exception {
		return ses.selectOne(ns + ".getTotMemberCnt");
	}
	
	@Override
	public int deleteMember(String member_id) throws Exception {
		return ses.update(ns + ".deleteMember", member_id);
	}
	
	@Override
	public int updateMember(UpdateAdminMemberDTO dto) throws Exception {
		return ses.update(ns + ".updateMember", dto);
	}
	
	@Override
	public List<MemberVO> memberSearch(AdminMemberListVO vo, PagingCriteria cri) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberOption", vo.getMemberOption());
		params.put("memberOptionSearchWord", vo.getMemberOptionSearchWord());
		params.put("dateOption", vo.getDateOption());
		params.put("checkLowDate", vo.getCheckLowDate());
		params.put("checkHighDate", vo.getCheckHighDate());
		params.put("PriceOption", vo.getPriceOption());
		params.put("checkHighNum", vo.getCheckHighNum());
		params.put("checkLowNum", vo.getCheckLowNum());
		params.put("genderResult", vo.getGenderResult());
		params.put("AResult", vo.getAResult());
		params.put("BResult", vo.getBResult());
		params.put("CResult", vo.getCResult());
		
		params.put("pageStart", cri.getPageStart());
		params.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".memberSearch", params);
	}
	
	@Override
	public int getmemberSearchCnt(AdminMemberListVO vo) throws Exception {
		return ses.selectOne(ns + ".getmemberSearchCnt", vo);
	}
	
	
	
	
	
	
	
	
//		---------------------------------------------- 도연 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 대기 ==============================================================================
		
	   
	   @Override
	   public RevenueVO getDayRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".getDayRevenue");
	   }

	   @Override
	   public List<RevenueVO> getPerDayRevenue(int dateVal) throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectList(ns + ".getPerDayRevenue", dateVal);
	   }

	   @Override
	   public List<RevenueVO> selectDate(String startDate, String endDate) throws Exception {
	      
	      Map<String, Object> params = new HashMap<String, Object>();
	      params.put("startDate", startDate);
	      params.put("endDate", endDate);
	      
	      return ses.selectList(ns + ".betweenDayRevenue", params);
	   }
	   
	   @Override
		public List<RevenueVO> productSelectDate(String startDate, String endDate) throws Exception {
		   
		      Map<String, Object> params = new HashMap<String, Object>();
		      params.put("startDate", startDate);
		      params.put("endDate", endDate);
			return ses.selectList(ns + ".productSelectDate", params);
		}

	   @Override
	   public List<RevenueMonthVO> selectMothly(int revenueMonthly) throws Exception {
	      System.out.println("다오 : " + revenueMonthly);
	      return ses.selectList(ns +".selectMonthly" , revenueMonthly);
	      
	   }

	   @Override
	   public List<RevenueWeeklyVO> selectWeekly(int revenueWeekly) throws Exception {
	      
	      return ses.selectList(ns + ".selectWeekly", revenueWeekly);
	   }

	   @Override
	   public RevRefundVO thisMonthRevenue() throws Exception {
	      
	      return ses.selectOne(ns + ".thisMonthRevenue");
	      
	   }

	   @Override
	   public RevRefundVO prevMonthRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevMonthRevenue");
	   }

	   @Override
	   public RevRefundVO thisMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisMonthRefund");
	   }

	   @Override
	   public RevRefundVO prevMonthRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevMonthRefund");
	   }

	   @Override
	   public RevRefundVO thisWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisWeekRevenue");
	   }

	   @Override
	   public RevRefundVO prevWeekRevenue() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevWeekRevenue");
	   }

	   @Override
	   public RevRefundVO thisWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".thisWeekRefund");
	   }

	   @Override
	   public RevRefundVO prevWeekRefund() throws Exception {
	      // TODO Auto-generated method stub
	      return ses.selectOne(ns + ".prevWeekRefund");
	   }
	      

		@Override
		public RevenueEachWeekVO selectEachWeek(int revenueWeekly)throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(ns + ".selectEachWeek", revenueWeekly);
		}
		
		@Override
		public RevenueEachWeekVO selectEachWeekRefund(int revenueWeekly) throws Exception {
			// TODO Auto-generated method stub
			return ses.selectOne(ns + ".selectEachWeekRefund", revenueWeekly);
		}

		@Override
		public List<ProductAnalysisVO> productAnalysis(int perDate) throws Exception {
			// TODO Auto-generated method stub
			return ses.selectList(ns + ".productAnalysis", perDate);
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
			return ses.insert(ns + ".insertProduct", vo);
		}
		
		@Override
		public ProductsVO getProduct(String product_id) throws Exception {
			return ses.selectOne(ns + ".getProduct", product_id);
		}
		
		@Override
		public int updateProduct(ProductsVO vo) throws Exception{
			return ses.update(ns + ".updateProduct", vo);
		}
		
		
		
		
		
		
		
		
//		---------------------------------------------- 승권 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 원영 ==============================================================================
		@Override
		public List<AdminProdQADTO> getAdmin_ProdQA(BoardAdminSearchCriteria BAcri1, PagingCriteria pc) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".getAdmin_ProdQA", param);
		}

		@Override
		public List<AdminProdReviewDTO> getAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".getAdmin_ProdReviewlst", param);
		}

		@Override
		public List<AdminReplyProdReviewDTO> getAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".getAdmin_ReplyProdReviewlst", param);
		}

		@Override
		public List<AdminProdQADTO> searchgetAdmin_ProdQA(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchgetAdmin_ProdQA", param);
		}

		@Override
		public List<AdminProdReviewDTO> searchgetAdmin_ProdReviewlst(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchgetAdmin_ProdReviewlst", param);
		}

		@Override
		public List<AdminReplyProdReviewDTO> searchgetAdmin_ReplyProdReviewlst(BoardAdminSearchCriteria BAcri2,
				PagingCriteria pc) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchgetAdmin_ReplyProdReviewlst", param);
		}

		@Override
		public int ProdQA_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
		
			return ses.selectOne(ns + ".ProdQA_adminCnt", param);
		}

		@Override
		public int ProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
		
			return ses.selectOne(ns + ".ProdReviewlst_adminCnt", param);
		}

		@Override
		public int ReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
		
			return ses.selectOne(ns + ".ReplyProdReviewlst_adminCnt", param);
		}

		@Override
		public int searchProdQA_adminCnt_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
		
			return ses.selectOne(ns + ".searchProdQA_adminCnt_adminCnt", param);
		}

		@Override
		public int searchProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
		
			return ses.selectOne(ns + ".searchProdReviewlst_adminCnt", param);
		}

		@Override
		public int searchReplyProdReviewlst_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
		
			return ses.selectOne(ns + ".searchReplyProdReviewlst_adminCnt", param);
		}

		
		
//		---------------------------------------------- 원영 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 정민 ==============================================================================
		
	// 페이징 처리한 productList 출력
		@Override
		public List<ProductsVO> prodList(PagingCriteria cri) throws Exception {
			return ses.selectList(ns + ".prodList", cri);
		}
		
		
		// 게시물 총 개수 가져오기
		@Override
		public int getTotalProdListCnt() throws Exception {
			return ses.selectOne(ns + ".getTotalProdListCnt");
		}
		
		// 검색된 게시글 총 개수 가져오기
		@Override
		public int getTotalSearchProdListCnt(SearchCriteria scri, AdminProductListDTO dto) throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			System.out.println("dao의 dto: " + dto.toString());
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			System.out.println("dao scri.searchWord:" + scri.getSearchWord());
			
			param.put("product_show", dto.getProduct_show());
			param.put("mainCategory_id", dto.getMainCategory_id());
			param.put("middleCategory_id", dto.getMiddleCategory_id());
			param.put("checkLowDate", dto.getCheckLowDate());
			param.put("checkHighDate", dto.getCheckHighDate());
			System.out.println("dao의 param:" + param.toString());
			return ses.selectOne(ns + ".getTotalSearchProdListCnt", param);
		}

		// 검색된 결과 리스트 가져오기
		@Override
		public List<ProductsVO> goSearchProdList(SearchCriteria scri, PagingCriteria cri, AdminProductListDTO dto) throws Exception {
			// 여러 개의 객체를 한번에 보낼 때, Map을 사용
			//System.out.println("dao의 dto: " + dto.toString());
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("searchType", scri.getSearchType());
			param.put("searchWord", scri.getSearchWord());
			param.put("pageStart", cri.getPageStart());
			param.put("perPageNum", cri.getPerPageNum());
			param.put("product_show", dto.getProduct_show());
			param.put("mainCategory_id", dto.getMainCategory_id());
			param.put("middleCategory_id", dto.getMiddleCategory_id());
			param.put("checkLowDate", dto.getCheckLowDate());
			param.put("checkHighDate", dto.getCheckHighDate());

			
			return ses.selectList(ns + ".goSearchProdList", param);
		}

		// ajax 이용 메인 카테고리 리스트 출력
		@Override
		public List<MainCategoryVO> getMainCategories() throws Exception {
			return ses.selectList(ns + ".getMainCategories");
		}
		
		// ajax 방식으로 메인카테고리 하위의 미들카테고리 목록 가져오기
		@Override
		public List<MiddleCategoryVO> getMiddleCategories(int mainCategory_id) throws Exception {
			return ses.selectList(ns + ".getMiddleCategories", mainCategory_id);
		}
			
		// deleteProdList	
		@Override
		public String deleteProdList(List<String> prodList) throws Exception {
			System.out.println("dao의 delete prodlist: " + prodList);
			String result = null;
			// for문을 돌려서 mapper로 보내줘야 한다.
			// 또는 mapper에서 for문을 돌려서 작업해야한다.
			if(ses.update(ns + ".deleteProdList", prodList) != 0) {
				result = "deleted";	
			}
			return result;
		}


		
		
		
		
//		---------------------------------------------- 정민 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 종진 ==============================================================================
		
		
		@Override
		public List<AdminBoardDTO> goGetBoard_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".goGetBoard_admin", param);
		}
		
		@Override
		public List<AdminReplyBoardDTO> goGetreply_admin(BoardAdminSearchCriteria BAcri1, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".goGetreply_admin", param);
		}
		
		@Override
		public List<AdminBoardDTO> searchGetBoard_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchGetBoard_admin", param);
		}
		
		@Override
		public List<AdminReplyBoardDTO> searchGetreply_admin(BoardAdminSearchCriteria BAcri2, PagingCriteria pc)
				throws Exception {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
			param.put("pageStart", pc.getPageStart());
			param.put("perPageNum", pc.getPerPageNum());
			return ses.selectList(ns + ".searchGetreply_admin", param);
		}

		public int getTodayTotCnt() throws Exception{
			return ses.selectOne(ns + ".getTodayTotCnt");
		}

		public int getTodayreplyTotCnt() throws Exception{
			return ses.selectOne(ns + ".getTodayreplyTotCnt");
		}
		
		
		public int getBoard_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());
		
			return ses.selectOne(ns + ".getBoard_adminCnt", param);
		}
			
		public int getReply_adminCnt(BoardAdminSearchCriteria BAcri1) throws Exception{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri1.getGoStartDate());
			param.put("goEndDate", BAcri1.getGoEndDate());
			param.put("board_category", BAcri1.getBoard_category());

			return ses.selectOne(ns + ".getReply_adminCnt", param);
		}
	
		public int getsearchBoard_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());
	
			return ses.selectOne(ns + ".getsearchBoard_adminCnt", param);
		}
			
		public int getsearchReply_adminCnt(BoardAdminSearchCriteria BAcri2) throws Exception{
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("goStartDate", BAcri2.getGoStartDate());
			param.put("goEndDate", BAcri2.getGoEndDate());
			param.put("board_category", BAcri2.getBoard_category());
			param.put("searchboardType", BAcri2.getSearchboardType());
			param.put("searchTxtValue", BAcri2.getSearchTxtValue());

			return ses.selectOne(ns + ".getsearchReply_adminCnt", param);
		}
		
		
		@Override
		public void deleteBoardAdmin(int no) throws Exception {
			ses.update(ns + ".deleteBoardAdmin", no);
		}

		@Override
		public void deleteReplyBoardAdmin(int no) throws Exception {
			ses.update(ns + ".deleteReplyBoardAdmin", no);
		}
		@Override
		public void deleteReplyAdmin(int no) throws Exception {
			ses.update(ns + ".deleteReplyAdmin", no);
		}

		public List<BoardVO> admin_PreviewRead(int no) throws Exception{
			return ses.selectList(ns + ".admin_PreviewRead", no);
		}
		
		@Override
		public List<ReplyBoardVO> replyBoard_admin_Preview(int no) throws Exception {
			return ses.selectList(ns + ".replyBoard_admin_Preview", no);
		}

		@Override
		public void recoveryReplyBoard(int recoveryNum) throws Exception {
			ses.update(ns + ".recoveryReplyBoard", recoveryNum);
			
		}

		@Override
		public void recoveryBoard(int recoveryNum) throws Exception {
			ses.update(ns + ".recoveryBoard", recoveryNum);
			
		}


		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		---------------------------------------------- 종진 끝 ---------------------------------------------------------------------------------------------
		
//		============================================== 효원 ==============================================================================
		
	@Override
	public List<AdminOrderListVO> readOrderList(PagingCriteria cri) throws Exception {
		return ses.selectList(ns + ".readOrderList", cri);
	}

	@Override
	public int readOrderListNum() throws Exception {
		return ses.selectOne(ns + ".readOrderListNum");
	}

	@Override
	public int orderProductNum(int payment_no) throws Exception {
		return ses.selectOne(ns + ".orderProductNum", payment_no);
	}

	@Override
	public int orderTotalPrice(int payment_no) throws Exception {
		return ses.selectOne(ns + ".orderTotalPrice", payment_no);
	}

	@Override
	public List<AdminOrderListVO> orderManageSearch(OrderManagementSearchVO vo, PagingCriteria cri) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 검색 필터
		param.put("checkOption", vo.getCheckOption());
		param.put("checkOptionSearch", vo.getCheckOptionSearch());
		param.put("searchDateRange", vo.getSearchDateRange());
		param.put("startDate", vo.getStartDate());
		param.put("endDate", vo.getEndDate());
		param.put("productInfo", vo.getProductInfo());
		param.put("productInfoSearch", vo.getProductInfoSearch());
		param.put("csOrderRange", vo.getCsOrderRange());
		param.put("purchaseStatus", vo.getPurchaseStatus());
		param.put("orderStatus", vo.getOrderStatus());
		param.put("csStatus", vo.getCsStatus());
		
		// 페이징 필터
		param.put("pageStart", cri.getPageStart());
		param.put("perPageNum", cri.getPerPageNum());
		
		return ses.selectList(ns + ".orderManageSearch", param);
	}

	@Override
	public int orderManageSearchNum(OrderManagementSearchVO vo) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 검색 필터
		param.put("checkOption", vo.getCheckOption());
		param.put("checkOptionSearch", vo.getCheckOptionSearch());
		param.put("searchDateRange", vo.getSearchDateRange());
		param.put("startDate", vo.getStartDate());
		param.put("endDate", vo.getEndDate());
		param.put("productInfo", vo.getProductInfo());
		param.put("productInfoSearch", vo.getProductInfoSearch());
		param.put("csOrderRange", vo.getCsOrderRange());
		param.put("purchaseStatus", vo.getPurchaseStatus());
		param.put("orderStatus", vo.getOrderStatus());
		param.put("csStatus", vo.getCsStatus());
		
		return ses.selectOne(ns + ".orderManageSearchNum", param);
	}

	@Override
	public OrderManagementBuyerInfoVO readBuyerInfo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readBuyerInfo", payment_no);
	}

	@Override
	public OrderManagementDestinationInfoVO readDestinationInfo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readDestinationInfo", payment_no);
	}

	@Override
	public OrderManagementPayInfoVO readPayInfo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readPayInfo", payment_no);
	}

	@Override
	public OrderStatusInfo readOrderStatusInfo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readOrderStatusInfo", payment_no);
	}

	@Override
	public int readOrderRequestNum(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readOrderRequestNum", payment_no);
	}
	
	@Override
	public RefundnExchangeVO readOrderRequestInfo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".readOrderRequestInfo", payment_no);
	}

	@Override
	public List<OrderProductInfoVO> readOrderProductInfo(int payment_no) throws Exception {
		return ses.selectList(ns + ".readOrderProductInfo", payment_no);
	}

	@Override
	public int modifyDestinationInfo(OrderDetailDestinationModifyDTO dto) throws Exception {
		return ses.update(ns + ".modifyDestinationInfo", dto);
	}

	@Override
	public int modifyDestinationMsg(String payment_deliveryMsg, int payment_no) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_deliveryMsg", payment_deliveryMsg);
		param.put("payment_no", payment_no);
		return ses.update(ns + ".modifyDestinationMsg", param);
	}

	@Override
	public int getOrderSerialNo(int payment_no) throws Exception {
		return ses.selectOne(ns + ".getOrderSerialNo", payment_no);
	}

	@Override
	public int modifyDeliveryInfo(int payment_serialNo, String delivery_status) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_serialNo", payment_serialNo);
		param.put("delivery_status", delivery_status);
		return ses.update(ns + ".modifyDeliveryInfo", param);
	}

	@Override
	public int modifyPurchaseInfo(int payment_no, String payment_isComit, String payment_isChecked) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_no", payment_no);
		param.put("payment_isComit", payment_isComit);
		param.put("payment_isChecked", payment_isChecked);
		return ses.update(ns + ".modifyPurchaseInfo", param);
	}

	@Override
	public List<Integer> getOrderBuyProductList(int payment_no) throws Exception {
		return ses.selectList(ns + ".getOrderBuyProductList", payment_no);
	}

	@Override
	public List<BuyProductVO> getOrderProductIdList(int buyProduct_no) throws Exception {
		return ses.selectList(ns + ".getOrderProductIdList", buyProduct_no);
	}
	
	@Override
	public int modifyProductQty(int buyProduct_qty, int product_id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("buyProduct_qty", buyProduct_qty);
		param.put("product_id", product_id);
		return ses.update(ns + ".modifyProductQty", param);
	}

	@Override
	public List<Integer> getOrderProductSerialNo(int payment_no) throws Exception {
		return ses.selectList(ns + ".getOrderProductSerialNo", payment_no);
	}
	
	@Override
	public int modifyCsStatusRnE(int payment_serialNo, String modifyContent, String isChecked) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_serialNo", payment_serialNo);
		param.put("modifyContent", modifyContent);
		param.put("isChecked", isChecked);
		return ses.update(ns + ".modifyCsStatusRnE", param);
	}

	@Override
	public int modifyCsStatusPayment(int payment_serialNo, String modifyContent, String isChecked) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_serialNo", payment_serialNo);
		param.put("modifyContent", modifyContent);
		param.put("isChecked", isChecked);
		return ses.update(ns + ".modifyCsStatusPayment", param);
	}

	@Override
	public Date getOrderDate(int payment_no) throws Exception {
		return ses.selectOne(ns + ".getOrderDate", payment_no);
	}

	@Override
	public int modifyPurchaseConfirmationBefore(Date orderDate, Date defaultDate) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("orderDate", orderDate);
		param.put("defaultDate", defaultDate);
		return ses.update(ns + ".modifyPurchaseConfirmationBefore", param);
	}
	
	@Override
	public int modifyPurchaseConfirmation(Date orderDate) throws Exception {
		return ses.update(ns + ".modifyPurchaseConfirmation", orderDate);
	}

	@Override
	public PointVO getOrderUsedPoint(Date orderDate) throws Exception {
		return ses.selectOne(ns + ".getOrderUsedPoint", orderDate);
	}

	@Override
	public int infoCanclePoint(String point_reason, PointVO pointHistory) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("payment_date", pointHistory.getPayment_date());
		param.put("point_usedPoint", pointHistory.getPoint_usedPoint());
		param.put("point_futurePoint", pointHistory.getPoint_futurePoint());
		param.put("member_id", pointHistory.getMember_id());
		param.put("grade_name", pointHistory.getGrade_name());
		param.put("point_reason", point_reason);
		return ses.insert(ns + ".infoCanclePoint", param);
	}

	@Override
	public int changeMemberPoint(PointVO pointHistory) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("point_usedPoint", pointHistory.getPoint_usedPoint());
		param.put("member_id", pointHistory.getMember_id());
		return ses.insert(ns + ".changeMemberPoint", param);
	}

	@Override
	public int getOrderTotPrice(int payment_no) throws Exception {
		return ses.selectOne(ns + ".getOrderTotPrice", payment_no);
	}

	@Override
	public int memberTotalPayment(String member_id) throws Exception {
		return ses.selectOne(ns + ".memberTotalPayment", member_id);
	}

	@Override
	public int updateMemberGrade(String member_id, String grade_name) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_id", member_id);
		param.put("grade_name", grade_name);
		return ses.update(ns + ".updateMemberGrade", param);
	}

	
		
		
		
//		---------------------------------------------- 효원 끝 ---------------------------------------------------------------------------------------------
}
