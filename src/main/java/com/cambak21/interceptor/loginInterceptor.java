package com.cambak21.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cambak21.domain.MemberVO;

public class loginInterceptor extends HandlerInterceptorAdapter{

   
   private static Logger logger = LoggerFactory.getLogger(loginInterceptor.class);
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession ses = request.getSession();
      logger.info("로그인 하기 전 . . . . . . . . . .");
      
      if(ses.getAttribute("loginMember") != null) {    // 이전 로그인 정보가 세션에 남아 있다면
            ses.removeAttribute("loginMember");   // 로그인 정보 삭제
      }
      
      return true;   // 이후 인터셉터 또는 컨트롤러에게 제어권을 넘김
   }
   
   
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession ses = request.getSession();
         ModelMap modelMap = modelAndView.getModelMap();
         MemberVO vo = (MemberVO) modelMap.get("loginMember");
//         MemberVO vo = (MemberVO)ses.getAttribute("loginMember");
         
         System.out.println("멤퍼븨오 : " + vo);
        
         if(vo != null) {
      
            System.out.println("로그인 유저 : " + vo.toString());         
            // 쿠키 처리
            if(request.getParameter("member_cookie") != null) { // 자동 로그인이 체크 되었을 때
               System.out.println(request.getParameter("member_cookie"));
               logger.info("쿠키 처리 ....");
               
               Cookie loginCook = new Cookie("ssid", ses.getId());  // ssid 라는 이름으로 세션 ID를 남긴다..(실제 아이디나 비밀번호는 안됨!!)
               loginCook.setPath("/");
               loginCook.setMaxAge(60 * 60 * 24 * 7); // 일주일 동안 
               response.addCookie(loginCook);
            }
      
//            String dest = (String)ses.getAttribute("prevPage");
//            response.sendRedirect((dest != null)? dest : "/index/main");
          }
         
   }
   
}