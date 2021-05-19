package com.cambak21.controller.boards;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cambak21.domain.ReplyBoardVO;
import com.cambak21.service.BoardHumor.BoardHumorReplyService;
import com.cambak21.service.BoardHumor.BoardHumorService;

@RestController
@RequestMapping("/cambakMain/board/humor/replies")
public class BoardHumorReply {
	
	@Inject
	private BoardHumorReplyService service;
	
	@Inject
	private BoardHumorService hservice;
	
	
	
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyBoardVO>> list(@PathVariable("bno") int board_no){
		
		ResponseEntity<List<ReplyBoardVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<ReplyBoardVO>>(service.listReply(board_no), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	
	@RequestMapping(value = "", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyBoardVO vo){
		System.out.println(vo.getBoard_no());
		
		
		ResponseEntity<String> entity = null;
		
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{reply_no}/{board_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_no") int reply_no, @PathVariable("board_no") int board_no){
		
		ResponseEntity<String> entity = null;
		
		try {
			System.out.println(board_no);
			service.delete(reply_no, board_no);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	
	@RequestMapping(value = "/{no}", method=RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("no") int no, @RequestBody ReplyBoardVO vo){
		System.out.println(no);
		ResponseEntity<String> entity = null;
		vo.setBoard_no(no);
		try {
			service.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
