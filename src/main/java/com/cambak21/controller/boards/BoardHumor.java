package com.cambak21.controller.boards;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BoardVO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.service.BoardHumor.BoardHumorService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("board/humor/*")
public class BoardHumor {
	
	@Inject
	private BoardHumorService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardHumor.class);
	
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(PagingCriteria cri, Model model) throws Exception{
		
		
		model.addAttribute("boardList", service.listBoardHumorCriteria(cri));
		
		logger.info(cri.toString());
		
		PagingParam pp = new PagingParam();
		
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalBoardHumorCnt());
		
		model.addAttribute("pagingParam", pp);
		logger.info(pp.toString());
		
		return "cambakMain/board/humor/listAll";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(BoardVO vo, Model model) {
		
		return "cambakMain/board/humor/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wirtePost(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("register post 호출 ");
		logger.debug(vo.toString());
		
		if(service.insertBoardHumor(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cambakMain/board/humor/listAll?page=1";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String readBoard(HttpServletRequest request, HttpServletResponse response, @RequestParam("no") int no, Model model) throws Exception{
		
		Cookie cookie = WebUtils.getCookie(request, "read" + no);
		
		if(cookie ==null) {
			
			Cookie readCookie = new Cookie("read" + no + "", no+"");
			readCookie.setPath("/");
			readCookie.setMaxAge(60*60*24);
			response.addCookie(readCookie);
			
			service.updateViewCnt(no);
		}
		
		model.addAttribute("board", service.readBoardHumor(no));
		return "/cambakMain/board/humor/read";
	}
	
	@RequestMapping(value = "/modi", method = RequestMethod.GET)
	public String modiBoard(@RequestParam("no") int no, Model model) throws Exception{
		model.addAttribute("board", service.readBoardHumor(no));
		return "/cambakMain/board/humor/modi";
	}
	
	@RequestMapping(value = "/modi", method = RequestMethod.POST)
	public String modiBoardPost(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		System.out.println(vo.toString());
		if(service.modifyBoardHumor(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/humor/listAll?page=1";
	}
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String delBoard(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception{
		if(service.removeBoardHumor(no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/humor/listAll?page=1";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception{
		
		model.addAttribute("boardList", service.goSearch(scri,cri));
		
		PagingParam pp = new PagingParam();
		SearchCriteria sc = new SearchCriteria();
		
		pp.setCri(cri);
		pp.setTotalCount(service.searchBoardCnt(scri));
		
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", sc);
		
		return "/cambakMain/board/humor/listAll";
	}
	
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> BoardHumorLike(@RequestBody InsertLikeBoard dto){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			entity = new ResponseEntity<Map<String,Object>>(service.insertLikeBoard(dto), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/likeCheck", method = RequestMethod.POST)
	public ResponseEntity<Integer> LikeCheck(@RequestParam("member_id") String member_id, @RequestParam("board_no") int board_no){
		
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
