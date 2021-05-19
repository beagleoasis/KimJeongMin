package com.cambak21.controller.cambakMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckReviewVO;
import com.cambak21.domain.MemberLittleOrderVO;
import com.cambak21.domain.MemberOrderVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MyPointVO;
import com.cambak21.domain.PointVO;
import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.RefundVO;
import com.cambak21.domain.paymentVO;
import com.cambak21.service.cambakMain.MyMallService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/myMall/*")
public class MyMallController {
	
	@Inject
	private MyMallService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MyMallController.class);

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 대기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("myRefund")
	public String myRefund(Model model, @SessionAttribute("loginMember") MemberVO member, PagingCriteria cri) throws Exception {
		
		PagingParam pp = new PagingParam();
		cri.setPerPageNum(1);
		cri.getListCount(1);
		pp.setCri(cri);
		
		pp.setTotalCount(service.getTotalRefund(member.getMember_id()));
		System.out.println("총페이지 수는 " + service.getTotalRefund(member.getMember_id()));
		
		model.addAttribute("pp", pp);
		model.addAttribute("refundList", service.getRefundList(member.getMember_id(), cri));
		System.out.println("@@@@@@@@@@@@@@@@@@@"+service.getRefundList(member.getMember_id(), cri).toString());
		return "cambakMain/myPage/myRefund";
	}
	
	@RequestMapping("myOrder")
	public String myOrder(Model model, @SessionAttribute("loginMember") MemberVO member, PagingCriteria cri) throws Exception{
		model.addAttribute("order", service.getTotalOrderList(member.getMember_id(), cri));
		System.out.println(service.getTotalOrderList(member.getMember_id(), cri).toString());
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalOrder(member.getMember_id()));
		System.out.println("여기는 마이오더" + service.getTotalOrder(member.getMember_id()));
		System.out.println(cri.toString());
		model.addAttribute("pagingParam", pp);
		
		return "cambakMain/myPage/myOrder";
	}
	
	@RequestMapping(value="searchOrder", method=RequestMethod.POST)
	public String searchOrder(@SessionAttribute("loginMember") MemberVO member, SearchCriteria scri, PagingCriteria cri, Model model) throws Exception{
		model.addAttribute("order", service.searchOrder(scri,cri, member.getMember_id()));
		
		System.out.println(service.searchOrder(scri,cri, member.getMember_id()).toString());
		PagingParam pp = new PagingParam();
		SearchCriteria sc = new SearchCriteria();
		
		pp.setCri(cri);
		System.out.println("@@#@#@#@#@#@@##@#@@#" + service.searchOrderCnt(scri, member.getMember_id()));
		pp.setTotalCount(service.searchOrderCnt(scri, member.getMember_id()));
		
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", sc);
		
		return "cambakMain/myPage/myOrder";
	}
	
	@RequestMapping(value="/detail/{payment_serialNo}", method = RequestMethod.GET)
	public String orderDetail(@SessionAttribute("loginMember") MemberVO member, @PathVariable("payment_serialNo") int payment_serialNo, Model model) throws Exception{
		
		//주문 정보 가져오기 서비스단호출
		model.addAttribute("order", service.getOrder(member.getMember_id(),payment_serialNo));
		System.out.println(service.getOrder(member.getMember_id(),payment_serialNo).toString());
		//주소 정보 가져오기 서비스단 호출
		int destNo = service.getDest(member.getMember_id(),payment_serialNo);
		model.addAttribute("dest", service.getDestOne(destNo));
		System.out.println(service.getDestOne(destNo).toString());
		
		//결제 정보 가져오기
		int payNo = service.getPayno(member.getMember_id(),payment_serialNo);
		model.addAttribute("payInfo", service.getPayInfo(payNo));
		System.out.println(service.getPayInfo(payNo).toString());
		
		return "cambakMain/myPage/orderDetail";
	}
	
	@Transactional
	@RequestMapping(value = "myOrder/purchaseSubmit", method = RequestMethod.GET)
	public ResponseEntity<String> purchaseSubmit(@RequestParam("payInfo_no") int payInfo_no, @RequestParam("payment_date") String payment_date, @RequestParam("member_id") String member_id, @RequestParam("payment_no") int payment_no) {
		
		System.out.println("여기옵니까?");
		ResponseEntity<String> entity = null;
		
		try {
			service.purchaseSubmit(payInfo_no, payment_date);
			
			service.changePointDate(member_id, payment_date);
			
			int pointVal = service.getPointVal(member_id, payment_date);
			
			service.plusPoint(member_id, pointVal);
		
			int totPrice = service.plusTotPurchase(payment_no);
			service.insertTotPurchase(member_id, totPrice);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "myOrder/checkReview", method = RequestMethod.GET)
	public ResponseEntity<String> checkReview(@RequestParam("member_id") String member_id, @RequestParam("buyProduct_no") int buyProduct_no ){
		
		ResponseEntity<String> entity = null;
		
		try {
			CheckReviewVO vo = service.checkReview(member_id, buyProduct_no);
			if(vo == null) {
				entity = new ResponseEntity<String>("noValue", HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("hasValue", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@Transactional
	@RequestMapping(value = "myOrder/insertRefund", method = RequestMethod.POST)
	public ResponseEntity<String> insertRefund(@RequestParam("payment_no") int payment_no, @RequestParam("refundnExchange_reason") String refundnExchange_reason, @RequestParam("refundnExchange_status") String refundnExchange_status, @RequestParam("member_id") String member_id, @RequestParam("payment_date") String payment_date){
		ResponseEntity<String> entity = null;
		
		try {
			List<paymentVO> vo = service.getPaymentSerialNo(payment_no);
			
			System.out.println(vo.size());
			for(int i=0; i < vo.size(); i++) {
				int serialNo = vo.get(i).getPayment_serialNo();
				service.insertRnE(serialNo, member_id, refundnExchange_reason, refundnExchange_status);
				
				service.changePayComit(refundnExchange_status, payment_no);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping(value = "/refund/{payment_serialNo}", method = RequestMethod.GET)
	public String addRefund() {
		return "cambakMain/myPage/addRefund";
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 원영 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 정민 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/**
	 * @Method Name : showMyPointListMain
	 * @작성일 : 2021. 4. 11.
	 * @작성자 : Kim Jeong Min
	 * @변경이력 : 
	 * @Method 설명 : myPage의 나의 적립금 기본 get방식 호출
	 * @return
	 */
	@RequestMapping(value="myPoint", method=RequestMethod.GET)
	public String showMyPointListMain(){
		
		return "cambakMain/myPage/myPoint";
	}
		
	
	/**
	 * @Method Name : myPointList
	 * @작성일 : 2021. 4. 11.
	 * @작성자 : Kim Jeong Min
	 * @변경이력 : 
	 * @Method 설명 : myPage-나의 적립금 리스트 가져오는 부분
	 * @param member_id
	 * @param page
	 * @return
	 */
	@RequestMapping(value="myPoint/{member_id}/{pageNum}", method=RequestMethod.POST)
	   public @ResponseBody Map<String, Object> myPointList(@PathVariable("member_id") String member_id, @PathVariable("pageNum") int page){

	       Map<String, Object> result = new HashMap<String, Object>();
	       logger.info("/myPointList의 ajax-POST방식 호출");
	       System.out.println(member_id);
	       System.out.println(page);
	       List<MyPointVO> vo = null;
	       PagingCriteria cri = new PagingCriteria();
	       PagingParam pp = new PagingParam();
	       pp.setCri(cri);
	       cri.setPage(page);
	       
	       try {
			vo = service.getPointList(member_id, cri);
			pp.setTotalCount(service.getPointListCnt(member_id));
			System.out.println(vo.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       result.put("vo", vo);
	       result.put("pagingParam", pp);
	       
	      return result;
	   }
	
	@RequestMapping(value="myPointInfo/{member_id}", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> myPointInfo(@PathVariable("member_id") String member_id){
		   Map<String, Object> result = new HashMap<String, Object>();
	       logger.info("/myPointInfo의 ajax-POST방식 호출");
	       
	       try {
			result.put("myTotPoint", service.getTotMyPoint(member_id));
			result.put("myTotFuturePoint", service.getTotMyFuturePoint(member_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       System.out.println(result.toString());
	       return result;
	}
	
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 승권 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("myQnA")
	public String myPageLikeBoards(Model model, @SessionAttribute("loginMember") MemberVO loginMember, PagingCriteria cri) throws Exception {
		logger.info("승권 / 상품문의 게시글 get 호출");
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getQaCnt(loginMember.getMember_id()));
		
		model.addAttribute("pp", pp);
		model.addAttribute("QaList", service.getMyQAList(loginMember.getMember_id()));
		
		return "cambakMain/myPage/myQnA";
	}
	
	@RequestMapping("answer/{no}")
	@ResponseBody
	public ResponseEntity<ProdQAVO> answer(@PathVariable("no") int prodQA_no) {
		ResponseEntity<ProdQAVO> entity = null;
		
		System.out.println("prodQA_no : " + prodQA_no);
		
		try {
			entity = new ResponseEntity<ProdQAVO>(service.getProdQAVO(prodQA_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ProdQAVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 태훈 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value = "/userProdOrder/{userName}",method =RequestMethod.POST)
	public String userProdOrder(PagingCriteria cri,@PathVariable("userName") String userName,Model model) throws Exception{
		
		List<MemberLittleOrderVO> vo = service.MemberLittleOrder(cri, userName);
		System.out.println(vo);
		model.addAttribute("order",vo);
		return "cambakMall/userProdOrder";
	}
	@RequestMapping(value = "/userProdOrder/{serialNo}/{userName}",method =RequestMethod.POST)
	public String userOrderDetail(@PathVariable("serialNo") int serialNo,@PathVariable("userName") String userName,Model model) throws Exception{
		
		MemberOrderVO vo = service.MemberDetailOrder(serialNo, userName);
		System.out.println(vo);
		return "cambakMall/userProdOrder";
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
}
