package com.test.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class goList {

	@Autowired
    private kakaoAPI kakao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	
	public String home(Locale locale, Model model) {
		
		return "home";
	}

	// 지도 화면 전환하기
	@RequestMapping("/kMap.inc")
	public String gomap() {
		return "kMap";
	}
	
	// 홈 메인 화면 전환
	@RequestMapping("/main.inc")
	public String Gomain() {
	
		return	"main";
	}
	
	// 차트 화면 전환
	@RequestMapping("/chart.inc")
	public String Gochart() {
		
		return	"chart";
	}
	
	// 카카오 로그인
	@RequestMapping(value="/kakaologin.inc")
    public String login(@RequestParam("code") String code) {
	 String access_Token = kakao.getAccessToken(code);
	    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	        
	    }
	    return "redirect:/main.inc";
    }
	
	// 카카오 로그아웃
	@RequestMapping(value="/logout.inc")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    //session.removeAttribute("refresh_token");
	    session.removeAttribute("userId");
	    //request.removeAttribute("code");
		//session.removeAttribute("userId");
		//session.removeAttribute("nickname");
	    session.invalidate();
	    
	    
	    return "redirect:/main.inc";
	}

	
}
