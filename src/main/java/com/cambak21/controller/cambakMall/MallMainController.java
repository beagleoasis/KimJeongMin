package com.cambak21.controller.cambakMall;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.service.boardCampingTip.CampingTipBoardService;
import com.cambak21.service.cambakMain.CheckListService;
import com.cambak21.service.cambakMall.MainService;
import com.cambak21.service.cambakMall.prodDetailService;
import com.cambak21.util.PagingParam;


@Controller
@RequestMapping(value = "/mall/main/*")
public class MallMainController {
	
	@Inject
	private MainService service;
	
	@Inject
	private CheckListService ckservice;

	@Inject
	private prodDetailService prodService;	
	
	
	private static final Logger logger = LoggerFactory.getLogger(MallController.class);
	  
	   /**
	    * @Method Name : homeheader
	    * @작성일 : 2021. 3. 12.
	    * @작성자 : 박종진
	    * @변경이력 : 캠박몰 메인 컨트롤러 - 맵핑 추가
	    * @Method 설명 : 캠박몰 메인 URI 설정
	    * @param locale
	    * @param model
	    * @return
	    */
	
	   @RequestMapping(value = "", method = RequestMethod.GET)
	   public String homeheader(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		  Map<String, Object> para = new HashMap<String, Object>();
		  
		  Calendar cal = Calendar.getInstance();
		  cal.add(Calendar.DATE, - 31);
		  Date weekAgo = cal.getTime();
			
		
	      for(int i = 1; i < 9; i++) {
	    	  
	    	  List<mallMainTopCountDTO> lst;
			try {
				lst = service.getNewProduct4(i);
				
				for(int j = 0; j < lst.size(); j++) {
					ProductsVO vo = service.getBasicInfo(lst.get(j).getProduct_id());
					lst.get(j).setStar(service.getStar(lst.get(j).getProduct_id()));
					lst.get(j).setTotal_reviewNum(service.getTotalReviewsNum(lst.get(j).getProduct_id()));
					
					if (vo.getProduct_totQty() == 0) {
						lst.get(j).setProduct_info("soldOut");
					} else if (vo.getProduct_popularProduct().equals("Y")) {
						lst.get(j).setProduct_info("popular");
					} else if (weekAgo.getTime() <= vo.getProduct_date().getTime()) {
						lst.get(j).setProduct_info("new");
					}
					
				}
				
				para.put("NewProduct" + Integer.toString(i), lst);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	      }
	      
	        try {
	        	para.put("total", service.getTotalCount());
	        	List<mallMainTopCountDTO> topSelling = service.getTopSelling();
	        	List<mallMainTopCountDTO> topReview = service.getTopReview();
	        	
	        	for(int i = 0; i < topSelling.size(); i++) {
        				topSelling.get(i).setStar(service.getStar(topSelling.get(i).getProduct_id()));
        				topSelling.get(i).setProduct_img1(service.getProduct_img(topSelling.get(i).getProduct_id()));
        				topSelling.get(i).setTotal_reviewNum(service.getTotalReviewsNum(topSelling.get(i).getProduct_id()));
        				topReview.get(i).setTotal_reviewNum(service.getTotalReviewsNum(topReview.get(i).getProduct_id()));
        				
	        	}
	           	para.put("topSelling", topSelling);
	        	para.put("total", service.getTotalCount());
	        	para.put("topReview", topReview);
	        	para.put("countReviews", service.countReviews());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
			model.addAttribute("para", para);
				   
	      return "cambakMall/mall";
	   }
	   
	   @RequestMapping(value = "getRecentlyProduct", method = RequestMethod.GET)
	   public ResponseEntity<List<ProductsVO>> getRecentlyProduct(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		   ResponseEntity<List<ProductsVO>> entity = null;
		   List<ProductsVO> allRecentlyProd = new ArrayList<ProductsVO>();
			
				
				 Cookie getloginCook = WebUtils.getCookie(request, "viewProduct");
				 try {
					 
					if(getloginCook != null) {
						String[] array = getloginCook.getValue().split("-");
						for(int i=0; i < array.length; i++) {
							
						    if(service.getBasicInfo(Integer.parseInt(array[i])) != null) {
						    	allRecentlyProd.add(service.getBasicInfo(Integer.parseInt(array[i])));
						    }
						    
						}
						entity = new ResponseEntity<List<ProductsVO>>(allRecentlyProd, HttpStatus.OK);
					  }
					
					} catch (Exception e) {
						// TODO Auto-generated catch block
						 e.printStackTrace();
					}
				
				return entity;
		   }
	   
	   @RequestMapping(value = "getChkListYet", method = RequestMethod.GET)
	   public ResponseEntity<String> getChkListYet(@RequestParam("member_id") String member_id, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		   			System.out.println(member_id);
		   			ResponseEntity<String> entity = null;
		   
		   			try {
		   				entity = new ResponseEntity<String>(Integer.toString(ckservice.getChkListYet(member_id)), HttpStatus.OK);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		   			return entity;	
		   }
	   @RequestMapping(value = "getChkListAll", method = RequestMethod.GET)
	   public ResponseEntity<String> getChkListAll(@RequestParam("member_id") String member_id, Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		   System.out.println(member_id);
		   ResponseEntity<String> entity = null;
		   
		   try {
			   entity = new ResponseEntity<String>(Integer.toString(ckservice.getChkListAll(member_id)), HttpStatus.OK);
		   } catch (Exception e) {
			   // TODO Auto-generated catch block
			   e.printStackTrace();
		   }
		   return entity;	
	   }
	   
//	   @RequestMapping(value="/insertBucekt", method=RequestMethod.GET)
//		public ResponseEntity<String> insertBucekt(@RequestBody InsertintoBucketDTO vo) throws Exception {
//			logger.info("장바구니에 상품 넣기");
//			
//			ResponseEntity<String> entity = null;
//			ProductsVO vocheck = service.getBasicInfo(vo.getProduct_id());
//			vo.setBucket_buyQty(1);
//			
//			vo.setBucket_sellPrice(vocheck.getProduct_sellPrice());
//			vo.setBucket_totBuyPrice(0);
//			System.out.println(vo.toString());
//			
//			if(prodService.insertBucket(vo)) {
//				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
//			} else {
//				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
//			}
			
//			return entity;
//		}
//	   
	   
	   
	      

}
