package com.test.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class goList {

	@RequestMapping("/kMap.inc")
	public String gomap() {
		return "kMap";
	}
}
