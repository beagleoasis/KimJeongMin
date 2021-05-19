package com.cambak21.controller.boards;

import java.io.IOException;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.dto.InsertCSBoardDTO;
import com.cambak21.dto.InsertLikeBoard;
import com.cambak21.dto.UpdateCSBoardDTO;
import com.cambak21.service.boardCS.BoardCsService;
import com.cambak21.util.BoardCsFileUpload;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;

@Controller
@RequestMapping("/board")
public class BoardCsController {

	@Inject
	private BoardCsService service;

	private static Logger logger = LoggerFactory.getLogger(BoardCsController.class);

	@RequestMapping("/cs/list")
	public String BoardCsList(Model model, PagingCriteria cri) throws Exception {
		logger.info("  / 게시글 리스트 get방식 호출");

		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(service.boardCStotalCnt());

		// 게시물 데이터
		model.addAttribute("boardList", service.listBoardCS(cri));
		model.addAttribute("pp", pp);

		return "cambakMain/board/cs/boardCsList";
	}

	@RequestMapping("/cs/write")
	public String BoardCsWrite() {
		logger.info("  / 글 쓰기 폼 get 방식 호출");

		return "cambakMain/board/cs/boardCsWrite";
	}

	@RequestMapping(value = "/cs/write", method = RequestMethod.POST)
	public String BoardCsWrite(InsertCSBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("  / 글 작성 POST 방식 호출");

		ra.addFlashAttribute("status", "writeOk");

		return "redirect:/board/cs/detail?no=" + service.writeBoardCS(dto); // 해당 메서드 실행하면 max(board_no)값 반환해줌
	}

	@RequestMapping(value = "/cs/detail", method = RequestMethod.GET)
	public String BoardCsDetail(@RequestParam("no") int no, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("  / 게시글 detail GET 호출");

		// 클라이언트에 등록된 쿠키 정보들
		Cookie[] cookies = request.getCookies();
		// 쿠키 존재여부를 담을 변수 생성
		String status = "noExist";
		// 조회수 쿠키를 담을 그릇
		Cookie userCookie = null;

		// 클라이언트가 가지고 있는 쿠키중에 글번호 쿠키가 존재하는지 파악
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("boardCs")) {
				userCookie = cookies[i];
			}
		}

		// 유저가 조회수 쿠키를 가지고 있다면 ...
		if (userCookie != null) {
			// 쿠키안에 들어있는 글 번호를 가져오기
			String[] cValues = userCookie.getValue().split("-");

			for (int i = 0; i < cValues.length; i++) {
				// 쿠키에 현재 조회하는 글번호가 있다면 ...
				if (Integer.parseInt(cValues[i]) == no) {
					status = "exist";
					break;
				}
			}
			// 쿠키에 조회하는 글 번호가 없다면 ..
			if (status.equals("noExist")) {
				Cookie newCookie = new Cookie("boardCs", userCookie.getValue() + "-" + no);
				newCookie.setMaxAge(60*60*24);
				newCookie.setPath("/");
				response.addCookie(newCookie);
			}
		} else {
			// 조회수 쿠키가 없다면...
			Cookie cookie = new Cookie("boardCs", Integer.toString(no));
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");

			response.addCookie(cookie);
		}

		model.addAttribute("board", service.readBoardCS(no, status));
		model.addAttribute("prev", service.prevNo(no));
		model.addAttribute("next", service.nextNo(no));

		return "cambakMain/board/cs/boardCsDetail";
	}

	@RequestMapping(value = "/cs/delete", method = RequestMethod.GET)
	public String BoardCsDelete(@RequestParam("no") int board_no, RedirectAttributes ra) throws Exception {
		logger.info("  / 글 삭제 get방식 호출");

		service.deleteBoardCS(board_no);

		ra.addFlashAttribute("status", "deleteOk");

		return "redirect:/board/cs/list?page=1";
	}

	@RequestMapping("/cs/modi")
	public String BoardModi(@RequestParam("no") int no, Model model) throws Exception {
		logger.info("  / 글 수정 get 방식 호출");

		model.addAttribute("board", service.readBoardCS(no, ""));

		return "cambakMain/board/cs/boardCsModi";
	}

	@RequestMapping(value = "/cs/modi", method = RequestMethod.POST)
	public String BoardModi(UpdateCSBoardDTO dto, RedirectAttributes ra) throws Exception {
		logger.info("  / 글 수정 post 방식 호출");

		service.modiBoardCS(dto);

		ra.addFlashAttribute("status", "modiOk");

		return "redirect:/board/cs/detail?no=" + dto.getBoard_no();
	}

	@RequestMapping("/cs/search")
	public String BoardSearch(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
		logger.info("  / 검색 결과 페이지 호출");

		PagingParam searchPP = new PagingParam();
		searchPP.setCri(cri);
		searchPP.setTotalCount(service.searchBoardCStotalCnt(scri));

		model.addAttribute("boardList", service.searchListBoardCS(scri, cri));
		model.addAttribute("searchPP", searchPP);

		return "cambakMain/board/cs/boardCsList";
	}

	/**
	 * @Method Name : handleFileUpload
	 * @작성일 : 2021. 3. 25.
	 * @작성자 :  
	 * @변경이력 :
	 * @Method 설명 : 서버에 이미지 업로드
	 * @param file    : view단에서 ajax로 넘어온 파일
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/cs/image", method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> BoardCsFileUpload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		logger.info("  / 게시글 이미지 업로드 호출");
		try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/boardCs");
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = BoardCsFileUpload.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				// -1이 아니라면 이미지 파일
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

	/**
	 * @Method Name : BoardCsLike
	 * @작성일 : 2021. 4. 2.
	 * @작성자 :  
	 * @변경이력 :
	 * @Method 설명 : 추천하기 버튼 클릭시 on-off 기능을 위한 ...
	 * @param dto : 테이블에 좋아요 기록 insert
	 * @return
	 */
	@RequestMapping(value = "/cs/like", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> BoardCsLike(@RequestBody InsertLikeBoard dto) {
		logger.info("  / 게시글 좋아요 누르기 호출");
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

	/**
	 * @Method Name : LikeCheck
	 * @작성일 : 2021. 4. 2.
	 * @작성자 :  
	 * @변경이력 :
	 * @Method 설명 : 게시글 상세페이지 들어갈 시 유저가 좋아요를 눌렀나 안눌렀나 표시하기 위한 ...
	 * @param member_id : 유저
	 * @param board_no  : 게시글 번호
	 * @return
	 */
	@RequestMapping(value = "/cs/like/check", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> LikeCheck(@RequestParam("member_id") String member_id,
			@RequestParam("board_no") int board_no) {
		logger.info("  / 게시글 좋아요 누르기 호출");
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
