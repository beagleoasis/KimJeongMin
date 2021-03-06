package com.cambak21.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cambak21.domain.MemberVO;
import com.cambak21.service.cambakMain.MemberService;
import com.cambak21.util.FileUploadProdcess;
import com.cambak21.util.GoogleCapcha;
import com.cambak21.util.MediaConfirm;

@Controller
@RequestMapping(value="/user/*")
public class Register {
   
   @Inject
   private MemberService service;
   private static final Logger logger = LoggerFactory.getLogger(Register.class);
   
   @Autowired
   private JavaMailSenderImpl mailSender;
      
   @RequestMapping(value="register", method = RequestMethod.GET)
   public String register() {
      return "cambakMain/user/registetConfirmation";
   }
   
   @RequestMapping(value="joinAgreement", method = RequestMethod.GET)
   public String joinAgreement() {
      return "cambakMain/user/joinAgreement";
   }
   
   @RequestMapping(value="join", method = RequestMethod.POST)
   public String join() {
      return "cambakMain/user/join";
   }
   
   @RequestMapping(value="addrSearch", method = RequestMethod.GET)
   public String addrSearch() {
      return "cambakMain/user/addrSearch";
   }
   
   @RequestMapping(value="joinComplete", method = RequestMethod.POST)
   public String joinMember(MemberVO vo, Model model, HttpServletRequest request) throws Exception {
	   String result;
	   
	   HttpSession ses = request.getSession();
	   ses.removeAttribute("registerUUID");
	   ses.removeAttribute("registerEmail");
	   
	   if (service.memberInsert(vo)) {
		   model.addAttribute("joinMember", vo);
		   result = "success";
		   model.addAttribute("result", result);
	   } else {
		   result = "fail";
		   model.addAttribute("result", result);
	   }
	   	   
	   return "cambakMain/user/joinComplete";
   }
   
   @RequestMapping(value="register/checkId", method = RequestMethod.POST)
   public ResponseEntity<String> checkId(@RequestParam("member_id") String member_id) {
	   // ????????? ????????? ID ?????? ??????
	   ResponseEntity<String> entity = null;
	   try {
			if (service.checkUserId(member_id)) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("fail", HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
       return entity;
   }

   @RequestMapping(value="register/checkRecaptcha", method = RequestMethod.POST)
   public ResponseEntity<String> checkRecaptcha(@RequestParam("recaptcha") String recaptcha, HttpServletRequest request) {
	   // ?????? recapcha ????????????
	   ResponseEntity<String> entity = null;
	   
	   GoogleCapcha.setSecretKey("6LcPSqIaAAAAAJL1k-pAZ1KuLXHzGCDG_aB80L8s");
        
        try {
            if(GoogleCapcha.verify(recaptcha)) {
            	entity = new ResponseEntity<String>("success", HttpStatus.OK);
            } else {
            	entity = new ResponseEntity<String>("fail", HttpStatus.OK);
            }
        } catch (IOException e) {
        	e.printStackTrace();
			entity = new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);
        }

        return entity;
   }
   
   @RequestMapping(value="register/checkOverlapEmail", method = RequestMethod.POST)
   public ResponseEntity<String> checkOverlapEmail(@RequestParam("userEmail") String userEmail) throws Exception {
	   // ????????? ????????? ???????????? ???????????? ??????????????? ??????
	   ResponseEntity<String> entity = null;
	   
	   if (service.checkRegisterEmail(userEmail)) {
		   entity = new ResponseEntity<String>("possibility", HttpStatus.OK);
	   } else {
		   entity = new ResponseEntity<String>("impossibility", HttpStatus.OK);
	   }
	   
	   return entity;
   }
   
   @RequestMapping(value="register/sendRegisterEmail", method = RequestMethod.POST)
   public ResponseEntity<String> sendRegisterEmail(@RequestParam("userEmail") String userEmail, HttpServletRequest request) throws Exception {
	   // ????????? ????????? ????????? ????????? ?????? ??????
	   ResponseEntity<String> entity = null;
	   
	   String uuid = UUID.randomUUID().toString();
	   System.out.println(uuid);
	   
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				String subject = "Cambak's ??????????????? ???????????????"; // ?????? ??????
				String message = "<p>??????????????? ?????????! ???????????? ?????????.</p>"; // ?????? ??????
				message += "<p><a href='http://goot6.cafe24.com/user/joinAgreement?user=" + uuid + "&email=" + userEmail + "'>" + "<strong>???????????? ??????</strong>" + "</a>"
				+ " ?????? ????????? ???????????? ??????????????? ??????????????????."
				+ "</p><p>???????????????:)</p>";
				
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("goot6 <goot6610@gmail.com>");
				helper.setTo(userEmail);
				helper.setSubject(subject);
				helper.setText(message, true);
			}
		};
		
