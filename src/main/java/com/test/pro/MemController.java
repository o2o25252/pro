package com.test.pro;

import org.springframework.web.bind.annotation.RequestMapping;

public class MemController {

	@RequestMapping("/mem.inc")
	private String gothe() {
		return "Mem";
	}
	
}
