package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.service.boardNotice.BoardNoticeService;
import com.cambak21.service.boardNotice.NoticeReplyService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board/notice/*")
public class BoardNotice {

	@Inject
	private BoardNoticeService service;
	
	@Inject
	private NoticeReplyService nrservice;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardHumor.class);
	
	// 전체글 출력 10번까지만.. 롤링 쓰려고 ( Test용 )
	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	public  ResponseEntity<List<BoardVO>> listAll(Model model) throws Exception{
	
		ResponseEntity<List<BoardVO>> entity = null;
		entity = new ResponseEntity<List<BoardVO>>(service.getNoticeAll(), HttpStatus.OK);
	
		return entity;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public  String test(Model model) throws Exception{
	
		return "/cambakMain/board/notice/test";
	}
	
	// 페이징 처리된 게시판 출력
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public String listCri(PagingCriteria cri, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / listCri 페이징처리 목록 출력");
		
		List<BoardVO> lst = service.getListCriteria(cri);
	
		model.addAttribute("noticeList", lst); // 게시물 데이터
	
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.getTotalNoticeCnt());
		
		model.addAttribute("pagingParam", pp);
		return "cambakMain/board/notice/noticeMain";
	}
	
	// 게시판 상세 페이지 보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String noticehome(@RequestParam("no") int no, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.info("종진 / read 게시판 상세 페이지 이동");
		
		
		String readno = String.valueOf(no);
		String compaere = "notice" + readno;
		Cookie getloginCook = WebUtils.getCookie(request, "readBoard" + readno);

		if(getloginCook != null) {
			// 이미 읽었을 경우 처리
			if(getloginCook.getValue().equals(compaere)) {
				model.addAttribute("noticeBoard", service.noticeRead(no, "stay"));
				return "cambakMain/board/notice/noticeDetail";
			}
		}
		
			model.addAttribute("noticeBoard", service.noticeRead(no, "up"));
			Cookie readCook = new Cookie("readBoard" + readno, "notice" + readno);  // ssid 라는 이름으로 세션 ID를 남긴다..(실제 아이디나 비밀번호는 안됨!!)
			readCook.setPath("/");
			readCook.setMaxAge(60 * 60 * 24); // 하루 동안 
	        response.addCookie(readCook);
		
		
		
		return "cambakMain/board/notice/noticeDetail";
		
	}
	// 게시판 수정 클릭시 페이지로 이동
	@RequestMapping(value = "user/modi", method = RequestMethod.GET)
	public String modiNoticepage(@RequestParam("no") int no, Model model) throws Exception{
		logger.info("종진 / 공지사항 수정 페이지 이동");
		System.out.println(no);
			
		model.addAttribute("noticeBoard", service.noticeRead(no, "stay"));
		
		return "cambakMain/board/notice/noticeModify";
	}
	
	// 게시판 수정된 VO 로 게시판 수정
	@RequestMapping(value = "user/modi/{page}", method = RequestMethod.POST)
	public String modiNoticeBoard(BoardVO vo, @PathVariable("page") int page, RedirectAttributes rttr) throws Exception{
		
		
		
		logger.info("종진 / 공지사항 수정된 VO로 업데이트");
		
		if(service.modiNoticeBoard(vo)) {
			rttr.addFlashAttribute("result", "succeess");
		}
		
		return "redirect:/board/notice/read?no=" + vo.getBoard_no() + "&page=" + page;
	}
	
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String resisterNotice(BoardVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항 작성 하고 결과 알려주기");
	
			if(service.insertNotice(vo)) {
				rttr.addFlashAttribute("writeresult", "success");
			}
			
		return "redirect:/board/notice/listCri";
	}
	
	@RequestMapping(value = "user/register", method = RequestMethod.GET)
	public String goResisterNotice(BoardVO vo, Model model) throws Exception{
		logger.info("종진 / 공지사항 등록 페이지로 이동");
			
		return "cambakMain/board/notice/registerNotice";
	}
	
	
	
	@RequestMapping(value = "user/getReply/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyBoardVO>> lst(@PathVariable("bno") int bno) throws Exception{
		logger.info("종진 / 공지사항 해당 댓글 불러오기");
			
		ResponseEntity<List<ReplyBoardVO>> entity = null;
		entity = new ResponseEntity<List<ReplyBoardVO>>(nrservice.listNoticeReply(bno), HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "user/modiReply/{replyBoard_no}", method = RequestMethod.POST)
	public ResponseEntity<String> Replylst(@PathVariable("replyBoard_no") int replyBoard_no, @RequestBody ReplyBoardVO vo) throws Exception{
		logger.info("종진 / 공지사항 해당 댓글 수정하기");
		ResponseEntity<String> entity = null;
		vo.setReplyBoard_no(replyBoard_no);
		System.out.println(replyBoard_no + "," + vo.toString());
		
		nrservice.modiReplyBoard(vo);
		
		entity = new ResponseEntity<String>("Success", HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "user/insertReply/", method = RequestMethod.POST)
	public ResponseEntity<String> insertReplylst(@RequestBody ReplyBoardVO vo) throws Exception{
		logger.info("종진 / 공지사항에 댓글 작성하기");
		ResponseEntity<String> entity = null;
		System.out.println(vo.toString());
		
		nrservice.insertReplyBoard(vo);
		
		return entity;
	}
	
	@RequestMapping(value = "user/dropReply/{no}/{bno}", method = RequestMethod.GET)
	public String dropReplylst(@PathVariable("no") int no, @PathVariable("bno") int bno, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항에 댓글 삭제하기");
		System.out.println(bno);
		service.downReplyCnt(bno);
		
		if(nrservice.dropReply(no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/notice/read?no=" + bno;
	}
	
		@RequestMapping(value = "user/remove/{no}", method = RequestMethod.GET)
	public String removeNoticeBoard(@PathVariable("no") int no, RedirectAttributes rttr) throws Exception{
		logger.info("종진 / 공지사항에 상세글 삭제하기");
				
		if(service.removeNoticeBoard(no)) {
			rttr.addFlashAttribute("result", "success");
		}
	
		return "redirect:/board/notice/listCri";
	}
	
		
		@RequestMapping(value="/search", method=RequestMethod.GET)
		public String search(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
				logger.info("세부 검색값에 따른 검색을 시작 합니다.");
				model.addAttribute("noticeList", service.noticeSearch(scri, cri));
				
				PagingParam pp = new PagingParam();
				pp.setCri(cri);
				pp.setTotalCount(service.getSearchTotalNoticeBoardCnt(scri));
				System.out.println(pp.toString());
				model.addAttribute("pagingParam", pp);
							
				return "cambakMain/board/notice/noticeMain";
		}	
	
		
	
	
	
}
