package com.cambak21.controller.cambakAdmin;

import java.util.Base64.Decoder;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.json.JsonObject;
import javax.mail.Multipart;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.core.internal.runtime.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.OrderManagementSearchVO;
import com.cambak21.domain.ProductsVO;
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

import org.springframework.web.util.WebUtils;

import com.cambak21.controller.HomeController;
import com.cambak21.domain.RevenueMonthVO;
import com.cambak21.domain.AdminMemberListVO;
import com.cambak21.domain.BoardVO;

import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;

import com.cambak21.domain.ProductAnalysisVO;
import com.cambak21.domain.RevenueEachWeekVO;

import com.cambak21.domain.RevenueVO;
import com.cambak21.domain.RevenueWeeklyVO;
import com.cambak21.service.boardNotice.BoardNoticeService;
import com.cambak21.service.cambakAdmin.adminService;
import com.cambak21.util.BoardAdminSearchCriteria;
import com.cambak21.util.ChattingImageUploads;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;


@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
   
   @Inject
   private adminService service;
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
  
   
   @RequestMapping(value = "/index", method = RequestMethod.GET)
   public String adminIndex() {
      logger.info("adminIndex??????");
      
      return "/admin/index";
   }
   

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/revenue", method = RequestMethod.GET)
	public String revenue() throws Exception{
		
		return "/admin/revenue";
	}
	@RequestMapping(value = "/revenue/perDate", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueVO>> revenueIndex(@RequestParam("dateVal") int dateVal) {
//		model.addAttribute("revenue", service.getPerDayRevenue());
		System.out.println(dateVal);
		ResponseEntity<List<RevenueVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<RevenueVO>>(service.getPerDayRevenue(dateVal), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueVO>>(HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	 
	@RequestMapping(value = "revenue/selectDate", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueVO>> selectDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model) {
		
		
		
		ResponseEntity<List<RevenueVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueVO>>(service.selectDate(startDate, endDate), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "productAnalysis/selectDate", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueVO>> productSelectDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model) {
		
		
		
		ResponseEntity<List<RevenueVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueVO>>(service.productSelectDate(startDate, endDate), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	@RequestMapping(value = "/revenueWeekly", method = RequestMethod.GET)
	public String revenueWeekly(Model model) throws Exception{
		
		model.addAttribute("thisWeekRevenue", service.thisWeekRevenue());
		model.addAttribute("prevWeekRevenue", service.prevWeekRevenue());
		model.addAttribute("thisWeekRefund", service.thisWeekRefund());
		model.addAttribute("prevWeekRefund", service.prevWeekRefund());
		
		return "/admin/revenueWeekly";
	}
	@RequestMapping(value = "revenue/selectWeekly", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueWeeklyVO>> selectWeekly(@RequestParam("revenueWeekly") int revenueWeekly, Model model) {
				
		ResponseEntity<List<RevenueWeeklyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<RevenueWeeklyVO>>(service.selectWeekly(revenueWeekly), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueWeeklyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value = "/revenueMonthly", method = RequestMethod.GET)
	public String revenueMonthly(Model model) throws Exception{
		
		
		model.addAttribute("thisMonthRevenue", service.thisMonthRevenue());
		
		model.addAttribute("prevMonthRevenue", service.prevMonthRevenue());
		model.addAttribute("thisMonthRefund", service.thisMonthRefund());
		model.addAttribute("prevMonthRefund", service.prevMonthRefund());
		
		return "/admin/revenueMonthly";
	}
	
	@RequestMapping(value = "revenue/selectMonthly", method = RequestMethod.GET)
	public ResponseEntity<List<RevenueMonthVO>> selectMonthly(@RequestParam("revenueMonthly") int revenueMonthly, Model model) {
				
		ResponseEntity<List<RevenueMonthVO>> entity = null;
		
		try {
			
			entity = new ResponseEntity<List<RevenueMonthVO>>(service.selectMonthly(revenueMonthly), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<List<RevenueMonthVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "revenue/selectEveryWeekly", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> everyEachWeek(@RequestParam("revenueWeekly") int revenueWeekly, RevenueEachWeekVO vo){
		
//		ResponseEntity<List<RevenueEachWeekVO>> entity = null;
		ResponseEntity<Map<String, Object>> entity = null;
		List lst = new ArrayList();
		
		for (int i = 1; i < revenueWeekly; i++ ) {
			try {
				if(service.selectEachWeek(i) == null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
					String today = getWeekOfYear(sdf.format(new Date()), i);
					System.out.println("$$$$$$$$$$$$$$$$$" + today);
					String startDate = getMondayDate(today);
					System.out.println("@@@@@@@@@@@@@@@@@" + startDate);

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
//		try {
//			entity = new ResponseEntity<List<RevenueEachWeekVO>>(service.selectEachWeek(revenueWeekly), HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Map<String, Object> para = new HashMap<String, Object>();
//		try {
//			System.out.println(service.selectEachWeek(revenueWeekly).toString());
//			para.put("revenue", service.selectEachWeek(revenueWeekly));
//			para.put("revenue1", service.selectEachWeekRefund(revenueWeekly));
//			entity = new ResponseEntity<Map<String, Object>>(para, HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
		return entity;
	}
	
	


	private String getWeekOfYear(String date, int i) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",	Locale.KOREA);

		String[] dates = date.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		day = day -7 * (i-1);
		calendar.set(year, month - 1, day);
		Date weekago = calendar.getTime();
		return formatter.format(weekago);
		}
	
	private String getMondayDate(String today) {
		
		System.out.println("##############" + today);
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",	Locale.KOREA);

		String[] dates = today.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		
//		calendar.set(2021, 01, 27);
//		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
//		
//		System.out.println("@@@@@@@@@@#@#@" + formatter.format(calendar.getTime()));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day);
		System.out.println(format.format(cal.getTime()));
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		System.out.println("?????????" + format.format(cal.getTime()));
		
		
		return formatter.format(cal.getTime());
	}
	
	@RequestMapping(value = "/productAnalysis", method = RequestMethod.GET)
	public String productAnalysis() {
		
		return "/admin/productAnalysis";
	}
	
	@RequestMapping(value = "productAnalysis/perDate", method = RequestMethod.GET)
	public ResponseEntity<List<ProductAnalysisVO>> productAnalysisPerDate(@RequestParam("dateVal") int dateVal) {
		
		ResponseEntity<List<ProductAnalysisVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ProductAnalysisVO>>(service.productAnalysis(dateVal), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return entity;
	}
	
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
	@RequestMapping("/memberList")
	public String memberList(@RequestParam(value="page", required = false, defaultValue = "1") int pageNo, Model model, PagingCriteria cri) {
		logger.info("memberList??????");
		
		cri.setPage(pageNo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		
		try {
			pp.setTotalCount(service.getTotMemberCnt());
			System.out.println(pp);
			model.addAttribute("paging", pp);
			model.addAttribute("members", service.getMember(cri));
		} catch (Exception e) {
			model.addAttribute("noMembers");
			e.printStackTrace();
		}
		
		return "/admin/memberList";
	}
	
	@RequestMapping(value="/deleteMember/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<String> deleteMember(@PathVariable("member_id") String member_id) {
		logger.info("?????? ???????????????");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(member_id);
		
		try {
			if(service.deleteMember(member_id)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		};
		
		return entity;
	}
	
	@RequestMapping(value="/modifyMember", method = RequestMethod.POST)
	public ResponseEntity<String> getMember(@RequestBody UpdateAdminMemberDTO dto) {
		logger.info("?????? ?????? ??????");

		ResponseEntity<String> entity = null;
		
		System.out.println(dto.toString());
		
		try {
			if(service.updateMember(dto)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping(value="/memberSearch", method = RequestMethod.GET)
	public String memberSearch(AdminMemberListVO vo, @RequestParam(value="page", required = false, defaultValue = "1") int page, Model model, PagingCriteria cri) {
		logger.info("?????? ??????");
		System.out.println(vo.toString());
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		System.out.println(cri);
		
		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		if(vo.getMemberOptionSearchWord().equals("")) {
			vo.setMemberOption(null);
		}
		
		if(vo.getCheckLowDate().equals("") && vo.getCheckHighDate().equals("")) {
			vo.setDateOption(null);
		} else if(!vo.getCheckLowDate().equals("") && vo.getCheckHighDate().equals("")) {
			vo.setCheckHighDate(today);
		}
		
		if(vo.getCheckHighNum().equals("") && vo.getCheckLowNum().equals("")) {
			vo.setPriceOption(null);
		}		
		
		List<MemberVO> memberLst = null;
		
		try {
			pp.setTotalCount(service.getmemberSearchCnt(vo));
			System.out.println(pp);
			
			memberLst = service.memberSearch(vo, cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(memberLst.toString());
		
		model.addAttribute("paging", pp);
		model.addAttribute("members", memberLst);
		return "/admin/memberList";
	}
	

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// ????????? ?????? ?????? ????????? ?????? ??????
		@RequestMapping(value = "/prodList", method = RequestMethod.GET)
		public String productList(Model model, PagingCriteria cri) throws Exception  {
			logger.info("productList??????, ???????????? ????????? ?????? ????????? ??????");
			// ????????? ????????? ??? ????????? ???
			model.addAttribute("boardList", service.prodList(cri));// ????????? ?????????
			
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.getTotalProdListCnt());// ????????? ??? ????????? ???????????? ??????

			System.out.println(pp.toString());
			model.addAttribute("pagingParam", pp); // ????????? ????????? ?????? ???????????? ??????
			System.out.println("model:" + model.toString());
			return "/admin/productList";
		}
		

		// ????????? ??? ?????? ?????? ??????
		@RequestMapping(value="/searchProdList", method = RequestMethod.GET)
		public String searchProductList(PagingCriteria cri, SearchCriteria scri, AdminProductListDTO dto, Model model, @RequestParam("product_show") String aa) throws Exception {
			
			System.out.println("aaaaaaaaaaaaaa: " + aa);
			System.out.println("productListDTO: " + dto.toString());
			System.out.println("scri: " + scri.toString());
			System.out.println("????????? ???????????????.");
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			// ????????? ????????? ??? ????????? ???
			pp.setTotalCount(service.getTotalSearchProdListCnt(scri, dto));
			System.out.println("controller pp : " + pp.toString());
			
			model.addAttribute("boardList", service.goSearchProdList(scri, cri, dto)); // ????????? ?????????
			model.addAttribute("SearchCriteria", scri);
			model.addAttribute("pagingParam", pp);
			model.addAttribute("dto", dto);
			System.out.println("controller model : " + model.toString());

			return "/admin/productList";
			
		}
		
		// ?????? ?????? ???????????? ?????? ajax??? ???????????? ??????
		@RequestMapping(value="getMainCategories", method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> selectMainCategories() throws Exception {
			logger.info("/admin_product???????????? getMainCategories-GET?????? ??????");
		    Map<String, Object> result = new HashMap<String, Object>();
		    result.put("mainCategories", service.getMainCategories());
		    return result;
			
		} 
	
		// ?????? ?????? ???????????? ?????? ajax??? ???????????? ??????
		@RequestMapping(value="getMiddleCategories", method=RequestMethod.GET)
		public @ResponseBody Map<String, Object> selectMiddleCategories(@RequestParam("mainCategory_id") int mainCategory_id) throws Exception {
			logger.info("/admin_product???????????? getMainCategories-GET?????? ??????");
				  Map<String, Object> result = new HashMap<String, Object>();
				  result.put("middleCategories", service.getMiddleCategories(mainCategory_id));
				  return result;
					
				} 
		
		// ?????? ???????????? ??????
		@RequestMapping(value="deleteProdList", method=RequestMethod.GET)
		public @ResponseBody void deleteProdList(@RequestParam(value="prodList[]") List<String> prodList) throws Exception {
			logger.info("/deleteProdList??? GET?????? ??????");
				System.out.println("prodList:" + prodList);
					service.deleteProdList(prodList);
				} 
		
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   @GetMapping("/prodRegister")
   public String productInsert() {
      logger.info("adminIndex??????");
      
      return "/admin/productRegister";
   }
   
   @RequestMapping( value = "/productInsert", method = RequestMethod.POST)
   public String productInsert(ProductsVO vo, RedirectAttributes ra) throws Exception {
	   
	   if(service.insertProduct(vo) == 1) {
		   ra.addFlashAttribute("status", "insertOk");
	   } else {
		   ra.addFlashAttribute("status", "insertFail");
	   }
	   
	   return "redirect:/admin/prodList";
   }
   
   /**
  * @Method Name : productModify
  * @????????? : 2021. 4. 30.
  * @????????? : ??????
  * @???????????? : 
  * @Method ?????? : ?????? ??? ??????
  * @param product_id
  * @param model
  * @return
  * @throws Exception
  */
@RequestMapping("/productModify")
   public String productModify(@RequestParam("product_id") String product_id, Model model) throws Exception {
	   
	   model.addAttribute("product", service.getProduct(product_id));
	   
	   return "/admin/productModi";
   }
   
   @PostMapping("/productModify")
   public String productModify(ProductsVO vo, RedirectAttributes ra) throws Exception {
	   System.out.println(vo.toString());
	   
	  if(service.updateProduct(vo) == 1) {
		  ra.addFlashAttribute("status", "modiOk");
	  } else {
		  ra.addFlashAttribute("status", "modiFail");
	  }
	   
	  return "redirect:/admin/prodList";
   }
   
   /**
  * @Method Name : productDetail_imgUpload
  * @????????? : 2021. 4. 27.
  * @????????? : ??????
  * @???????????? : 
  * @Method ?????? : product_detail, ???????????? ????????? ????????? ?????????
  * @param vo
  * @return
  */
   @RequestMapping(value="/productImage", method = RequestMethod.POST, produces = "text/html; charset=utf8")
   public ResponseEntity<String> productDetail_imgUpload(@RequestParam("image") MultipartFile file, HttpServletRequest request) {
	   ResponseEntity<String> entity = null;
	   
	   try {
			// ?????? ????????? ??? ?????? ??????
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/product");
			// ?????? ???????????? ?????? ????????? ?????? ??? ?????? ?????? ??????
			String uploadFile = ChattingImageUploads.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				
				// -1??? ???????????? ????????? ??????
				entity = new ResponseEntity<String>(uploadFile, HttpStatus.OK);
			} else {
				// ????????? ?????? ?????????
				// view?????? modal ??????
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}	   
	   return entity;
   }

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   
   
   @RequestMapping(value = "/board_admin", method = RequestMethod.GET)
   public String board_admin_option() throws Exception{
      
      return "/admin/board_admin";
   }
   @RequestMapping(value = "/board_admin_Preview", method = RequestMethod.GET)
   public void board_admin_Preview(@RequestParam("no") int no, Model model) throws Exception{
      
	   model.addAttribute("adminBoard", service.admin_PreviewRead(no));
	   
   }
   @RequestMapping(value = "/replyBoard_admin_Preview", method = RequestMethod.GET)
   public void replyBoard_admin_Preview(@RequestParam("no") int no, Model model) throws Exception{
	   
	   model.addAttribute("adminReply", service.replyBoard_admin_Preview(no));
	   
   }
  
   @RequestMapping(value = "/board_admin/ajax/recovery", method = RequestMethod.POST)
   public ResponseEntity<String> board_admin_recovery(@RequestParam("recoveryNum") int recoveryNum, @RequestParam("recoveryType") String recoveryType) throws Exception{
	  
	   ResponseEntity<String> entity = null;
	 
	   if(recoveryType.equals("B")) {
		   service.recoveryBoard(recoveryNum);
		 
	   }else if(recoveryType.equals("R")) {
		   service.recoveryReplyBoard(recoveryNum);
	   }
	   
	   
	   try {
	    entity = new ResponseEntity<String>("1", HttpStatus.OK);
	   } catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
	   }
	   return entity;	
   }
   
   @RequestMapping(value = "/board_admin/ajax/delete", method = RequestMethod.POST)
   public ResponseEntity<String> board_admin_delete(@RequestParam("deleteAllNum") String deleteAllNum, @RequestParam("deleteType") String deleteType) throws Exception{
	  
	   ResponseEntity<String> entity = null;
	   String[] array = deleteAllNum.split("-");
	   
	  
	   	   if(deleteType.equals("B")) {
		   
		   for(int i=0; i < array.length; i++) {
				
			    if(array[i] != "") {
			    	System.out.println(array[i]);
			    	service.deleteBoardAdmin(Integer.parseInt(array[i]));
			    }
			}
		   
	   }else if(deleteType.equals("R")) {
		   
		   for(int i=0; i < array.length; i++) {
				
			    if(array[i] != "") {
			    	System.out.println(array[i]);
			    	service.deleteReplyAdmin(Integer.parseInt(array[i]));
			    }
			}
		   
	   }
   	 try {
	   		 
	      entity = new ResponseEntity<String>("success", HttpStatus.OK);
	   } catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
	   }
	   return entity;	
   }
   
   

   
   @RequestMapping(value = "/board_admin/ajax/{goStartDate}/{goEndDate}/{board_category}/{searchselectedCategory}/{searchboardType}/{searchTxtValue}/{page}/{perPageCnt}", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> getRecentlyProduct(@PathVariable("goStartDate") String goStartDate, @PathVariable("goEndDate") String goEndDate, @PathVariable("board_category") String board_category, @PathVariable("searchselectedCategory") String searchselectedCategory, @PathVariable("searchboardType") String searchboardType, @PathVariable("searchTxtValue") String searchTxtValue, @PathVariable("page") int page, @PathVariable("perPageCnt") int perPageCnt, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException {
	   ResponseEntity<Map<String, Object>> entity = null;
//	   System.out.println(goStartDate + "," + goEndDate + "," + board_category + "," + searchselectedCategory + "," + searchboardType + "," + searchTxtValue + "," + page);
//	   SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//	   Date to = fm.parse(goStartDate);
//	   System.out.println(to);
	
	   Map<String, Object> para = new HashMap<String, Object>();
	   List<AdminBoardDTO> Boardlst = new ArrayList<AdminBoardDTO>();
	   List<AdminReplyBoardDTO> replyBoardlst = new ArrayList<AdminReplyBoardDTO>();
	   
	   PagingCriteria pc = new PagingCriteria();
	   pc.setPerPageNum(perPageCnt);
	   pc.setPage(page);
	   PagingParam pp = new PagingParam();
	   pp.setCri(pc);
	   
	   BoardAdminSearchCriteria BAcri1 = new BoardAdminSearchCriteria(goStartDate, goEndDate, board_category);
	   BoardAdminSearchCriteria BAcri2 = new BoardAdminSearchCriteria(goStartDate, goEndDate, board_category, searchboardType, searchTxtValue);

			   try {
			if(searchTxtValue.equals("none")) {
				
			
			    if(searchselectedCategory.equals("board")) {
			    	Boardlst = service.goGetBoard_admin(BAcri1, pc);
			    	pp.setTotalCount(service.getBoard_adminCnt(BAcri1));
			    	para.put("Boardlst", Boardlst);
			    }
				
			    if(searchselectedCategory.equals("reply")) {
			    	replyBoardlst = service.goGetreply_admin(BAcri1, pc);
			    	pp.setTotalCount(service.getReply_adminCnt(BAcri1));
			    	para.put("replyBoardlst", replyBoardlst);
			    }
			
			}else {
			
				 if(searchselectedCategory.equals("board")) {
				    	Boardlst = service.searchGetBoard_admin(BAcri2,pc);
				    	pp.setTotalCount(service.getsearchBoard_adminCnt(BAcri2));
				    	para.put("Boardlst", Boardlst);	
				    }
					
				    if(searchselectedCategory.equals("reply")) {
				    	replyBoardlst = service.searchGetreply_admin(BAcri2, pc);
				    	pp.setTotalCount(service.getsearchReply_adminCnt(BAcri2));
				    	para.put("replyBoardlst", replyBoardlst);	
				    }
		
			    
			  
			}
			 para.put("todayTotCnt", service.getTodayTotCnt());
			 para.put("todayreplyTotCnt", service.getTodayreplyTotCnt());
			 para.put("pagingParam", pp);
			 entity = new ResponseEntity<Map<String, Object>>(para, HttpStatus.OK);
			 
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	   
	   	

			return entity;
	   }
   
   
   
   
   
   
   
   
   

   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
   @RequestMapping(value="/orderManagement")
   public String orderManagement(PagingCriteria cri, Model model) throws Exception{
      model.addAttribute("order", service.readOrderList(cri));
      return "/admin/adminOrderManagement";
   }
   
   @RequestMapping(value="/orderManagement/search")
   public String orderManagementSearch(OrderManagementSearchVO vo, @RequestParam("checkDate") int checkDate, @RequestParam("checkLowDate") String checkLowDate,
		   @RequestParam("checkHighDate") String checkHighDate, PagingCriteria cri, Model model) throws Exception{
      System.out.println(vo.toString());
      System.out.println(checkDate);
      
      if (vo.getCheckOptionSearch().equals("")) vo.setCheckOptionSearch(null);
      if (vo.getProductInfoSearch().equals("")) vo.setProductInfoSearch(null);
      
      if (checkDate != 0 && checkLowDate.equals("") && checkHighDate.equals("")) {
    	  Calendar cal = Calendar.getInstance();
    	  
    	  if (checkDate == 1) cal.add(Calendar.DAY_OF_MONTH, 0);
    	  else cal.add(Calendar.DAY_OF_MONTH, - checkDate);
    	  
    	  Date start = cal.getTime();
    	  Date endDate = new Date();
    	  String tmpStartDate = new SimpleDateFormat("yyyy-MM-dd").format(start) + " 00:00:00";
    	  
    	  SimpleDateFormat tmpStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  Date startDate = tmpStart.parse(tmpStartDate);
    	  
    	  vo.setStartDate(startDate);
    	  vo.setEndDate(endDate);
    	  vo.setSearchDateRange("range");
      } else if (checkDate == 0 && checkLowDate.length() != 0 && checkHighDate.length() != 0) {
    	  checkLowDate = checkLowDate + " 00:00:00";
    	  checkHighDate = checkHighDate + " 23:59:59";
    	  
    	  SimpleDateFormat tmpStartDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  Date startDate = tmpStartDate.parse(checkLowDate);
    	  
    	  SimpleDateFormat tmpEndDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	  Date endDate = tmpEndDate.parse(checkHighDate);
    	  
    	  vo.setStartDate(startDate);
    	  vo.setEndDate(endDate);
    	  vo.setSearchDateRange("range");
      }
      
      if (vo.getCsStatus().equals("csStatusTotal")) vo.setCsOrderRange("noRange");
      
      System.out.println(vo.toString());
      
      Map<String, Object> param = service.orderManageSearch(vo, cri);
      System.out.println(param.toString());
      
      model.addAttribute("order", param);
      
      return "/admin/adminOrderSearch";
   }
   
   @RequestMapping(value="/orderManagement/detail")
   public String orderView(@RequestParam("prodNo") int payment_no, Model model) throws Exception{
	  
	  model.addAttribute("buyProdInfo", service.readBuyOrderInfo(payment_no));
	  
      return "/admin/adminOrderView";
   }
   
   @RequestMapping(value="/orderManagement/destinationModi", method = RequestMethod.POST)
   public String orderDestinationModi(@RequestParam("prodNo") int payment_no, OrderDetailDestinationModifyDTO dto, RedirectAttributes rttr) throws Exception{
	  
	  if (service.modifyDestinationInfo(dto, payment_no)) {
		  rttr.addFlashAttribute("destinationModi", "success");
	  } else {
		  rttr.addFlashAttribute("destinationModi", "fail");
	  }
	  
      return "redirect:/admin/orderManagement/detail?prodNo=" + payment_no;
   }
   
   @RequestMapping(value="/orderManagement/orderStatusModi", method = RequestMethod.POST)
   public String orderStatusModi(@RequestParam("prodNo") int payment_no , OrderInfoModifyDTO dto, RedirectAttributes rttr) throws Exception{

	  if (service.orderStatusModi(payment_no, dto)) {
		  rttr.addFlashAttribute("orderStatusModi", "success");
	  } else {
		  rttr.addFlashAttribute("orderStatusModi", "fail");
	  }
	  
	  System.out.println(payment_no);
	  System.out.println(dto.toString());
	  
      return "redirect:/admin/orderManagement/detail?prodNo=" + payment_no;
   }
   
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ??????@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   
   
   
   @RequestMapping(value = "/QA", method = RequestMethod.GET)
   public String adminQA() throws Exception{
      
      return "/admin/QA_admin";
   }
  
   
   
   @RequestMapping(value = "/QA_admin/ajax/{goStartDate}/{goEndDate}/{board_category}/{searchselectedCategory}/{searchboardType}/{searchTxtValue}/{page}/{perPageCnt}", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> getRecentlyQAboard(@PathVariable("goStartDate") String goStartDate, @PathVariable("goEndDate") String goEndDate, @PathVariable("board_category") String board_category, @PathVariable("searchselectedCategory") String searchselectedCategory, @PathVariable("searchboardType") String searchboardType, @PathVariable("searchTxtValue") String searchTxtValue, @PathVariable("page") int page, @PathVariable("perPageCnt") int perPageCnt, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ParseException {
	   ResponseEntity<Map<String, Object>> entity = null;

	   Map<String, Object> para = new HashMap<String, Object>();
	   List<AdminProdQADTO> ProdQalst = new ArrayList<AdminProdQADTO>();
	   List<AdminProdReviewDTO> ProdReviewlst = new ArrayList<AdminProdReviewDTO>();
	   List<AdminReplyProdReviewDTO> ReplyProdReviewlst = new ArrayList<AdminReplyProdReviewDTO>();
	   
	   PagingCriteria pc = new PagingCriteria();
	   pc.setPerPageNum(perPageCnt);
	   pc.setPage(page);
	   PagingParam pp = new PagingParam();
	   pp.setCri(pc);
	   
	   BoardAdminSearchCriteria BAcri1 = new BoardAdminSearchCriteria(goStartDate, goEndDate, board_category);
	   BoardAdminSearchCriteria BAcri2 = new BoardAdminSearchCriteria(goStartDate, goEndDate, board_category, searchboardType, searchTxtValue);

	   try {
			if(searchTxtValue.equals("none")) {
				
				if(board_category.equals("QA")) {
					
					if(searchselectedCategory.equals("board")) {
						
						ProdQalst = service.getAdmin_ProdQA(BAcri1, pc);
				    	pp.setTotalCount(service.getBoard_adminCnt(BAcri1));
				    	para.put("ProdQalst", ProdQalst);
						
					}
					
					
				}else if(board_category.equals("review")) {
					
					if(searchselectedCategory.equals("board")) {
						
						ProdReviewlst = service.getAdmin_ProdReviewlst(BAcri1, pc);
				    	pp.setTotalCount(service.getBoard_adminCnt(BAcri1));
				    	para.put("ProdReviewlst", ProdReviewlst);
						
					}
					
					 if(searchselectedCategory.equals("reply")) {
						 ReplyProdReviewlst = service.getAdmin_ReplyProdReviewlst(BAcri1, pc);
				      	 pp.setTotalCount(service.getBoard_adminCnt(BAcri1));
				    	 para.put("AdminReplyProdReviewDTO", ReplyProdReviewlst);
					 }
					
				}
				
				
			
//			    if(searchselectedCategory.equals("board")) {
//			    	Boardlst = service.goGetBoard_admin(BAcri1, pc);
//			    	pp.setTotalCount(service.getBoard_adminCnt(BAcri1));
//			    	para.put("Boardlst", Boardlst);
//			    }
//				
//			    if(searchselectedCategory.equals("reply")) {
//			    	replyBoardlst = service.goGetreply_admin(BAcri1, pc);
//			    	pp.setTotalCount(service.getReply_adminCnt(BAcri1));
//			    	para.put("replyBoardlst", replyBoardlst);
//			    }
//			
			}else {
			
				
				if(board_category.equals("QA")) {
					
					
						if(searchselectedCategory.equals("board")) {
							
							ProdQalst = service.searchgetAdmin_ProdQA(BAcri1, pc);
					    	pp.setTotalCount(service.searchProdQA_adminCnt_adminCnt(BAcri1));
					    	para.put("ProdQalst", ProdQalst);
							
						}
					
					
				}else if(board_category.equals("review")) {
					
						if(searchselectedCategory.equals("board")) {
							
							ProdReviewlst = service.searchgetAdmin_ProdReviewlst(BAcri1, pc);
					    	pp.setTotalCount(service.searchProdReviewlst_adminCnt(BAcri1));
					    	para.put("ProdReviewlst", ProdReviewlst);
						 	
						}
						
						 if(searchselectedCategory.equals("reply")) {
						
							 ReplyProdReviewlst = service.searchgetAdmin_ReplyProdReviewlst(BAcri2, pc);
					      	 pp.setTotalCount(service.searchReplyProdReviewlst_adminCnt(BAcri2));
					    	 para.put("AdminReplyProdReviewDTO", ReplyProdReviewlst);
						 }
					
				}



//				 if(searchselectedCategory.equals("board")) {
//				    	Boardlst = service.searchGetBoard_admin(BAcri2,pc);
//				    	pp.setTotalCount(service.getsearchBoard_adminCnt(BAcri2));
//				    	para.put("Boardlst", Boardlst);	
//				    }
//					
//				    if(searchselectedCategory.equals("reply")) {
//				    	replyBoardlst = service.searchGetreply_admin(BAcri2, pc);
//				    	pp.setTotalCount(service.getsearchReply_adminCnt(BAcri2));
//				    	para.put("replyBoardlst", replyBoardlst);	
//				    }
		
			    
			  
			}
			 para.put("todayTotCnt", service.getTodayTotCnt());
			 para.put("todayreplyTotCnt", service.getTodayreplyTotCnt());
			 para.put("pagingParam", pp);
			 entity = new ResponseEntity<Map<String, Object>>(para, HttpStatus.OK);
			 
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	   
	   	

			return entity;
	   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   






}