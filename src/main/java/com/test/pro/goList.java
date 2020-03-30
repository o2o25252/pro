package com.test.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class goList {

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
	
}
