package com.cambak21.controller.cambakMall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.cambak21.domain.ChattingListVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.service.cambakMall.ChattingService;
import com.cambak21.service.cambakMall.ProdListService;
import com.cambak21.util.BoardCsFileUpload;
import com.cambak21.util.ChattingImageUploads;


@Controller
public class ChattingController {
	
	@Inject
	private ChattingService service;
	
	@RequestMapping("/mall/userChatting")
	public String userChatting (@SessionAttribute("loginMember") MemberVO loginMember, Model model) throws Exception {
		
		model.addAttribute("chatting", service.getChatting(loginMember.getMember_id()));
		model.addAttribute("popularList", service.popularProdList()); // 하단에 인스타그램 형식 사진 출력
		model.addAttribute("userImg", loginMember.getMember_img());
		
		return "cambakMall/userChatting";
	}
	
	@RequestMapping("/admin/adminChatting")
	public String adminChatting (@RequestParam("id") String member_id, Model model) throws Exception {
		
		model.addAttribute("chatting", service.getChatting(member_id));
		
		return "admin/adminChatting";
	}
	
	@RequestMapping("/admin/chattingList")
	public String chattingList (Model model) throws Exception {
		
		model.addAttribute("ChattingList", service.chattingList());
		return "admin/chattingList";
	}
	
	/**
	  * @Method Name : fromUser
	  * @작성일 : 2021. 4. 19.
	  * @작성자 : 유저가 채팅 보낼 시 DB Insert작업
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param msg
	  * @return
	  */
	@PostMapping("/fromUser/{msg}")
	public ResponseEntity<String> fromUser (@PathVariable("msg") String msg, @SessionAttribute("loginMember") MemberVO loginMember) {
		ResponseEntity<String> entity = null;
		
		try {
			service.fromUser(loginMember.getMember_id(), msg);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@PostMapping("/fromAdmin/{msg}/{member_id}")
	public ResponseEntity<String> fromUser (@PathVariable("msg") String chatting_content, @PathVariable("member_id") String member_id) {
		ResponseEntity<String> entity = null;
		System.out.println("채팅 컨트롤러단 admin : " + chatting_content);
		try {
			service.fromAdmin(member_id, chatting_content);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@PostMapping("/isRead/{who}/{member_id}")
	public ResponseEntity<String> updateIsRead (@PathVariable("member_id") String member_id, @PathVariable("who") String who) {
		ResponseEntity<String> entity = null;

		try {
			service.updateIsRead(member_id, who);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/chatting/img/{who}/{toUser}") // who : 운영자와 유저 누가 이미지 업로드 하는지 구분하기 위한
	public ResponseEntity<String> uploadImg (@PathVariable("toUser") String member_id, @PathVariable("who") String who, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		
		try {
			// 파일 업로드 될 서버 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploads/chatting");
			
			// 파일 저장하기 위해 메서드 호출 후 경로 반환 받기
			String uploadFile = ChattingImageUploads.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			if (!uploadFile.equals("-1")) {
				// -1이 아니라면 이미지 파일
				entity = new ResponseEntity<String>(uploadFile, HttpStatus.OK);
				
				if(who.equals("admin")) { // 운영자가 이미지 보냄
					service.fromAdmin(member_id, "<img src='../resources/uploads/chatting/"+uploadFile+"' style='max-width:300px'>");
				} else { // 유저가 이미지 보냄
					service.fromUser(member_id, "<img src='../resources/uploads/chatting/"+uploadFile+"' style='max-width:300px'>");
				}
			} else {
				// 이미지 파일 아닌것
				// view에서 modal 띄움
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}