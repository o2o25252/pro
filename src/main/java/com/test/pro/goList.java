package com.test.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class goList {

	// 지도 화면 전환하기
	@RequestMapping("/kMap.inc")
	public String gomap() {
		return "kMap";
	}
	
	// 홈 메인 화면 전환
	@RequestMapping("realmain.inc")
	public String Gorealmain() {
	
	
		return	"realMain";
	}
	
	// 차트 화면 전환
	@RequestMapping("main.inc")
	public String Gomain() {
		
	
		return	"Main";
	}
	
}
