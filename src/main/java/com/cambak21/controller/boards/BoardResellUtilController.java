package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cambak21.domain.ReplyResellVO;
import com.cambak21.domain.ResellBoardVO;
import com.cambak21.domain.ResellLikeBoardVO;
import com.cambak21.service.resell.ResellBoardLikeService;
import com.cambak21.service.resell.ResellBoardReplyService;
import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

import jdk.internal.org.jline.utils.Log;

@Controller 
@RequestMapping("/utile")
public class BoardResellUtilController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardResellUtilController.class);
	@Inject
	private ResellBoardReplyService ReplyService;
	
	@Inject
	private ResellBoardLikeService LikeService;
	
	@RequestMapping(value = "/reply/all/{bno}",method = RequestMethod.GET)
	public ResponseEntity<List<ReplyResellVO>> list(@PathVariable("bno") int bno) throws Exception{
		System.out.println("ReplyResellVO....연결완료");
		System.out.println("bno : "+bno);
		 ResponseEntity<List<ReplyResellVO>> entity = null;
		System.out.println(ReplyService.ResellBoardReplyRead(bno));
		 try{
			 entity = new ResponseEntity<List<ReplyResellVO>>(ReplyService.ResellBoardReplyRead(bno),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); //예외가 발생하면 list<RdplyVO)는 null이므로 ..>> ResoinseEntity<>
		}
		 return entity;
		
	}
	@RequestMapping(value = "",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyResellVO vo) {
		System.out.println("Rplies.........POST방식 연결");
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		try {
			ReplyService.ResellBoardReplyInsert(vo);
			entity = new ResponseEntity<String>("Success",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/openLike",method=RequestMethod.POST)
	public ResponseEntity<String> openLike(@RequestBody ResellLikeBoardVO vo) throws Exception {
		System.out.println("openLike.........POST방식 연결");
		String Like = "";
		System.out.println("openVo : " + vo);
		ResellLikeBoardVO likeVo = LikeService.ResellBoardlikeRead(vo);
		ResponseEntity<String> entity = null;
		System.out.println(likeVo);
		if(likeVo != null) {
			Like="/resources/img/heart.png";
			
		}else {
			Like="/resources/img/emptyHeart.png";
		}
		try {
			System.out.println("openLike : "+Like);
			entity = new ResponseEntity<String>(Like,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/like",method=RequestMethod.POST)
	public ResponseEntity<String> like(@RequestBody ResellLikeBoardVO vo) throws Exception {
		System.out.println("like.........POST방식 연결");
		String Like = "";
		ResponseEntity<String> entity = null;
		ResellLikeBoardVO readVo = LikeService.ResellBoardlikeRead(vo);
		System.out.println("readVo : "+readVo);
		if (readVo != null) {
			LikeService.ResellBoardLikeDelete(vo);
			Like="/resources/img/emptyHeart.png";
		}else if(readVo == null) {
			System.out.println(LikeService.ResellBoardLikeInsert(vo));
			Like="/resources/img/heart.png";
		}
		try {
			System.out.println("Like : "+Like);
			entity = new ResponseEntity<String>(Like,HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/replies/{no}",method=RequestMethod.POST)
	public void like(@PathVariable("no")  int no) throws Exception {
		System.out.println("no : "+no);
		ReplyService.ResellBoardReplyDelete(no);
	}
}
