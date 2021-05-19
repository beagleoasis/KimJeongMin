package com.cambak21.controller.cambakMall;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BucketVO;
import com.cambak21.domain.NonUserBucketVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.ProdQAsLikeVO;
import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.InsertintoBucketDTO;
import com.cambak21.dto.InsertintoNonUserBucketDTO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.dto.ProdReviewWritingInfoDTO;
import com.cambak21.service.boardProdQA.BoardProdQAService;
import com.cambak21.service.boardProdReview.ProdReviewService;
import com.cambak21.service.cambakMall.prodDetailService;
import com.cambak21.util.FileUploadProdcess;
import com.cambak21.util.MediaConfirm;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/mall/prodDetail/*")
public class ProdDetail {
	
	private static final Logger logger = LoggerFactory.getLogger(ProdDetail.class);
	
	@Inject
	private ProdReviewService service;
	
	@Inject
	private BoardProdQAService QAService;
	
	@Inject
	private prodDetailService prodService;	
	
	/**
	 * @Method Name : prodDetailPage
	 * @작성일 : 2021. 4. 1.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 상세 페이지를 호출하고, 해당 상세 정보를 불러오는 메서드 
	 * @param prodId
	 * @param page
	 * @param cate
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String prodDetailPage(@RequestParam("prodId") int prodId, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("상품 상세 페이지");
		
		/* *******************종진 캠박몰 메인 최신 본 상품을 위한 쿠기 값 저장 추가 시작부분 *****************/ 
		
		String viewProd = String.valueOf(prodId);
		boolean checkAdd = true;
		Cookie getloginCook = WebUtils.getCookie(request, "viewProduct");
//		getloginCook.getValue().equals(compaere
		if(getloginCook != null) {
			String saveCookie = getloginCook.getValue();
			String[] array = getloginCook.getValue().split("-");
			
			if(array.length >= 3) {
				saveCookie = array[1] + "-" + array[2];
			}
			
			
			for(int i=0; i<array.length; i++) {
				
				if(array[i].equals(viewProd)) {
					checkAdd = false;
				}
			}
			
			if(checkAdd) {
				saveCookie += "-" + viewProd;
				Cookie readCook = new Cookie("viewProduct", saveCookie); 
				readCook.setPath("/");
				readCook.setMaxAge(60 * 60 * 24); 
		        response.addCookie(readCook);
			}
			
		
		}else {
			Cookie readCook = new Cookie("viewProduct", viewProd); 
			readCook.setPath("/");
			readCook.setMaxAge(60 * 60 * 24); 
	        response.addCookie(readCook);
		}
		
	
		
		/* ****************종진 캠박몰 메인 최신 본 상품을 위한 쿠기 값 저장 추가 끝 부분************** */ 
		
		HttpSession ses = request.getSession();
		ses.setAttribute("ssid", request.getRequestedSessionId());
		
		ProductsVO prodDetail = prodService.getProdDetail(prodId);
		
		System.out.println(prodDetail);
		
		model.addAttribute("prodDetail", prodDetail);
		model.addAttribute("topReviews", prodService.getTopReview());
		
		return "cambakMall/prodDetail";
	}
	
