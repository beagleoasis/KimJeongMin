package com.cambak21.controller.cambakMain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cambak21.domain.FindIdVO;
import com.cambak21.domain.MemberVO;
import com.cambak21.dto.ChangeMemberInfoDTO;
import com.cambak21.dto.LoginDTO;
import com.cambak21.dto.UpdateMemberDTO;
import com.cambak21.service.cambakMain.MemberService;
import com.cambak21.util.KakaoLoginService;

@Controller
@RequestMapping(value="/user")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Inject
   private MemberService service;
   
   @Autowired
   private JavaMailSenderImpl mailSender;
   
   
   @RequestMapping(value="/login", method=RequestMethod.GET)
   private String login() {
      return "/cambakMain/user/login";
   }
   
   @RequestMapping(value="/login/yet", method=RequestMethod.GET)
   private String loginyet(HttpServletRequest request) {
	   
	   String referer = request.getHeader("REFERER");
	   HttpSession ses = request.getSession();
	   
	  if (ses.getAttribute("prevPage") != null) {
		  ses.setAttribute("prevPage", referer);
	  } else {
		  ses.removeAttribute("prevPage");
		  ses.setAttribute("prevPage", referer);
	  }
	   
      return "/cambakMain/user/login";
   }
   
   
   @RequestMapping(value="/login", method=RequestMethod.POST)
   private String login(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
      MemberVO vo = service.login(dto);
      System.out.println(dto.toString());
      System.out.println("유저 컨트롤러 : " );
               if(vo == null) {
                  System.out.println("회원이름 못찾음");
                  return "/cambakMain/user/login";
               } else {
            	  System.out.println("로그인 완료");
               }
               
      session.setAttribute("loginMember", vo);   
      
      if(dto.isMember_cookie()) { // 자동 로그인을 눌렀을 경우
          System.out.println("***** 자동 로그인 체크 ***** ");
          int amount = 60 * 60 * 24 * 7; // 일주일의 milliSecond
          Date sesLimit = new Date(System.currentTimeMillis() + (amount * 1000)); 
          // 로그인 쿠키 값이 유지 되는 시간, sessionID를 로그인한 유저의 정보에 update 
          System.out.println("테스트! " + session.getId());
          service.keepLogin(dto.getMember_id(), session.getId(), sesLimit);
       
       }
               
      model.addAttribute("loginMember", vo);
      System.out.println(vo.toString() + "컨트롤러 단 ");
      String tempPrevUrl = (String)session.getAttribute("prevPage");
      
      tempPrevUrl = tempPrevUrl.substring(7);
      String prevUrl = tempPrevUrl.substring(tempPrevUrl.indexOf("/"));
      System.out.println(prevUrl);
      
      return "redirect:" + prevUrl;
   }
   
   @RequestMapping(value="/loginCheck", method=RequestMethod.POST)
   private ResponseEntity<String> loginCheck(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
	  ResponseEntity<String> entity = null;
      System.out.println("qqqqqqqqqqqqqqq: " + dto.toString());
	  try {
		  
		if (service.loginRequestCheck(dto)) {
			entity = new ResponseEntity<String>("memberCheck", HttpStatus.OK);
		  } else {
			entity = new ResponseEntity<String>("noMember", HttpStatus.OK);
		  }
		
	} catch (Exception e) {
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	  
      return entity;
   }
   
   

   @RequestMapping(value="/logout", method=RequestMethod.GET)
   public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
      MemberVO vo = (MemberVO)session.getAttribute("loginMember");
      System.out.println("로그아웃 하러 왔나");
      if(vo != null) {
         session.removeAttribute("loginMember");
         session.invalidate();
         Cookie loginCook = WebUtils.getCookie(request, "ssid");
      
       if(loginCook != null) {
          loginCook.setPath("/");
          loginCook.setMaxAge(0);
          response.addCookie(loginCook);
          
          service.keepLogin(vo.getMember_id(), session.getId(), new Date());
       }
      
      }
      
      String referer = request.getHeader("REFERER");
	   HttpSession ses = request.getSession();
	   
	  if (ses.getAttribute("prevPage") != null) {
		  ses.setAttribute("prevPage", referer);
	  } else {
		  ses.removeAttribute("prevPage"); 
		  ses.setAttribute("prevPage", referer);
	  }
	   
      return "/cambakMain/user/login";
//         return "redirect:/index/main";
   }
   
   
	
