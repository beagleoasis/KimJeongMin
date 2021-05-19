package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.dto.InsertReplyQABoardDTO;
import com.cambak21.dto.UpdateReplyQABoardDTO;
import com.cambak21.service.boardQA.ReplyBoardQAService;

@RestController
@RequestMapping("/board/*")
public class BoardQAReplyController {
	@Inject
	private ReplyBoardQAService service;

	private static Logger log = LoggerFactory.getLogger(BoardQAReplyController.class);

	@RequestMapping("/qa/reply/all/{board_no}")
	public ResponseEntity<List<ReplyBoardVO>> replyList(@PathVariable("board_no") int board_no) {
		log.info("댓글 리스트 get 방식 호출 ajax");

		ResponseEntity<List<ReplyBoardVO>> entity = null;

		try {
			entity = new ResponseEntity<List<ReplyBoardVO>>(service.getReplyListBoardQA(board_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/qa/reply/insert", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody InsertReplyQABoardDTO dto) {
		log.info("댓글 작성 ajax POST 호출");

		ResponseEntity<String> entity = null;

		try {
			service.insertReplyBoardQA(dto);
			entity = new ResponseEntity<String>("writeOk", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/qa/reply/delete/{replyBoard_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("replyBoard_no") int replyBoard_no) {
		log.info("댓글 삭제 ajax DELETE 호출");
		
		ResponseEntity<String> entity = null;
		
		try {
			if(service.deleteReplyBoardQA(replyBoard_no) == 1){
				entity = new ResponseEntity<String>("deleteOk", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/qa/reply/update/{replyBoard_no}", method=RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("replyBoard_no") int replyBoard_no, @RequestBody UpdateReplyQABoardDTO dto) {
		log.info("댓글 수정 PUT 호출");
		
		ResponseEntity<String> entity = null;
		
		try {
			if(service.updateReplyBoardQA(dto) == 1) {
				entity = new ResponseEntity<String>("updateOk", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}