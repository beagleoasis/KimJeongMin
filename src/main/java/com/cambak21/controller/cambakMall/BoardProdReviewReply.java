package com.cambak21.controller.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.ReplyProdReviewVO;
import com.cambak21.dto.InsertReplyProdReviewDTO;
import com.cambak21.service.boardProdReview.ReplyProdReviewService;

@Controller
@RequestMapping("/mall/prodDetail/*")
public class BoardProdReviewReply {

	@Inject ReplyProdReviewService service;
	
	// 새로운 댓글 추가 부분
		@RequestMapping(value="/insertProdReviewReply", method=RequestMethod.POST)
		// json 타입으로 반환
		public @ResponseBody void insertProdReviewReply(@RequestBody InsertReplyProdReviewDTO dto)  throws Exception {
			// @RequestBody ReplyVO vo : 유저가 입력한 데이터를 json으로 받아 ReplyVO vo에 저장
			System.out.println("insertProdReviewReply... POST...");
			System.out.println(dto);
			//대댓글이 아닌 경우, ref=자기 자신의 댓글. reforder는 입력하지 않아 0으로 처리한다.
			if(dto.getReplyProdReview_ref() == 0) {
				//System.out.println(dto);
				try {
					System.out.println("ReplyProdReview_no : " + service.getMaxNo());
					int getMaxReplyProdReview_no = service.getMaxNo();
					dto.setReplyProdReview_no(getMaxReplyProdReview_no);
					dto.setReplyProdReview_ref(getMaxReplyProdReview_no);
					System.out.println(dto);
					if(service.addProdReply(dto) == 1) {
						System.out.println("인서트 성공");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
			} 
			
			
			else {
				//대댓글인 경우, 제일 첫부모 댓글의 ReplyProdReview_no=자신의 ref로 설정.
				try {
					int getMaxReplyProdReview_no = service.getMaxNo();
					
					dto.setReplyProdReview_no(getMaxReplyProdReview_no);
					System.out.println("ref : " + dto.getReplyProdReview_ref());
					//reforder의 경우, ref=첫부모pk인 조건에서, maxReforder를 set
					
					int ref = dto.getReplyProdReview_ref();
					System.out.println("int ref : " + ref);
					int reforder = service.getMaxReforder(ref);
					System.out.println("reforder : " + reforder);
					dto.setReplyProdReview_refOrder(reforder);
					System.out.println(dto);
					if(service.addProdReply(dto)==1) {
						System.out.println("대댓글 인서트 성공");
					}
				} 
				catch (Exception e1) {
					e1.printStackTrace();
				}
			} // end of else
		}
		
		// 댓글 출력
		@RequestMapping(value="/getProdReviewReply/{prodReview_no}", method=RequestMethod.POST)
		public @ResponseBody List<ReplyProdReviewVO> getReplyList(@PathVariable("prodReview_no") int prodReview_no) throws Exception {
			System.out.println("getProdReviewReply... post...");
			
			List<ReplyProdReviewVO> prodReplyList = null;
			System.out.println(prodReview_no);
		
			try {
				prodReplyList = service.getListReply(prodReview_no);
				System.out.println(prodReplyList);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			return prodReplyList;
		}
		
		// 댓글 삭제
		@RequestMapping(value="/deleteProdReviewReply/{replyProdReview_no}", method=RequestMethod.POST)
		public @ResponseBody boolean deleteProdReviewReply(@PathVariable("replyProdReview_no") int replyProdReview_no) throws Exception {
			System.out.println("deleteProdReviewReply... POST...");
			System.out.println(replyProdReview_no);
			boolean deleteResult = false;
			try {
				deleteResult = service.deleteProdReviewReply(replyProdReview_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return deleteResult;
		}
		
		// 수정하려는 댓글 조회
		@RequestMapping(value="/readProdReviewReply/{replyProdReview_no}", method=RequestMethod.GET, produces = "text/html; charset=utf8")
		public @ResponseBody String readProdReviewReply(@PathVariable("replyProdReview_no") int replyProdReview_no) throws Exception {
			System.out.println("modifyProdReviewReply... GET...");
			System.out.println(replyProdReview_no);
			String result = null;
			try {
				
				result = service.readProdReviewReply(replyProdReview_no);
				System.out.println("modifyProdReviewReply... GET... result :" + result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		// 댓글 수정
				@RequestMapping(value="/modifyProdReviewReply/{replyProdReview_no}/{replyProdReview_content}", method=RequestMethod.POST)
				public @ResponseBody boolean modifyProdReviewReply(@PathVariable("replyProdReview_no") int replyProdReview_no, @PathVariable("replyProdReview_content") String replyProdReview_content) throws Exception {
					System.out.println("modifyProdReviewReply... POST...");
					System.out.println(replyProdReview_no);
					System.out.println("replyProdReview_content : " + replyProdReview_content);
					boolean modifyResult = false;
					try {
						
						modifyResult = service.modifyProdReviewReply(replyProdReview_no, replyProdReview_content);
						System.out.println("modifyResult : " + modifyResult);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					return modifyResult;
				}
		
		
}