//	김대기 멤버 탈퇴 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String quitMember() {
		
		return "cambakMain/user/resign";
		
	}
	
	@RequestMapping(value = "/resignStep2", method = RequestMethod.POST)
	public String quitMemberStep2() {
		return "cambakMain/user/resignStep2";
	}
	
	@RequestMapping(value = "/resignStep3", method = RequestMethod.POST)
	public ResponseEntity<String>  memberDelCheck(LoginDTO dto, RedirectAttributes rttr) {
		ResponseEntity<String> entity = null;
		
		try {
			if(service.memberDelCheck(dto)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/resignStep4", method = RequestMethod.POST)
	public String quitMemberStep2(LoginDTO dto, RedirectAttributes rttr, HttpSession session) {
		
		 
		System.out.println(dto.toString());
		
			try {
				service.memberDelete(dto);
				session.removeAttribute("loginMember");
		        session.invalidate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "cambakMain/user/resignStep3";
	}
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김대기 멤버 탈퇴
	
//	김도연 아이디/비번 찾기 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@RequestMapping(value="/find_idPwd", method = RequestMethod.GET)
	public String find_idPwd() {
		return "cambakMain/user/findIdnPwd";
	}
	
	@RequestMapping(value="/find_idPwd", method = RequestMethod.POST)
	public ResponseEntity<String> sendMail(@RequestBody FindIdVO fid) throws Exception {
		
		ResponseEntity<String> entity = null;
		String uuid = UUID.randomUUID().toString();
		boolean result = false;
		
		System.out.println(uuid);
		System.out.println(fid.toString());
		
		if(service.checkEmail(fid)) {
			
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws MessagingException {
					String subject = "<Cambak21>에서 보낸 이메일 인증번호 입니다"; // 메일 제목
					String message = "회원님, <br />"; // 메일 본문
					message += "<h2>아이디/비밀번호 찾기를 위한 인증번호입니다.</h2>";
					message += "아래의 인증번호를 확인하여 이메일 주소 인증을 완료해 주세요!<hr />";
					message += "연락처 이메일 : " + fid.getMember_email() + "<br/>";
					message += "인증번호 : " + uuid + "<br /><br />";
					message += "감사합니다!";
					
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("goot6 <goot6610@gmail.com>");
					helper.setTo(fid.getMember_email());
					helper.setSubject(subject);
					helper.setText(message, true);
				}
			};
			
			
			try {
				mailSender.send(preparator);
				entity = new ResponseEntity<String>(uuid, HttpStatus.OK);
			} catch (MailException e) {
				entity = new ResponseEntity<String>("sendFail", HttpStatus.OK);
				e.printStackTrace();
			}
			
			return entity;
		}
		
		return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	
	@RequestMapping(value="/find_id", method = RequestMethod.POST)
	public String find_id(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		List<FindIdVO> findIdLst = service.findId(fId);
		
		System.out.println(findIdLst);
		
		model.addAttribute("findId", findIdLst);
		
		return "cambakMain/user/result_id";
	}
	
	@RequestMapping(value="/find_pwd", method = RequestMethod.POST)
	public String find_pwd(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		FindIdVO fid = service.findPwd(fId);
		model.addAttribute("memberInfo", fid);
		
		return "cambakMain/user/result_pwd";
	}
	
	@RequestMapping(value="/reset_pwd", method = RequestMethod.POST)
	public String reset_pwd(FindIdVO fId, Model model) throws Exception {
		System.out.println(fId.toString());
		
		if(service.updatePwd(fId)) {
			return "redirect:/user/login";
		}
		
		return "error";
	}
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김도연 아이디/비번 찾기 파트
	
//	이영광 회원가입 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	
	
	
	
	
	
	
	
	
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 이영광 회원가입 파트
	
//	김태훈 회원정보 수정 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//	@RequestMapping(value = "/Modify/{memberId}",method=RequestMethod.POST)
//	public String userModify(@PathVariable("memberId") String memberId,Model model) throws Exception{
//		System.out.println("memberId : "+memberId);
//		model.addAttribute("member",service.memberSelect(memberId));
//		System.out.println(service.memberSelect(memberId));
//		return "cambakMain/myPage/userModify";
//	}
//	
//	@RequestMapping(value = "/userDateUpdate",method = RequestMethod.POST)
//	public String userUpdate(UpdateMemberDTO dto)throws Exception {
//		System.out.println("userDateUpdate...POST통신 성공");
//		System.out.println(dto.toString());
//		if(service.memberUpdate(dto)) {
//			System.out.println("수정완료");
//		}else{
//			System.out.println("수정 실패");
//		}
//		
//		return "redirect:/myPage/checkList";		
//	}
//	
		
//	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 김태훈 회원정보 수정 파트

//	서효원 파트 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	   
	   @RequestMapping(value="/pwdCheck", method=RequestMethod.GET)
	   private String userInfoModifyConfirm(Model model) {
	      return "cambakMain/myPage/modifyUserConfirm";
	   }
	   
	   @RequestMapping(value="/checkUser", method=RequestMethod.GET)
	   private ResponseEntity<String> userPwdCheck(@RequestParam("userId") String member_id, @RequestParam("userPwd") String member_password) {
		  ResponseEntity<String> entity = null;
		  
		  try {
			  if (service.modifyCheckUser(member_id, member_password)) entity = new ResponseEntity<String>("userOk", HttpStatus.OK);
			  else entity = new ResponseEntity<String>("userBad", HttpStatus.OK);
		  } catch (Exception e) {
			  entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		  }
	      return entity;
	   }
	   
	   @RequestMapping(value="/modify", method=RequestMethod.POST)
	   private String userInfoModify(Model model) {
	      return "cambakMain/myPage/modify";
	   }
	   
	   @RequestMapping(value="/modifyUserInfo", method=RequestMethod.POST)
	   private String updateMemberInfo(ChangeMemberInfoDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		   
		   MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		   dto.setMember_id(loginMember.getMember_id());
		   if (service.updateMemberInfo(dto)) {
			   session.removeAttribute("loginMember");
			   session.setAttribute("loginMember", service.sesUserInfoChange(loginMember.getMember_id()));
			   rttr.addFlashAttribute("result", "success");
		   } else {
			   rttr.addFlashAttribute("result", "fail");
		   }
		   
		   return "redirect:/user/pwdCheck";
	   }
	
	   @RequestMapping(value="/kakaoInterlock", method=RequestMethod.GET)
	   public String kakaoInterlock(@RequestParam(value = "code", required = false) String code, HttpSession session, RedirectAttributes rttr) throws Exception {
		   String requestUri = "user/kakaoInterlock";
		   String userKakaoId = KakaoLoginService.getUserKakaoID(code, requestUri);
		   Date interlockDate = new Date();
		   
		   MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		   if (service.userKakaoInterlock(interlockDate, userKakaoId, loginMember.getMember_id())) {
			   session.removeAttribute("loginMember");
			   session.setAttribute("loginMember", service.sesUserInfoChange(loginMember.getMember_id()));
			   rttr.addFlashAttribute("kakaoInterlock", "interlockSuccess");
		   } else {
			   rttr.addFlashAttribute("kakaoInterlock", "interlockFail");
		   }
		   
		   return "redirect:/user/pwdCheck";
	   }
	   
	   @RequestMapping(value="/kakaoRelease", method=RequestMethod.GET)
	   public String kakaoRelease(HttpSession session, RedirectAttributes rttr) throws Exception {
		   String tmpDate = "2000-12-31 00:00:00";
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Date defaultDate = format.parse(tmpDate);
		   
		   MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		   if (service.kakaoRelease(loginMember.getMember_id(), defaultDate)) {
			   session.removeAttribute("loginMember");
			   session.setAttribute("loginMember", service.sesUserInfoChange(loginMember.getMember_id()));
			   rttr.addFlashAttribute("kakaoInterlock", "releaseSuccess");
		   } else {
			   rttr.addFlashAttribute("kakaoInterlock", "releaseFail");
		   }
		   
		   return "redirect:/user/pwdCheck";
	   }
	   
	   @RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	   public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, RedirectAttributes rttr) throws Exception {
		   String requestUri = "user/kakaoLogin";
		   String userKakaoId = KakaoLoginService.getUserKakaoID(code, requestUri);
		   
		   MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		   MemberVO vo = service.kakaoLogin(userKakaoId);
		   
		   if (vo != null) {
			   if (loginMember != null) session.removeAttribute("loginMember");
			   session.setAttribute("loginMember", vo);
			   
			   String tempPrevUrl = (String)session.getAttribute("prevPage");
			   tempPrevUrl = tempPrevUrl.substring(7);
			   String prevUrl = tempPrevUrl.substring(tempPrevUrl.indexOf("/"));
			   
			   return "redirect:" + prevUrl;
		   } else {
			   rttr.addFlashAttribute("kakaoLogin", "fail");
			   return "redirect:/user/login/yet";
		   }
		   
	   }
	   
//		<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 서효원 파트
	
	
	
	
}
