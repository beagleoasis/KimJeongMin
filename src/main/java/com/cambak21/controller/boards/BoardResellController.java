package com.cambak21.controller.boards;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.dto.ResellBoardUpdateDTO;
import com.cambak21.service.resell.ResellBoardLikeService;
import com.cambak21.service.resell.ResellBoardService;
import com.cambak21.util.FileUploadProdcess;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;
import com.cambak21.util.SearchCriteria;


@Controller
@RequestMapping("/board/resell")
public class BoardResellController {
	@Inject
	private ResellBoardService resellListService;
	
	@Inject
	private ResellBoardLikeService likeService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardResellController.class);

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String BoardResellList(PagingCriteria cri,Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		cri.setPage(1);
		model.addAttribute("board",resellListService.ResellBoardReadAll(cri));
		PagingParam pp = new PagingParam();
		pp.setDisplayPageNum(9);
		pp.setCri(cri);
		
		pp.setTotalCount(resellListService.ResellBoardReadAllCnt()); // 게시물 갯수
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);
		
		return "cambakMain/board/Resell/boardResellList";
	}
	@RequestMapping(value = "/list/{page}",method = RequestMethod.POST)
	public ResponseEntity<List<ResellBoardVO>> BoardResellListPOST(@PathVariable("page")  int page,PagingCriteria cri,Model model) throws Exception {
		System.out.println("boardResellList 테스트");
		System.out.println("page : "+page);
		ResponseEntity<List<ResellBoardVO> > entity = null;
		List<ResellBoardVO> listResell = resellListService.ResellBoardReadAll(cri);
		if(listResell != null) {
			entity = new ResponseEntity<List<ResellBoardVO>>(listResell,HttpStatus.OK);
		}
		
		return entity;
	}
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String boardResellDetail(@RequestParam("no") int no, Model model) throws Exception{
		System.out.println("boardResellDetail 테스트");
		System.out.println("no : "+no);
		resellListService.ResellBoardViewcnt(no);
		System.out.println(resellListService.ResellBoardReadDetail(no));
		model.addAttribute("board",resellListService.ResellBoardReadDetail(no));
		return "cambakMain/board/Resell/boardResellDetail";
	}
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String BoardResellRemove(@RequestParam("no") int no, RedirectAttributes rttr) throws Exception {
		logger.info("no : "+no);
		logger.info("/remove... get호출");
		if(resellListService.ResellBoardDelete(no)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/resell/list";
		
	}
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String BoardResellWrite(Model model) throws Exception {
		logger.info("/write... get호출");
		return "cambakMain/board/Resell/boardResellWrite";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String BoardResellWrite(ResellBoardVO vo,RedirectAttributes rttr) throws Exception {
		logger.info("vo : "+vo);
		logger.info("/write... post호출");
		if(resellListService.ResellBoardInsert(vo)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/resell/list";
		
	}
	@RequestMapping(value="/modi", method=RequestMethod.GET)
	public String BoardResellModi(int no,Model model) throws Exception {
		logger.info("/modi... get호출");
		logger.info("no : "+no);
		model.addAttribute("board",resellListService.ResellBoardReadDetail(no));
		
		return "cambakMain/board/Resell/boardResellModi";
	}
	@RequestMapping(value="/modi", method=RequestMethod.POST)
	public String BoardResellModi(ResellBoardUpdateDTO dto,RedirectAttributes rttr) throws Exception {
		logger.info("/modi... post호출");
		logger.info("dto : "+dto);
		if(resellListService.ResellBoardUpdate(dto)) {
			System.out.println("여기까진 옴");
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/resell/list";
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String seach(SearchCriteria scri, PagingCriteria cri, Model model) throws Exception {
		System.out.println("검색을 시작합니다....");
		System.out.println(scri.toString());
		model.addAttribute("board", resellListService.ResellBoardRead(cri,scri));
		System.out.println(cri.toString());
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setTotalCount(resellListService.ResellBoardReadCnt(scri));
		System.out.println(pp.toString());
		model.addAttribute("pagingParam", pp);  // 페이징 처리를 위한 파라메터 객체
		
		return "cambakMain/board/Resell/boardResellList";
		
	}
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST)
	public ResponseEntity<ArrayList> uploadAjax(MultipartFile[] uploadFile, HttpServletRequest request)  {
		System.out.println("uploadAjax ....POST방식성공");
		ResponseEntity<ArrayList> entity = null;
		ArrayList returnList =  new ArrayList();
		
		
		for (MultipartFile file : uploadFile) {;
			System.out.println("업 로드 파일 이름 : " + file.getOriginalFilename());
			System.out.println("파일 사이즈 : " + file.getSize());
			System.out.println("업로드 파일의 타입 : " + file.getContentType()); // 파일의 MIME type
//			System.out.println("파일 separator : " + file.separator);
			try {
				String path = request.getSession().getServletContext().getRealPath("resources/uploads/Resell");
				System.out.println(path);
				
				String returnFile;
					
					returnFile = FileUploadProdcess.ReselluploadFile(path, file.getOriginalFilename(), file.getBytes());
					returnList.add("/resources/uploads/Resell"+returnFile);
					entity = new ResponseEntity<ArrayList>(returnList,HttpStatus.OK);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					returnList.retainAll(returnList);
					returnList.add(e.getMessage());
					entity = new ResponseEntity<ArrayList>(returnList,HttpStatus.BAD_REQUEST);
					return entity;
				}
				
				
		}
		System.out.println("entity \n =========================================");
		System.out.println(entity);
		return entity;


	}

	
}

