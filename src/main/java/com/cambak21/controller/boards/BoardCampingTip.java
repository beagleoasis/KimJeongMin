package com.cambak21.controller.boards;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.domain.SearchCampingTipVO;
import com.cambak21.dto.CamBoardTipLikeDTO;
import com.cambak21.dto.CamBoardTipModifyDTO;
import com.cambak21.dto.CamBoardTipReplyDTO;
import com.cambak21.dto.CamBoardTipRereplyDTO;
import com.cambak21.dto.CamBoardTipWriteDTO;
import com.cambak21.service.boardCampingTip.CampingTipBoardService;
import com.cambak21.util.BoardCsFileUpload;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping(value="/board/*")
public class BoardCampingTip {

	@Inject
	private CampingTipBoardService service;
	
	@RequestMapping(value="/campingTip/list", method=RequestMethod.GET)
	public String listAll(PagingCriteria cri, Model model) throws Exception {
		// 캠핑팁 게시판 모든 게시글 출력
		
		model.addAttribute("boardList", service.listCampingTipBoard(cri));
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.totalTipBoard());
		
		model.addAttribute("pagingParam", pp);
		return "cambakMain/board/campingTip/tipBoardList";
	}
	
	@RequestMapping(value="/campingTip/list/search", method=RequestMethod.GET)
	public String tipBoardSearch(SearchCampingTipVO word, Model model, PagingCriteria cri) throws Exception {
		// 캠핑팁 게시판 검색어별 결과 출력
		
		List<BoardVO> vo = service.tipBoardSearch(word, cri);
		
		model.addAttribute("boardList", vo);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.totalTipBoardSearch(word));
		model.addAttribute("pagingParam", pp);
		model.addAttribute("search", word);
		return "cambakMain/board/campingTip/tipBoardList";
	}
	
	@RequestMapping(value="/campingTip/view", method=RequestMethod.GET)
	public String viewBoard(HttpServletRequest request, HttpServletResponse response,  @RequestParam("no") int board_no, @RequestParam("id") String board_category, Model model) throws Exception {
		// 캠핑팁 상세글 조회
		
		String no = String.valueOf(board_no);
		Cookie cookie = WebUtils.getCookie(request, "todayReadTipBoard" + no);
		
		if (cookie == null) { // 금일 상세 게시글 확인 전 조회수 1증가
			
			Cookie readCookie = new Cookie("todayReadTipBoard" + no, no);
			readCookie.setPath("/");
			readCookie.setMaxAge(60 * 60 * 24); // 하루 동안
			response.addCookie(readCookie);
			
			service.upViewCount(board_no); // 조회수 1증가
		}
		
		BoardVO vo = service.viewCampingTipBoard(board_no, board_category);
		model.addAttribute("viewBoard", vo);
		return "cambakMain/board/campingTip/tipBoardView";
	}
	
	@RequestMapping(value="/campingTip/write", method=RequestMethod.GET)
	public String writeBoard() throws Exception {
		// 캠핑팁 새로운 게시글 작성 페이지 출력
		return "cambakMain/board/campingTip/tipBoardWrite";
	}
	
	@RequestMapping(value="/campingTip/write", method=RequestMethod.POST)
	public String writeBoardTip(CamBoardTipWriteDTO dto, RedirectAttributes rttr) throws Exception {
		// 캠핑팁 작성된 게시글 저장
		String result;
		int no = service.writeCampingTipBoard(dto);
		
		if(no != 0) {
			result = "success";
			rttr.addFlashAttribute("tipWrite", result);
		} else {
			result = "fail";
			rttr.addFlashAttribute("tipWrite", result);
		}
		
		return "redirect:view?id=Tip&no=" + no + "&page=1";
	}
	
	@RequestMapping(value = "/campingTip/imgSave", method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> BoardCsFileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/CampingTip");
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = BoardCsFileUpload.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				// -1이 아니라면 이미지 파일
				System.out.println(uploadPath);
				return new ResponseEntity<String>(uploadFile, HttpStatus.OK);
			} else {
				// 이미지 파일 아닌것
				// view에서 modal 띄움
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value="/campingTip/modify", method=RequestMethod.GET)
	public String modifyBoardTip(String no, String id, Model model) throws Exception {
		// 캠핑팁 작성된 게시글 수정 페이지로 이동
		
		BoardVO vo = service.viewCampingTipBoard(Integer.parseInt(no), id);
		model.addAttribute("modiBoard", vo);
		return "cambakMain/board/campingTip/tipBoardModify";
	}
	
	@RequestMapping(value="/campingTip/modify", method=RequestMethod.POST)
	public String modifyBoardTip(CamBoardTipModifyDTO modifyDTO, RedirectAttributes rttr) throws Exception {
		// 캠핑팁 작성된 게시글 수정 후 상세페이지로 이동
		String result;
		
		if(service.modifyCampingTipBoard(modifyDTO)) {
			result = "success";
			rttr.addFlashAttribute("tipModify", result);
		} else {
			result = "fail";
			rttr.addFlashAttribute("tipModify", result);
		}
		return "redirect:view?id=" + modifyDTO.getBoard_category() + "&no=" + modifyDTO.getBoard_no();
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/delete", method=RequestMethod.POST)
	public ResponseEntity<String> deleteBoardTip(@RequestParam("no") int no) {
		// 캠핑팁 작성된 게시글 삭제
		ResponseEntity<String> entity = null;
		
		try {
			// 게시물 삭제 처리
			if(service.deleteCampingTipBoard(no)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 삭제 실패 시 실패 메세지 전달
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/writeReply", method=RequestMethod.POST)
	public ResponseEntity<String> writeBoardReply(CamBoardTipReplyDTO replyDTO) {
		// 캠핑팁 상세글 작성된 댓글 저장
		ResponseEntity<String> entity = null;
		
		try {
			// 댓글 저장 성공 시
			if(service.saveCampingTipReply(replyDTO)) {
				// 최종적으로 저장 성공 시 성공 메세지 전달
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 댓글 저장 실패 시 실패 메세지 전달
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/reply", method=RequestMethod.POST)
	public List<ReplyBoardVO> viewBoardReply(@RequestParam("no") int no) throws Exception {
		// 캠핑팁 상세글 댓글 조회
		
		List<ReplyBoardVO> voReply = service.readReplyCampingTipBoard(no);
		return voReply;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/deleteReply", method=RequestMethod.POST)
	public ResponseEntity<String> deleteBoardReply(@RequestParam("replyBoard_no") int replyBoard_no, @RequestParam("board_no") int board_no) {
		// 캠핑팁 상세글 댓글 삭제
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteCampingTipReply(replyBoard_no, board_no);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/modifyReply", method=RequestMethod.POST)
	public ResponseEntity<String> modifyReplyBoardTip(@RequestParam("replyBoard_no") int replyBoard_no, @RequestParam("replyBoard_content") String replyBoard_content) {
		// 캠핑팁 상세글 댓글 수정
		ResponseEntity<String> entity = null;
		
		try {
			if(service.modifyCampingTipReply(replyBoard_no, replyBoard_content)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 수정 실패 시 실패 메세지 전달
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/reReply", method=RequestMethod.POST)
	public List<ReplyBoardVO> getRereply(@RequestParam("no") int no) throws Exception {
		// 캠핑팁 상세글 대댓글 조회
		
		List<ReplyBoardVO> voRereply = service.readRereplyCampingTipBoard(no);
		return voRereply;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/totalReply", method=RequestMethod.POST)
	public int getReplyCount(@RequestParam("board_no") int board_no) throws Exception {
		// 캠핑팁 상세글 댓글 개수 조회
		return service.checkReplyCount(board_no);
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/writeRereply", method=RequestMethod.POST)
	public ResponseEntity<String> writeRereply(CamBoardTipRereplyDTO dto) {
		// 캠핑팁 상세글 대댓글 작성
		ResponseEntity<String> entity = null;
		
		try {
			if(service.addRereplyCampingTipBoard(dto)) { // 대댓글 insert
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 대댓글 insert 실패 시
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/modifyRereply", method=RequestMethod.POST)
	public ResponseEntity<String> modifyRereplyBoardTip(@RequestParam("replyBoard_no") int replyBoard_no, @RequestParam("replyBoard_content") String replyBoard_content) {
		// 캠핑팁 상세글 대댓글 수정
		ResponseEntity<String> entity = null;
		
		try {
			if(service.modifyRereplyCampingTipBoard(replyBoard_no, replyBoard_content)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}
		} catch (Exception e) {
			// 수정 실패 시 실패 메세지 전달
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/deleteRereply", method=RequestMethod.POST)
	public ResponseEntity<String> deleteBoardRereply(CamBoardTipRereplyDTO dto) {
		// 캠핑팁 상세글 대댓글 삭제
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteCampingTipRereply(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/noRereply", method=RequestMethod.POST)
	public List<ReplyBoardVO> noRereplyAreaBlock(@RequestParam("board_no") int board_no) throws Exception {
		// 캠핑팁 상세글 대댓글이 없는 댓글의 구역 체크를 위한 기능
		List<ReplyBoardVO> vo = service.noRereplyAreaBlock(board_no);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/readLikeInfo", method=RequestMethod.POST)
	public ResponseEntity<String> readLikeInfo(@RequestParam("board_no") int board_no, @RequestParam("loginMember") String member_id) {
		// 로그인한 유저의 상세게시글 추천 여부 확인
		ResponseEntity<String> entity = null;
		
		try {
			if(service.readLikeInfo(board_no, member_id) == 1) {
				entity = new ResponseEntity<String>("like", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("dislike", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/campingTip/boardLikeUpdate", method=RequestMethod.POST)
	public int boardLikeUpdate(CamBoardTipLikeDTO dto) throws Exception {
		// 로그인한 유저가 추천하기, 추천취소 버튼 클릭시 게시글 추천 수 +- 1
		int result = service.boardLikeUpdate(dto);
		return result;
	}
	
}