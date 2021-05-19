package com.cambak21.controller.boards;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BoardQAVO;
import com.cambak21.domain.BoardVO;
import com.cambak21.domain.SearchBoardQAVO;
import com.cambak21.dto.InsertBoardQADTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateBoardQADTO;
import com.cambak21.service.boardQA.BoardQAService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardQAController {
	
	@Inject
	private BoardQAService service;
	
	private static Logger logger = LoggerFactory.getLogger(BoardQAController.class);
	
	@RequestMapping("/qa/list")
	public String BoardQAList(Model model, PagingCriteria cri) throws Exception {
		logger.info("게시글 리스트");
		model.addAttribute("boardList", service.listBoardQA(cri));
		
		System.out.println(service.listBoardQA(cri).toString());
		
		logger.info(cri.toString());
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.boardQAtotalCnt());
		logger.info(pp.toString());
		
		model.addAttribute("pagingParam", pp);
		
		return "cambakMain/board/QA/boardQAList";
	}
	
	@RequestMapping("/qa/write")
	public String BoardQAWrite(@RequestParam("page") int page) {
		logger.info("게시글 작성");
		
		return "cambakMain/board/QA/boardQAWrite";
	}
	
	@RequestMapping(value="/qa/write", method=RequestMethod.POST)
	public String BoardQAWrite(@RequestParam("page") int page, InsertBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 작성(POST)");
		System.out.println(dto.toString());
		ra.addFlashAttribute("status", "writeOk");
		
		return "redirect:/board/qa/detail?no=" + service.writeBoardQA(dto) + "&page=" + page; // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}
	
	@RequestMapping(value="/qa/detail", method=RequestMethod.GET)
	public String BoardQADetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("no") int board_no, Model model) throws Exception {
		
		logger.info("상세게시글 호출");
		
		String no = String.valueOf(board_no);
		Cookie cookie = WebUtils.getCookie(request, "readBoard" + no);
		
		if (cookie == null) { // 금일 상세 게시글 확인 전 조회수 1증가
			
			Cookie readCookie = new Cookie("readBoard" + no, no);
			readCookie.setPath("/");
			readCookie.setMaxAge(60 * 60 * 24); // 하루 동안
			response.addCookie(readCookie);
			
			service.viewQACnt(board_no); // 조회수 1증가
		}
		
		BoardQAVO vo = service.readBoardQA(board_no);
		
		
		model.addAttribute("board", vo);
		return "cambakMain/board/QA/boardQADetail";
	}
	
	@RequestMapping(value="/qa/delete", method=RequestMethod.GET)
	public String BoardQADelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("게시글 삭제");
		
		service.delBoardQA(board_no);
		
		ra.addFlashAttribute("status", "deleteOk");
		
		return "redirect:/board/qa/list";
	}
	
	@RequestMapping("/qa/modi")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("게시글 수정");
		
		model.addAttribute("board", service.readBoardQA(no));
		
		return "cambakMain/board/QA/boardQAModi";
	}
	
	@RequestMapping(value="/qa/modi", method=RequestMethod.POST)
	public String BoardModi(UpdateBoardQADTO dto, RedirectAttributes ra) throws Exception {
		logger.info("게시글 수정(post)");
		
		service.modiBoardQA(dto);
		
		ra.addFlashAttribute("status", "modiOk");
		
		
		return "redirect:/board/qa/detail?no=" + dto.getBoard_no();
	}
	
	@RequestMapping(value="/qa/search", method=RequestMethod.GET)
	public String BoardSearch(SearchCriteria scri, Model model, PagingCriteria cri) throws Exception {
		logger.info("게시글 검색");
		List<BoardQAVO> search = service.searchListBoardQA(scri, cri);
		
		model.addAttribute("boardList", search);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.searchBoardQAtotalCnt(scri));
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", scri);
		
		System.out.println(pp.toString());
		System.out.println(scri.toString());
		
		return "cambakMain/board/QA/boardQAList";
	}
	
	@RequestMapping(value = "/qa/like", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> BoardQALike(@RequestBody InsertLikeBoard dto) {
		logger.info("좋아요 호출");
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			// map을 보내는 이유
			// 유저가 눌를때마다 추천이 on/off되기 때문에
			// on인지 off인지 가져와야 하고, 추천수도 가져와야 했음
			// ajax처리 해야하기 때문에 갯수를 가져와서 바로 출력 (페이지 로딩 X)
			entity = new ResponseEntity<Map<String, Object>>(service.insertLikeBoard(dto), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/qa/like/check", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> LikeCheck(@RequestParam("member_id") String member_id, @RequestParam("board_no") int board_no) {
		logger.info("좋아요 호출");
		ResponseEntity<Integer> entity = null;

		try {
			entity = new ResponseEntity<Integer>(service.preCheckLike(member_id, board_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}