		try {
			mailSender.send(preparator); // ?????? ??????
			HttpSession ses = request.getSession();
			ses.setAttribute("registerUUID", uuid);
			ses.setAttribute("registerEmail", userEmail);
			ses.setMaxInactiveInterval(60 * 5); // ???????????? ?????? ?????? 5??? ??????
			entity = new ResponseEntity<String>("sendOK", HttpStatus.OK);
		} catch (MailException e) {
			entity = new ResponseEntity<String>("sendFAIL", HttpStatus.OK);
		}
		return entity;
   }
   
   @RequestMapping(value="/deleteProfile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteProfile(HttpServletRequest request, @RequestParam("tmpProfile") String tmpProfile) {
	   String path = request.getSession().getServletContext().getRealPath("resources/uploads/memberProfile");
	   String thumbFile = path + File.separator + tmpProfile;
	   System.out.println(thumbFile);
	   new File(thumbFile).delete();
	   
	   return new ResponseEntity<String>("tmpDelete", HttpStatus.OK);
   }
   
	@RequestMapping(value="/userProfileImgMake", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> userProfileImgMake(HttpServletRequest request, MultipartFile file) {

		ResponseEntity<String> entity = null;
		
		System.out.println("????????? ?????? ?????? : " + file.getOriginalFilename());
		System.out.println("?????? ????????? : " + file.getSize());
		System.out.println("????????? ????????? ?????? : " + file.getContentType());
		System.out.println("?????? separator : " + File.separator);
		
		String path = request.getSession().getServletContext().getRealPath("resources/uploads/memberProfile");
		System.out.println(path);
		
		String name = file.getOriginalFilename();
		
		System.out.println(name.substring(name.lastIndexOf(".") + 1));
		
		try {
			String saveFileName = uploadFile(path, file.getOriginalFilename(), file.getBytes());
			
			if (saveFileName == "noImg") {
				entity = new ResponseEntity<String>("noImg", HttpStatus.OK);
			} else {
				String sendFileName = saveFileName.substring(saveFileName.lastIndexOf(File.separator) + 1);
				entity = new ResponseEntity<String>(sendFileName, HttpStatus.OK);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
   
	public String uploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException {
		UUID uuid = UUID.randomUUID();
		String ext = originalName.substring(originalName.lastIndexOf(".") + 1); // ?????????
		
		String savedName = uuid.toString() + "." + ext;
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target); // ?????? ??????
		makeProfileImg(uploadPath, savedName); // ????????? ?????? ???????????? ??????
		
		String uploadFileName = null;
		if(MediaConfirm.getMediaType(ext) != null) {
			uploadFileName = uploadPath + File.separator + savedName;
		} else {
			uploadFileName = "noImg";
		}
		
		System.out.println("uploadFileName : " + uploadFileName);
		
		return uploadFileName;
	}
	
	private static void makeProfileImg(String uploadPath, String savedName) throws IOException {
		
		BufferedImage sourceImg =  ImageIO.read(new File(uploadPath, savedName));
		BufferedImage destImg = Scalr.resize(sourceImg, Method.QUALITY, Mode.FIT_EXACT, 70); // ?????? 70px ????????????
		
		String profileImgName = uploadPath + File.separator + savedName; // ????????? ???????????? ????????? ??????
		File newThumbFile = new File(profileImgName);
		
		String ext = savedName.substring(savedName.lastIndexOf(".") + 1);
		System.out.println(ext);
		
		ImageIO.write(destImg, ext.toLowerCase(), newThumbFile);
	}
	
}

