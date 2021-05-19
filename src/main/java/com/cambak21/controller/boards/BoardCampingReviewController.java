package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertCRBoardDTO;
import com.cambak21.dto.UpdateCRBoardDTO;
import com.cambak21.service.boardCampingReview.CampingReviewService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board/campingreview/*")
public class BoardCampingReviewController {
	
	@Inject
	private CampingReviewService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardCampingReviewController.class);
	
	@RequestMapping("/")
	public String BoardCRList(Model model, PagingCriteria cri) throws Exception {
		logger.info("영광 / 게시글 리스트 get방식 호출");
		
		model.addAttribute("boardList", service.listBoardCampingReview(cri));
		
		return "cambakMain/board/campingreview/campingreview";
	}
	
	// 페이징 처리된 게시판 출력
		@RequestMapping(value = "/listcri", method = RequestMethod.GET)
		public String listCri(PagingCriteria cri, Model model) throws Exception{
			logger.info("영광 / listCri 페이징처리 목록 출력");
			
			List<BoardVO> lst = service.listBoardCampingReview(cri);
			System.out.println(lst.toString());
			
			model.addAttribute("CRboardlist", lst); // 게시물 데이터
		
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.boardCRtotalCnt());
			System.out.println(pp.toString());
			model.addAttribute("pagingParam", pp);
			return "cambakMain/board/campingreview/campingreview";
		}
	
	
	
	@RequestMapping("/write")
	public String BoardCRWrite() {
		logger.info("영광 / 글 쓰기 폼 get 방식 호출");
		
		return "cambakMain/board/campingreview/boardCRWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardCRWrite(InsertCRBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("영광 / 글 작성 POST 방식 호출");
		
		ra.addFlashAttribute("status", "writeOk");
		
		return "redirect:/board/campingreview/detail?no=" + service.writeBoardCR(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String BoardCRDetail(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("영광 / 게시글 detail GET 상세페이지 호출");
		
		model.addAttribute("board", service.readBoardCampingReview(no));
		
		return "cambakMain/board/campingreview/boardCRDetail";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String BoardCRDelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("영광 / 글 삭제 get방식 호출");
		
		service.deleteBoardCR(board_no);
		
		ra.addFlashAttribute("status", "deleteOk");
		
		return "redirect:/board/campingreview/";
	}
	
	@RequestMapping("/modi")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("영광 / 글 수정 get 방식 호출");
		
		model.addAttribute("board", service.readBoardCampingReview(no));
		
		return "cambakMain/board/campingreview/boardCRModi";
	}
	
	@RequestMapping(value="/modi", method=RequestMethod.POST)
	public String BoardModi(UpdateCRBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("영광 / 글 수정 post 방식 호출");
		
		service.modiBoardCR(dto);
		
		ra.addFlashAttribute("status", "modiOk");
		
		
		return "redirect:/board/campingreview/detail?no=" + dto.getBoard_no();
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
			logger.info("세부 검색값에 따른 검색을 시작 합니다.");
			model.addAttribute("CRboardlist", service.searchListBoardCR(scri, cri));
			
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.searchBoardCnt(scri));
			System.out.println(pp.toString());
			model.addAttribute("pagingParam", pp);
			return "cambakMain/board/campingreview/campingreview";
	}
	
}