//	==========================================정민오빠 class 부분 ========================================================================

	   @RequestMapping(value = "/prodReviews/{prodId}", method=RequestMethod.GET)
	   public @ResponseBody Map<String, Object> prodReviewsList(@PathVariable("prodId") String prodId, @RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam("orderList") String orderList) {
//	      System.out.println(prodId);
//	      System.out.println(page);
	      System.out.println(orderList);
	      logger.info("/prodReviews의 ajax-GET방식 호출");
	      
	      int product_id = Integer.parseInt(prodId);
	      Map<String, Object> result = new HashMap<String, Object>();
	      
	      List<ProdReviewVO> prodList = null;
	      
	      PagingCriteria cri = new PagingCriteria();
	      PagingParam pp = new PagingParam();
	      pp.setCri(cri);
	      cri.setPage(page);
	      //System.out.println("pp" + pp);
	      
	      try {
	         prodList = service.listProdBoardCriteria(cri, product_id, orderList);
	         pp.setTotalCount(service.getTotalBoardCnt(product_id));
	         result.put("prodList", prodList);
	         result.put("pagingParam", pp);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return result;
	   }
	   
	// 상품후기 게시글 작성 페이지로 이동
		@RequestMapping(value="/writingProdReviews", method = RequestMethod.GET)
		public String writingProdReviewGet() throws Exception{
			logger.info("/writingProdReviews의 get방식 호출");
			System.out.println("/writingProdReviews의 get방식 호출");
			return "cambakMall/prodReviewsWriting";
		}
		
		// 상품후기 게시글 작성
		@RequestMapping(value="/writingProdReviews", method = RequestMethod.POST)
		public String writingProdReviewPost(ProdReviewVO vo) throws Exception {
			// 상품후기 게시글 작성 페이지에서 등록 버튼 클릭 시
			//logger.info("/writingProdReviews의 post방식 호출");
			System.out.println("/writingProdReviews의 post방식 호출입니다.");
			//logger.info(vo.toString());
			System.out.println("vo.toString: " + vo.toString());
			int prodId=vo.getProduct_id();
			
			service.insert(vo);
			
			// return 할 페이지에 product_id를 보내서 해당 상품에 대한 게시판으로 가도록 처리 필요..
			return "redirect:/mall/prodDetail/main?prodId=" + prodId;
		}
		
		// 상품후기 게시글 작성을 위한 prodId, buyProduct_no 가져오기
		@RequestMapping(value="/getReviewInfo/{payment_serialNo}",  method=RequestMethod.POST)
		public @ResponseBody ProdReviewWritingInfoDTO getReviewInfo(@PathVariable("payment_serialNo") int payment_serialNo) {
			System.out.println("getReviewInfo의 post방식 호출");
			ProdReviewWritingInfoDTO dto = null;
			try {
				dto = service.getReviewInfo(payment_serialNo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return dto;
		}
		
		// 상품후기 게시글 수정 페이지 출력 및 수정할 사항 출력
		@RequestMapping(value="/prodReviewsModify", method=RequestMethod.GET)
		public String modifyProdReviewGet(@RequestParam("prodReview_no") int prodReview_no, @RequestParam("member_id") String member_id, Model model) throws Exception{
			logger.info("/prodReviewsModify 페이지 GET 호출");
			
			model.addAttribute("board", service.readProdBoard(prodReview_no));
			model.addAttribute("prodReview_no", prodReview_no);
			System.out.println("board 내용 : " + model.toString());
			
			return "cambakMall/prodReviewsModify";
		}
		
		
		
		// 상품후기 게시글 수정 업데이트
		@RequestMapping(value="/prodReviewsModify", method=RequestMethod.POST)
		public String modifyProdReviewPost(ProdReviewVO vo) throws Exception {
			logger.info("/prodReviewsModify의 post방식 호출");
			System.out.println("/prodReviewsModify의 post방식 호출");
			int prodId=vo.getProduct_id();
			System.out.println("prodId: " + prodId);
			System.out.println("vo : " + vo);
//			System.out.println("service.updateProdBoard(vo) :" + service.updateProdBoard(vo));
			service.updateProdBoard(vo);
			return "redirect:/mall/prodDetail/main?prodId=" + prodId;
		}
		
		
		// 상품후기 게시글 삭제
		@RequestMapping(value="/prodReviewsDelete", method=RequestMethod.GET)
		public String prodReviewsDelete(@RequestParam("prodReview_no") int prodReview_no, @RequestParam("prodId") int prodId) throws Exception {
			logger.info("/prodReviewsDelete의 post방식 호출");
			System.out.println("/prodReviewsDelete의 post방식 호출");
			service.deleteProdBoard(prodReview_no, prodId);
			
			return "redirect:/mall/prodDetail/main?prodId=" + prodId;
		}
		
		// 상품후기 게시글에 대한 좋아요 클릭
		@RequestMapping(value="/insertLikeProdReviews/{loginUser}/{prodReview_no}", method=RequestMethod.POST)
		public @ResponseBody int insertLikeProdReviews(@PathVariable("loginUser") String member_id, @PathVariable("prodReview_no") int prodReview_no) {
			logger.info("/insertLikeProdReviews의 post방식 호출");
			System.out.println(member_id);
//			System.out.println(prodReview_no);
			int result = 0;
			try {
					// 해당 게시글에 좋아요 처리
					service.insertLikeProdReviews(member_id, prodReview_no);

				// 게시글 좋아요 수
				result = service.getProdReviewsLikeCnt(prodReview_no);
				System.out.println(result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		// 상품후기 게시글 좋아요 가져오기
		@RequestMapping(value="/getProdReviewsLike/{prodReview_no}/{loginUser}",  method=RequestMethod.POST)
		public @ResponseBody Map<String, Object> getProdReviewsLike(@PathVariable("loginUser") String member_id, @PathVariable("prodReview_no") int prodReview_no) {
			logger.info("/getProdReviewsLike의 post방식 호출");
			Map<String, Object> result = new HashMap<String, Object>();
			System.out.println(member_id);
			System.out.println(prodReview_no);
			
			try {
				// 해당 게시글에 좋아요 가져오기
				result.put("myLike", service.getProdReviewsLike(member_id, prodReview_no));
				result.put("likeCnt", service.getProdReviewsLikeCnt(prodReview_no));
				System.out.println(result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	   
	   // 상품후기 작성 가능 여부 확인
		@RequestMapping(value="/confirmBuyingCheck/{loginUser}/{prodId}",  method=RequestMethod.POST)
		public @ResponseBody void confirmBuyingCheck(@PathVariable("loginUser") String member_id, @PathVariable("prodId") int prodId) {
			logger.info("/confirmBuyingCheck의 post방식 호출");
			System.out.println("/confirmBuyingCheck의 post방식 호출");
			//Map<String, Object> result = new HashMap<String, Object>();
			System.out.println(member_id);
			System.out.println(prodId);
			try {
				// 아이디, 상품번호로 주문 확정된 buyProduct 항목 수 가져오기 
				// 아이디, 상품번호로 해당 상품에 작성된 후기 수 가져오기
				System.out.println(service.getConfirmedOrder(member_id, prodId));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//return result;
		}
	
		// 상단 평균 별점 가져오기
			@RequestMapping(value="/getStarRating/{prodId}",  method=RequestMethod.POST)
			public @ResponseBody Map<String, Object> getStarRating(@PathVariable("prodId") int product_id) {
				System.out.println("getStarRating의 post방식 호출");
				Map<String, Object> result = new HashMap<String, Object>();
				System.out.println("getStarRating prodId: " + product_id);
				
				try {
					System.out.println("getStarRating number: " + service.getStarRating(product_id));
					result.put("getStarRating", service.getStarRating(product_id));
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result;
			}
	
	
//	==========================================정민 오빠 class 끝!! ======================================================================
	
	/**
	 * @Method Name : prodQAList
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 재고 수량 가져오는 메서드
	 * @param prodId
	 * @return
	 */
	@RequestMapping(value="/restProd", method=RequestMethod.GET)
	public ResponseEntity<Integer> prodQAList(@RequestParam("prodId") int prodId) {
		logger.info("재고 수량 확인");
		
		ResponseEntity<Integer> entity = null;
	      
	    try {
	       entity = new ResponseEntity<Integer>(QAService.getRestProdQty(prodId), HttpStatus.OK);
	    } catch (Exception e) {
	       e.printStackTrace();
	       entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
	    }
	    
	    return entity;
	}
		
	/**
	 * @Method Name : totProdQACnt
	 * @작성일 : 2021. 4. 6.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품문의 게시판의 글 개수를 세는 메서드
	 * @param prodId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/totProdQACnt", method=RequestMethod.POST)
	public ResponseEntity<Integer> totProdQACnt(@RequestParam("prodId") int prodId) throws Exception {
		logger.info("QA 개수 확인");
		
		System.out.println(prodId);
		
		ResponseEntity<Integer> entity = null;
		
		System.out.println(QAService.totalProdQACnt(prodId, 1, "*"));
		
		try {
			entity = new ResponseEntity<Integer>(QAService.totalProdQACnt(prodId, 1, "*"), HttpStatus.OK);
		} catch (Exception e) {
		    e.printStackTrace();
		    entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
		}
		    
		return entity;
	}
	
	
	/**
	 * @Method Name : prodQAList
	 * @작성일 : 2021. 4. 1.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시글 목록을 불러오는 메서드
	 * @param prodId
	 * @param page
	 * @param cate
	 * @param cri
	 * @return
	 */
	@RequestMapping(value="/prodQAList", method=RequestMethod.GET)
	public ResponseEntity<List<ProdQAVO>> prodQAList(@RequestParam("prodId") int prodId, @RequestParam("page") int page, @RequestParam("cate") String cate, PagingCriteria cri) {
		logger.info("QA 리스트 호출");
		
		System.out.println(prodId + ", " + cate + ", " + page);
		
		cri.setPage(page);
		System.out.println(cri);
		
		ResponseEntity<List<ProdQAVO>> entity = null;
	      
	    try {
	       entity = new ResponseEntity<List<ProdQAVO>>(QAService.prodQAListAll(prodId, 1, cri, cate), HttpStatus.OK);
	    } catch (Exception e) {
	       e.printStackTrace();
	       entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
	    }
	    
	    return entity;
	}
	
	/**
	 * @Method Name : prodQAReplyList
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시글의 답글 가져오는 메서드
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/prodQAReplyList", method=RequestMethod.POST)
	public ResponseEntity<List<ProdQAVO>> prodQAReplyList(@RequestBody ProdQAVO vo) {
		logger.info("QA 답글 리스트 호출");
		
		ResponseEntity<List<ProdQAVO>> entity = null;
	    
	    try {
	       entity = new ResponseEntity<List<ProdQAVO>>(QAService.prodQAReplyListAll(vo.getProdQA_no()), HttpStatus.OK);
	    } catch (Exception e) {
	       e.printStackTrace();
	       entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
	    }
	    
	    return entity;
	}
	
	/**
	 * @Method Name : prodQAPageing
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시판의 페이징 처리하는 메서드
	 * @param prodId
	 * @param cate
	 * @param cri
	 * @return
	 */
	@RequestMapping(value="/prodQAPP", method=RequestMethod.GET)
	public ResponseEntity<PagingParam> prodQAPageing(@RequestParam("prodId") int prodId, @RequestParam("cate") String cate, PagingCriteria cri) {
		logger.info("QA 리스트 페이징 호출");
		
		System.out.println("prodID : " + prodId + ", cate : " + cate);
		
		ResponseEntity<PagingParam> entity = null;
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		
		try {
			pp.setTotalCount(QAService.totalProdQACnt(1, prodId, cate));
			System.out.println(pp.toString());
			entity = new ResponseEntity<PagingParam>(pp, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
			e.printStackTrace();
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : addReplyCnt
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시글의 답글 수 가져오는 메서드
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/addReplyCnt", method=RequestMethod.POST)
	public ResponseEntity<Integer> addReplyCnt(@RequestBody ProdQAVO vo) {
		logger.info("replyCnt 호출");
		
		ResponseEntity<Integer> entity = null;
		
		try {
			int totRplyCnt = QAService.getReplyCnt(vo.getProdQA_no());
			entity = new ResponseEntity<Integer>(totRplyCnt, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Integer>(-1, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
		
	}

	/**
	 * @Method Name : updateViewCnt
	 * @작성일 : 2021. 4. 1.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 유저가 클릭한 상품 문의 게시글의 조회수를 증가시키는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateViewCnt", method=RequestMethod.POST)
	public ResponseEntity<String> updateViewCnt(@RequestBody ProdQAVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("QA 조회수 +1 ");
		
		System.out.println(vo.toString());
		
		ResponseEntity<String> entity = null;
		
		String no = String.valueOf(vo.getProdQA_no());
		Cookie readCookie = WebUtils.getCookie(request, "view" + no);
		
		if(readCookie == null) {
			Cookie newCookie = new Cookie("view" + no, no);
			newCookie.setPath("/mall/prodDetail/");
			newCookie.setMaxAge(60*60*24);
			response.addCookie(newCookie);
			
			if(QAService.prodQAViewCnt(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}

	/**
	 * @Method Name : getLike
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시판에서 이미 좋아요 누른 게시글 가져오는 메서드
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getLike", method=RequestMethod.GET)
	public ResponseEntity<List<ProdQAsLikeVO>> getLike(@RequestParam("userId") String userId) throws Exception {
		logger.info("pordQA 좋아요 불러오기");
		
		ResponseEntity<List<ProdQAsLikeVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ProdQAsLikeVO>>(QAService.getLikes(userId), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
		}
		    
		return entity;
	}
	
	/**
	 * @Method Name : updateLikeCnt
	 * @작성일 : 2021. 4. 1.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 유저가 좋아요 누른 상품 문의 게시글의 좋아요수를 증가시키는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateLikeCnt", method=RequestMethod.POST)
	public ResponseEntity<String> updateLikeCnt(@RequestBody ProdQAsLikeVO vo) throws Exception {
		logger.info("QA 좋아요 +1 ");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.prodQAInsertLike(vo)) {
			logger.info("좋아요 정보 입력 성공");
			if(QAService.prodQALikeCnt(vo.getProdQA_no())) {
				logger.info("좋아요 +1 성공");
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}			
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : deleteLike
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 게시글의 좋아요 취소하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteLike", method=RequestMethod.POST)
	public ResponseEntity<String> deleteLike(@RequestBody ProdQAsLikeVO vo) throws Exception {
		logger.info("QA 좋아요 -1 ");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.prodQADeleteLike(vo)) {
			if(QAService.prodQALikeCnt(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}			
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	/**
	 * @Method Name : checkSecretPwd
	 * @작성일 : 2021. 4. 6.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 유저가 입력한 비밀번호가 맞는지 확인 후, 일치하면 해당 게시판의 isDelete속성을 'Y'으로 변경하는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/checkSecretPwd", method=RequestMethod.POST)
	public ResponseEntity<String> checkSecretPwd(@RequestBody ProdQAVO vo) throws Exception {
		logger.info("QA 글 삭제");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.checkSecretPwd(vo.getProdQA_secretPassword(), vo.getProdQA_no())) {
			if(QAService.deleteProdQA(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			}
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : ShowInsertProdQA
	 * @작성일 : 2021. 4. 1.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 글 작성 페이지를 호출하는 메서드
	 * @param prodId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prodQAForm", method=RequestMethod.GET)
	public String ShowInsertProdQA(@RequestParam("prodId") int prodId) throws Exception {
		logger.info("QA 글쓰기 페이지 소환");
		
		return "cambakMall/prodQAForm";
	}
	
	@RequestMapping(value="/prodQAForm", method=RequestMethod.POST)
	public String uploadForm(@RequestParam("prodId") int prodId, @RequestParam("page") int page, @ModelAttribute ProdQAInsertDTO insertQA) throws Exception {
		logger.info("QA 글쓰기 저장");
		
		ResponseEntity<String> entity = null;
		insertQA.setProduct_id(prodId);
		
		System.out.println(insertQA.toString());

		if(insertQA.getProdQA_isSecret() == null) {
			insertQA.setProdQA_isSecret("N");
		} else {
			insertQA.setProdQA_isSecret("Y");
		}
		
		int getMaxNo = QAService.getMaxNo();
		
		int newNo = getMaxNo + 1;
		
		insertQA.setProdQA_ref(newNo);
		insertQA.setProdQA_refOrder(1);
		insertQA.setProdQA_step(1);
		
		System.out.println(insertQA.toString());
		
		if(QAService.insertProdQA(insertQA)) {
			return "redirect:/mall/prodDetail/main?prodId=" + prodId + "&page=" + page;
		}
		
		return "error";
	}
	
	/**
	 * @Method Name : prodQAReplyForm
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의글에 답글 달면 DB에 인서트 시켜주는 메서드
	 * @param prodId
	 * @param page
	 * @param no
	 * @param insertQA
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prodQAReplyForm", method=RequestMethod.POST)
	public ResponseEntity<String> prodQAReplyForm(@RequestParam("prodId") int prodId, @RequestParam("page") int page, @RequestParam("no") int no, @ModelAttribute ProdQAInsertDTO insertQA) throws Exception {
		logger.info("QA 답글 글쓰기 저장");
		
		ResponseEntity<String> entity = null;
		insertQA.setProduct_id(prodId);
		insertQA.setProdQA_ref(no);
		
		System.out.println(no);
		System.out.println(insertQA.toString());

		if(insertQA.getProdQA_isSecret() != null) {
			insertQA.setProdQA_isSecret("Y");
		} else {
			insertQA.setProdQA_isSecret("N");
		}
		
		int ref = QAService.getRef(no);
		int newRefOrder = QAService.getMaxRefOrder(no) + 1;
		int newStep = QAService.getMaxStep(no) + 1;
		
		System.out.println(newRefOrder + ", " + newStep);
		
		insertQA.setProdQA_ref(ref);
		insertQA.setProdQA_refOrder(newRefOrder);
		insertQA.setProdQA_step(newStep);
		
		System.out.println("최종 : " + insertQA.toString());
		
		if(QAService.insertProdQA(insertQA)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : uploadFile
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 글 작성할 떄, 사진 업로드 하면 서버에 일자별 파일 생성하는 메서드
	 * @param files
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> uploadFile(MultipartFile[] files, HttpServletRequest request) {
		logger.info("파일 업로드");
		
		ResponseEntity<List<String>> entity = null;
		
		System.out.println(request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA"));
//		System.out.println(request.getRealPath("resources/uploads/boardProdQA"));
		
		String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
		
		List<String> saveFileNames = new ArrayList<String>();
		
		System.out.println(files);
		
		for(int i = 0; i < files.length; i++) {
			System.out.println("업로드 파일 이름 : " + files[i].getOriginalFilename());
			System.out.println("업로드 파일 사이즈 : " + files[i].getSize());
			System.out.println("업로드 파일의 타입 : " + files[i].getContentType()); // 파일의 MIME type (못 바꾸기 때문에 이미지인지 판별할때 사용)
			
			try {
				saveFileNames.add(FileUploadProdcess.uploadFile(path, files[i].getOriginalFilename(), files[i].getBytes()));
				entity = new ResponseEntity<List<String>>(saveFileNames, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		
		System.out.println(saveFileNames.toString());
		return entity;
	}
	
	/**
	 * @Method Name : displayFile
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 서버에 저장된 사진 파일을 불러와 화면에 보여주는 메서드
	 * @param request
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	@ResponseBody // byte[]의 데이터(파일 데이터)가 web에 그대로 전송 되도록
	@RequestMapping("/displayFile")
	   public ResponseEntity<byte[]> displayFile(HttpServletRequest request, String fileName) throws IOException {
	      InputStream in = null;
	      ResponseEntity<byte[]> entity = null;
	      
	      try {
	         String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자 추출
	         
	         MediaType mType = MediaConfirm.getMediaType(ext); // 이미지 파일인지 아닌지를 검사하기 위해
	         
	         HttpHeaders header = new HttpHeaders();
	         
	         
	         
	         String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
//	         String uploadPath = path + "/2021/03/05";
	         fileName = fileName.replace('/', File.separatorChar);
	         logger.info(path + fileName);
	         System.out.println(path + fileName);
	         
	         in = new FileInputStream(path + fileName);
	         System.out.println(in);
	         
	         if (mType != null) {
	            header.setContentType(mType); 
	         } else {
	            fileName = fileName.substring(fileName.indexOf("_") + 1); // UUID_ 다음 originalFileName을 얻어옴
	            header.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 다운로드 가능한 파일임
	            header.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); // 다운로드 될 수 있도록 일종의 링크 제공
	         }
	      
	      
	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED); // 파일을 읽은 뒤 데이터를 그대로 전송
	      } catch (IOException e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	      } finally {
	         in.close();
	      }
	      
	      return entity;
	   }
	   
	   /**
	 * @Method Name : deleteFile
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 업로드 취소하거나 삭제하면, 서버에 저장된 파일도 삭제하는 메서드
	 * @param request
	 * @param fileName
	 * @return
	 */
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
		public ResponseEntity<String> deleteFile(HttpServletRequest request, String fileName) {
			logger.info("삭제할 파일 : " + fileName);
			
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
			
			MediaType mType = MediaConfirm.getMediaType(ext);
			
			String tmp = fileName.replace("thumb_", "");
			String originalFile = path + tmp; // 삭제해야 할 오리지널 이미지 파일
			String thumbFile = path + fileName; // 삭제해야 할 썸네일 이미지 파일
			// *************우리의 OS가 windows이므로 아래 코드를 해줘야 함. (window는 File.seperator : \, linux : /) **************
			originalFile = originalFile.replace('/', File.separatorChar);
			thumbFile = thumbFile.replace('/', File.separatorChar);
			// **********************************************************************************************************************
			
			logger.info("삭제할 파일 (original) : " + originalFile + ", (thumb) : " + thumbFile);
			
			if(mType != null) {
				// 이미지 파일이면,
				// 삭제할 파일과 경로
				new File(originalFile).delete();
				new File(thumbFile).delete();
				
			}
			
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
	
	/**
	 * @Method Name : showModiProdQA
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 글 수정 페이지 소환 메서드
	 * @param no
	 * @param prodId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.GET)
	public String showModiProdQA(@RequestParam("no") int no, @RequestParam("prodId") int prodId, Model model) throws Exception {
		logger.info("QA 글 수정 페이지 소환");
		
		model.addAttribute("prodQA", QAService.prodQADetail(prodId, no));
		System.out.println(model);
		
		return "cambakMall/prodQAModiForm";
	}
	
	/**
	 * @Method Name : modiProdQA
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 상품 문의 글 수정하면, 해당 데이터 DB에 업데이트 시켜주는 메서드
	 * @param prodId
	 * @param no
	 * @param page
	 * @param updateQA
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.POST)
	public String modiProdQA(@RequestParam("prodId") int prodId, @RequestParam("no") int no, @RequestParam("page") int page, ProdQAUpdateDTO updateQA, RedirectAttributes rttr) throws Exception {
		logger.info("QA 글 수정");
		
		updateQA.setProdQA_no(no);
		
		updateQA.setProduct_id(prodId);
		
		System.out.println(updateQA);
		
		if(updateQA.getProdQA_isSecret() != null) {
			updateQA.setProdQA_isSecret("Y");
		} else {
			updateQA.setProdQA_isSecret("N");
		}
		
		System.out.println(updateQA.toString());
		
		if(QAService.updateProdQA(updateQA)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/mall/prodDetail/main?prodId=" + prodId + "&page=" + page;
	}
	
	/**
	 * @Method Name : checkBucket
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 주문하기 전 장바구니에 담겨있는 상품 목록이 10개 초과했는지 알아보는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/checkBucket", method=RequestMethod.POST)
	public ResponseEntity<BucketVO> checkBucket(@RequestBody BucketVO vo) throws Exception {
		logger.info("주문하기 전 장바구니에 빈 공간 있는지 확인");
		
		ResponseEntity<BucketVO> entity = null;
		
		BucketVO tmpVO = vo;
		
		System.out.println(vo.toString());
		
		try {
			if(prodService.checkBucketQty(vo.getMember_id()) < 10 || prodService.checkBucket(vo.getMember_id(), vo.getPruduct_id()) != null) {
				logger.info("빈 공간이 있다면, 장바구니에 있는 상품인지 확인");
				entity = new ResponseEntity<BucketVO>(prodService.checkBucket(vo.getMember_id(), vo.getPruduct_id()), HttpStatus.OK);
			} else {
				tmpVO.setBucket_buyQty(11);
				entity = new ResponseEntity<BucketVO>(tmpVO, HttpStatus.OK);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/checkNonUserBucket", method=RequestMethod.POST)
	public ResponseEntity<NonUserBucketVO> checkNonUserBucket(@RequestBody NonUserBucketVO vo) throws Exception {
		logger.info("주문하기 전 장바구니에 빈 공간 있는지 확인");
		
		ResponseEntity<NonUserBucketVO> entity = null;
		
		NonUserBucketVO tmpVO = vo;
		
		System.out.println(vo.toString());
		
		try {
			if(prodService.checkNonUserBucketQty(vo.getNonUserBucket_ssid()) < 10 || prodService.checkNonUserBucket(vo.getNonUserBucket_ssid(), vo.getProduct_id()) != null) {
				logger.info("빈 공간이 있다면, 장바구니에 있는 상품인지 확인");
				System.out.println(prodService.checkNonUserBucket(vo.getNonUserBucket_ssid(), vo.getProduct_id()));
				entity = new ResponseEntity<NonUserBucketVO>(prodService.checkNonUserBucket(vo.getNonUserBucket_ssid(), vo.getProduct_id()), HttpStatus.OK);
			} else {
				tmpVO.setNonUserBucket_buyQty(11);
				entity = new ResponseEntity<NonUserBucketVO>(tmpVO, HttpStatus.OK);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : insertBucekt
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 장바구니에 새 상품 넣는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertBucekt", method=RequestMethod.POST)
	public ResponseEntity<String> insertBucekt(@RequestBody InsertintoBucketDTO vo) throws Exception {
		logger.info("장바구니에 상품 넣기");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(vo.toString());
		
		if(prodService.insertBucket(vo)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/insertNonUserBucket", method=RequestMethod.POST)
	public ResponseEntity<String> insertBucekt(@RequestBody InsertintoNonUserBucketDTO vo) throws Exception {
		logger.info("비회원 장바구니에 상품 넣기");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(vo.toString());
		
		if(prodService.insertNonUserBucket(vo)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * @Method Name : updateBucekt
	 * @작성일 : 2021. 4. 19.
	 * @작성자 : 김도연
	 * @변경이력 : 
	 * @Method 설명 : 장바구니에 이미 들어가 있는 상품을 또 장바구니에 넣고 싶다면, 해당 상품 업데이트 해주는 메서드
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateBucekt", method=RequestMethod.POST)
	public ResponseEntity<String> updateBucekt(@RequestBody InsertintoBucketDTO vo) throws Exception {
		logger.info("장바구니에 정보 업데이트하기");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(vo.toString());
		
		if(prodService.updateBucketQty(vo)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/updateNonUserBucekt", method=RequestMethod.POST)
	public ResponseEntity<String> updateNonUserBucekt(@RequestBody InsertintoNonUserBucketDTO vo) throws Exception {
		logger.info("비회원 장바구니에 정보 업데이트하기");
		
		ResponseEntity<String> entity = null;
		
		System.out.println(vo.toString());
		
		if(prodService.updateNonUserBucketQty(vo)) {
			entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
