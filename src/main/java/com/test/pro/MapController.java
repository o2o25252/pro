package com.test.pro;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {

	@RequestMapping("/kmap2.inc")
	public ModelAndView map2(String name) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("kAddr", name);
		mv.setViewName("kMap");
		return mv;
	}
	
	@RequestMapping(value = "/kaj.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> gogo(String dt){
		Map<String, String> map = new HashMap<String, String>();
		map.put("addr", dt);
		
		return map;
	}
	
}
