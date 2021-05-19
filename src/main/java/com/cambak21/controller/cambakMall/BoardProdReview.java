package com.cambak21.controller.cambakMall;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ProdReviewVO;
import com.cambak21.domain.ProdReviewsLikeVO;
import com.cambak21.service.boardProdReview.ProdReviewService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/cambakMall")
public class BoardProdReview {

	@Inject
	private ProdReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardProdReview.class);

	   @RequestMapping("/prodReviews")
	   public void showProdMain() {
		   
	   }
   
	   // ajax이용 get방식 리스트 출력
	   @RequestMapping(value = "/prodReviews/{product_id}", method=RequestMethod.GET)
	   public @ResponseBody Map<String, Object> prodReviewsList(@PathVariable("product_id") int product_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam("orderList") String orderList) {
	      System.out.println(product_id);
	      System.out.println(page);
	      System.out.println(orderList.toString());
	      logger.info("/prodReviews의 ajax-GET방식 호출");
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
		return "cambakMall/prodReviewsWriting";
	}
	
	// 상품후기 게시글 작성
	@RequestMapping(value="/writingProdReviews", method = RequestMethod.POST)
	public String writingProdReviewPost(ProdReviewVO vo, RedirectAttributes rttr) throws Exception {
		// 상품후기 게시글 작성 페이지에서 등록 버튼 클릭 시
		logger.info("/writingProdReviews의 post방식 호출");
		logger.info(vo.toString());
		
		if(service.insert(vo) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// return 할 페이지에 product_id를 보내서 해당 상품에 대한 게시판으로 가도록 처리 필요..
		return "cambakMall/prodReviews";
	}
	
	// 상품후기 게시글 수정 페이지 출력
	@RequestMapping(value="/prodReviewsModify", method=RequestMethod.GET)
	public void modifyProdReviewGet(@RequestParam("prodReview_no") int prodReview_no, @RequestParam("member_id") String member_id, Model model) throws Exception{
		logger.info("/prodReviewsModify 페이지 GET 호출");
		
		model.addAttribute("board", service.readProdBoard(prodReview_no));
		model.addAttribute("prodReview_no", prodReview_no);
		
	}
	
	// 상품후기 게시글 수정 업데이트
	@RequestMapping(value="/prodReviewsModify", method=RequestMethod.POST)
	public String modifyProdReviewPost(ProdReviewVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("/prodReviewsModify의 post방식 호출");
		System.out.println("vo : " + vo);
		System.out.println("service.updateProdBoard(vo) :" + service.updateProdBoard(vo));
		if(service.updateProdBoard(vo) == 1) {
			rttr.addFlashAttribute("result", "updateSuccess");
		}
		return "cambakMall/prodReviews";
	}
	
	
	// 상품후기 게시글 삭제
	@RequestMapping(value="/prodReviewsDelete", method=RequestMethod.GET)
	public String prodReviewsDelete(@RequestParam("prodReview_no") int prodReview_no, @RequestParam("prodId") int prodId, RedirectAttributes rttr) throws Exception {
		logger.info("/prodReviewsDelete의 post방식 호출");
		if(service.deleteProdBoard(prodReview_no, prodId) ==1) {
			rttr.addFlashAttribute("result", "deleteSuccess");
		}

		return "cambakMall/prodReviews";
	}
	
	// 상품후기 게시글에 대한 좋아요 클릭
	@RequestMapping(value="/insertLikeProdReviews/{member_id}/{prodReview_no}", method=RequestMethod.POST)
	public @ResponseBody int insertLikeProdReviews(@PathVariable("member_id") String member_id, @PathVariable("prodReview_no") int prodReview_no) {
		logger.info("/insertLikeProdReviews의 post방식 호출");
		System.out.println(member_id);
		System.out.println(prodReview_no);
		int result = 0;
		try {
			// 해당 게시글에 좋아요 처리
			service.insertLikeProdReviews(member_id, prodReview_no);
			// 게시글 좋아요 수
			result = service.getProdReviewsLikeCnt(prodReview_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 상품후기 게시글 좋아요 가져오기
	@RequestMapping(value="/getProdReviewsLike/{member_id}/{prodReview_no}",  method=RequestMethod.POST)
	public @ResponseBody int getProdReviewsLike(@PathVariable("member_id") String member_id, @PathVariable("prodReview_no") int prodReview_no) {
		logger.info("/getProdReviewsLike의 post방식 호출");
		System.out.println(member_id);
		System.out.println(prodReview_no);
		int result = 0;
		
		try {
			// 해당 게시글에 좋아요 가져오기
			result = service.getProdReviewsLike(member_id, prodReview_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
