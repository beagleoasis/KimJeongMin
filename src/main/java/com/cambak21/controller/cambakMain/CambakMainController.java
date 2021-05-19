package com.cambak21.controller.cambakMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CampingVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.service.cambakMain.CambakMainService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping(value="/index/*")
public class CambakMainController {

	@Inject
	private CambakMainService service;
	
//	=============================================효원 메인부분 =================================================================
	@RequestMapping(value="/main", method=RequestMethod.GET)
	private String mainPageIndex(Model model) throws Exception {
		
		// 캠박이일 추천 캠핑장 3곳 랜덤으로 담아서 전달
		model.addAttribute("CampingSites", service.randomListCambak());
		
		// 캠박이일 게시판 5개의 최신글 5개 씩 담아서 전달
		model.addAttribute("Boards", service.readRecentBoard());
		
		return "/cambakMain/cambak21Main";
	}
	
	@ResponseBody
	@RequestMapping(value="/main/autoSearch", method=RequestMethod.POST)
	private ResponseEntity<List<String>> autoSearch(@RequestParam("keyword") String keyword) throws Exception {
		ResponseEntity<List<String>> entity = null;
		entity = new ResponseEntity<List<String>>(service.autoSearch(keyword), HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	
	
	
	
// ================================================효원 메인 끝 ==================================================================
//	==============================================도연 검색 결과 부분 ============================================================
	@RequestMapping(value="/result", method=RequestMethod.GET)
	private String getResultPage() throws Exception {
		
		return "/cambakMain/cambak21Result";
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	private @ResponseBody Map<String, Object> getCampings(@RequestParam("keyword") String keyword, @RequestParam(value="page", required=false, defaultValue="1") int page, PagingCriteria cri) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<CampingVO> campingLst = new ArrayList<CampingVO>();
		PagingParam pp = new PagingParam();
		
		cri.setPage(page);
		pp.setCri(cri);
		pp.setTotalCount(service.getTotCnt(keyword));
		
		System.out.println(pp);
		
		campingLst = service.getCampings(keyword, cri);
		
		result.put("campings", campingLst);
		result.put("pagings", pp);
		
		return result;
	}
	
	@RequestMapping(value="/resultBoard/{flag}/{keyword}/{page}", method=RequestMethod.POST)
	private @ResponseBody Map<String, Object> resultBoard(@PathVariable("keyword") String keyword, @PathVariable(value="page") int page, PagingCriteria cri, @PathVariable("flag") int flag) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<BoardVO> boardLst = new ArrayList<BoardVO>();
		
		PagingParam pp = new PagingParam();
		System.out.println(flag + ", " + keyword + ", " + page);
		
		cri.setPage(page);
		pp.setCri(cri);
		pp.setTotalCount(service.getTotBoardCnt(keyword, flag));
		
		System.out.println(pp);
		
		boardLst = service.getBoards(keyword, cri, flag);
		System.out.println(boardLst);
		result.put("boards", boardLst);
		
		result.put("pagings", pp);
		
		return result;
	}
	
	
	
	
//	==============================================도연 검색 결과 끝 ================================================================
	
//	==============================================정민 상세페이지 부분 =============================================================
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	private String getDetailPage() throws Exception {
		
		return "/cambakMain/cambak21Detail";
	}
	
	@RequestMapping(value="/campingDetail/{contentId}", method=RequestMethod.POST)
	private @ResponseBody CampingVO showCampingDetail(@PathVariable("contentId") String camping_contentId) throws Exception {
		System.out.println("campingDetail Post방식");
		System.out.println(camping_contentId);
		CampingVO vo = null;
		vo = service.getCampingDetail(camping_contentId);
		System.out.println(vo.toString());
		
		return vo;
	}
	
	
	
	
	
//	===============================================정민 상세페이지 끝 ===============================================================
	
	
	
}
