package com.cambak21.controller.cambakMain;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.cambak21.domain.BoardVO;
import com.cambak21.domain.CheckListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.domain.MyLikeBoardListVO;
import com.cambak21.domain.MyPageAllCountVO;
import com.cambak21.domain.MyPageReplyVO;
import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardCntVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.service.cambakMain.CheckListService;
import com.cambak21.service.cambakMain.MyPostingService;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/myPage/*")
public class MyPostController {

	// 서비스 주입
	@Inject
	private MyPostingService service;
	
	@Inject
	private CheckListService ckservice;

	// 디버깅용 Logger
	private static final Logger logger = LoggerFactory.getLogger(MyPostController.class);



	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 박종진
	 * @변경이력 :
	 * @Method 설명 :
	 * @throws Exception
	 */
	@RequestMapping(value = "checkList.mp", method = RequestMethod.GET)
	public void callCheckList() throws Exception {

	}

	//--------------------------------------------------------------- 김정민 controller ---------------------------------------------------------------

	@RequestMapping(value = "myPost", method = RequestMethod.GET)
	public String showMain() throws Exception {
		
		return "cambakMain/myPage/myWriting";
	}

	//--------------------------------------------------------------- 김정민 내가 작성한 글controller ---------------------------------------------------------------
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 김정민
	 * @변경이력 :
	 * @Method 설명 :
	 * @throws Exception
	 */
	
	
	   @RequestMapping(value="myPost.mp", method=RequestMethod.GET)
	   public @ResponseBody Map<String, Object> myPostList(@RequestParam("member_id") String member_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam("board_category")String board_category){
	      //System.out.println(member_id);
	      //System.out.println(page);
	      //System.out.println(board_category);
	       logger.info("/myPost의 ajax-GET방식 호출");
	       Map<String, Object> result = new HashMap<String, Object>();
	       
	       List<BoardVO> boardList = null;
	    
	       PagingCriteria cri = new PagingCriteria();
	       PagingParam pp = new PagingParam();
	       pp.setCri(cri);
	       cri.setPage(page);
	       System.out.println("pp1 : " + pp);
	       //System.out.println("cri : " + cri);
	       
	       try {
	         boardList = service.getMyPosting(member_id, cri, board_category);
	         System.out.println(boardList.toString());
	          pp.setTotalCount(service.getMyPostingCnt(member_id, board_category));
	          System.out.println("pp2 : " + pp);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	       result.put("boardList", boardList);
	       result.put("pagingParam", pp);
	       
	      return result;
	   }
	//--------------------------------------------------------------- 김정민 나의 캠박장터 controller ---------------------------------------------------------------
	//기본 페이지 호출
	@RequestMapping(value="myPageResell", method=RequestMethod.GET)
	public String myPageResell() throws Exception {
		System.out.println("myPageResell");
		
		return "cambakMain/myPage/myPageResell";
	} 
	
	//ajax로 게시글 리스트 출력
	@RequestMapping(value="myPageResellList", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> myPageResellList(@RequestParam("member_id") String member_id, @RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam("category")String category){

	    logger.info("/myPageResell의 ajax-GET방식 호출");
		System.out.println(member_id);
		System.out.println(page);
		System.out.println(category);

	    Map<String, Object> result = new HashMap<String, Object>();
		
	    List<ResellBoardVO> boardList = null;
	    List<ReplyResellVO> replyList = null;
	    
	    PagingCriteria cri = new PagingCriteria();
	    PagingParam pp = new PagingParam();
	    pp.setCri(cri);
	    cri.setPage(page);
	    if(category.equals("myReply")) {
	    	System.out.println("myReply가 적용됨");
	    	try {
	    		replyList = service.getMyResellReply(member_id, cri, category);
				pp.setTotalCount(service.getMyPageResellList(member_id, category));
				result.put("boardList", replyList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    } else {
	    	try {
				boardList = service.getMyResellPosting(member_id, cri, category);
				pp.setTotalCount(service.getMyPageResellList(member_id, category));
				result.put("boardList", boardList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    
	    
	    result.put("pagingParam", pp);
	    
		return result;
	}
	
	// 내가 작성한 중고장터 게시글, 좋아요, 댓글 카운트 가져오기
	@RequestMapping(value="myPageResellCnt", method=RequestMethod.GET)
	public @ResponseBody ResellBoardCntVO myPageResellCnt(@RequestParam("member_id") String member_id) throws Exception {
		
		logger.info("/myPost의 myPageResellCnt-GET방식 호출");
		System.out.println(member_id);
	    // 내가 작성한 총 게시글
	    ResellBoardCntVO myResellCnt = service.getMyResellCnt(member_id);
	    System.out.println(myResellCnt.toString());
	    
	    return myResellCnt;
		
	} 
	
	//--------------------------------------------------------------- 김정민 좋아요, 작성글, 댓글 count ---------------------------------------------------------------
	@RequestMapping(value="myPageCnt", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> myPageCnt(@RequestParam("member_id") String member_id) throws Exception {
		System.out.println(member_id);
		logger.info("/myPost의 myPageCnt-GET방식 호출");
	    Map<String, Object> result = new HashMap<String, Object>();
	    
	    // 내가 작성한 총 게시글
	    result.put("myPostingCnt", service.getMyPostingCnt(member_id, "all"));
	    result.put("myLikeCnt", service.getMyLikePostngCnt(member_id, "all"));
	    result.put("myReplyCnt", service.myReplyTotal(member_id, "total"));
	    
	    return result;
		
	} 
	
	//--------------------------------------------------------------- 김정민 controller ---------------------------------------------------------------

	//--------------------------------------------------------------- 서효원 controller ---------------------------------------------------------------
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@RequestMapping(value="myReply", method=RequestMethod.GET)
	public String myPageReplyInfo() throws Exception {
		// 마이페이지 내 댓글 페이지로 이동
		return "cambakMain/myPage/myPageReply";
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="myReplyList", method=RequestMethod.POST)
	public Map<String, Object> myPageReplyList(@RequestParam("member_id") String member_id, @RequestParam("board_category")  String board_category, PagingCriteria cri)
			throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 내용 가져오기
		Map<String, Object> param = new HashMap<String, Object>();
		
		cri.setPerPageNum(6); // 5개 씩 게시글, 댓글 가져오기
		List<MyPageReplyVO> lst = service.myWriteReply(member_id, board_category, cri);
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		pp.setDisplayPageNum(5);
		pp.setTotalCount(service.myReplyTotal(member_id, board_category));
		
		param.put("myReplyList", lst);
		param.put("paging", pp);
		return param;
	}
	
	/**
	 * @Method Name : myPageReplyInfo
	 * @작성일 : 2021. 3. 29.
	 * @작성자 : 서효원
	 * @변경이력 : 
	 * @Method 설명 : 
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="getMyCount", method=RequestMethod.POST)
	public MyPageAllCountVO myPageAllCount(@RequestParam("member_id") String member_id) throws Exception {
		// 마이페이지 내 댓글 페이지 로딩 시 전체 게시글, 댓글, 좋아요, 문의 개수 가져오기
		return service.myPageAllCount(member_id);
	}

	//--------------------------------------------------------------- 서효원 controller ---------------------------------------------------------------
	
	/**
	  * @Method Name : myPageLikeBoards
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 카테고리에서 클릭해서 들어갔을 시....
	  * @return
	  * @throws Exception
	  */
	@RequestMapping("myLike")
	public String myPageLikeBoards(Model model, @SessionAttribute("loginMember") MemberVO loginMember) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// 사이드 템플릿에서 세션값 쓸껄 map에 넣어줌
//		map.put("member_id", loginMember.getMember_id());
//		map.put("member_email", loginMember.getMember_email());
		
		// 각 갯수 들을 담아줌
		map.put("allCnt", service.myPageAllCount(loginMember.getMember_id()));
		
		model.addAttribute("cnt", map);
		
		return "cambakMain/myPage/myLikeBoard";
	}

	/**
	  * @Method Name : getList
	  * @작성일 : 2021. 3. 31.
	  * @작성자 : 승권
	  * @변경이력 : 
	  * @Method 설명 : 페이징처리와 게시글 출력 함께
	  * @param category : view단에서 넘어온 카테고리... 해당 카테고리 글만 보여주기 위함
	  * @param page : 페이징에 필요한 변수
	  * @param cri
	  * @param request : 세션 얻어오기 위함
	  * @return
	  */
	@RequestMapping(value = "myLike/{category}/{page}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("category") String category,
			@PathVariable("page") int page, PagingCriteria cri, @SessionAttribute("loginMember") MemberVO vo) {
		logger.info("승권 / 마이페이지 내가 좋아요 누른글 카테고리 호출");

		// json 담을 객체
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			// 페이징, 리스트 map에 담기 위한 객체 생성
			Map<String, Object> map = new HashMap<String, Object>();

			// 리스트 가져오기
			List<MyLikeBoardListVO> lst = service.getMyLikePostng(vo.getMember_id(), cri, category);

			// 페이징
			PagingParam pp = new PagingParam();
			pp.setCri(cri);
			pp.setTotalCount(service.getMyLikePostngCnt(vo.getMember_id(), category));

			// lst는 map에 넣기
			for (int i = 0; i < lst.size(); i++) {
				map.put(i + "", lst.get(i));
			}
			// pp map에 넣기
			map.put("pp", pp);

			// 해당 카테고리 좋아요 한 이력이 없다면 ...
			if (lst.size() != 0) {
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// *****************************  종진 체크리스트 컨트롤러  **********************************//
	
	@RequestMapping(value="/checkList", method = RequestMethod.GET)
	   public String checkList() {
	      logger.info("JJONG ckeckList2 작업중 . . . . .");
	   
	      
	      return "cambakMain/myPage/testCheckList";
	   }
		   
		   
		@RequestMapping(value = "/checkList/ajax/{member_id}", method = RequestMethod.GET)
		public  ResponseEntity<List<CheckListVO>> ajaxcheckList(Model model, @PathVariable("member_id") String member_id) throws Exception{
			logger.info("종진 / ajax/checkList 전체 목록 ckeckList로 전달, 멤버아디는 :" + member_id);
		
			ResponseEntity<List<CheckListVO>> entity = null;
			entity = new ResponseEntity<List<CheckListVO>>(ckservice.getCheckListAll(member_id), HttpStatus.OK);
		
			return entity;
		}

		@RequestMapping(value = "/checkList/ajax/change/{checkList_checked}/{checkList_no}", method = RequestMethod.GET)
		public ResponseEntity<String> changeCheckList(@PathVariable("checkList_checked") String checkList_checked, @PathVariable("checkList_no") int checkList_no) throws Exception{
			logger.info("종진 / 체크리스트 체크 상태 수정하기");
			ResponseEntity<String> entity = null;
			
			if(ckservice.changeCheckList(checkList_checked, checkList_no)) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
			}else {

				entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@RequestMapping(value = "/checkList/ajax/deleteThis/{checkList_no}", method = RequestMethod.GET)
		public ResponseEntity<String> deleteCheckList(@PathVariable("checkList_no") int checkList_no) throws Exception{
			logger.info("종진 / 체크리스트 체크 항목 삭제하기");
			ResponseEntity<String> entity = null;
			
			if(ckservice.deleteThis(checkList_no)) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
			}else {

				entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		@RequestMapping(value = "/checkList/ajax/deleteAll/{member_id}", method = RequestMethod.POST)
		public ResponseEntity<String> deleteCheckListAll(@PathVariable("member_id") String member_id) throws Exception{
			logger.info("종진 / 체크리스트 체크된거 모두 삭제하기");
			ResponseEntity<String> entity = null;
			
			if(ckservice.deleteThisAll(member_id)) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
			}else {

				entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		
		@RequestMapping(value = "/checkList/ajax/saveList", method = RequestMethod.POST)
		public ResponseEntity<String> saveList(@RequestBody CheckListVO vo) throws Exception{
			logger.info("종진 / 체크리스트 체크여부 수정하기");
			ResponseEntity<String> entity = null;
			
			if(ckservice.saveList(vo)) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);	
			}else {

				entity = new ResponseEntity<String>("Fail", HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
