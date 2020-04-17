package com.test.pro;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.UserVO;

import mybatis.dao.UserDAO;



@Controller
public class LoginUtillController {
	
	@Autowired
	private UserDAO u_dao;
	
	//ID,PW 를 찾는 jsp 로 가는 컨트롤러 
	@RequestMapping(value = "/user_info.inc", method = RequestMethod.GET)
	public ModelAndView user_info() {
		
		UserVO uvo = new UserVO();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("uvo", uvo);
		mv.setViewName("userInfo");
		
		return mv;
	}
	
	//ID 이름을 찾기 
	@RequestMapping(value = "/idsearch.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> id_info(String name_info){
		
		Map<String, String>map = new HashMap<String, String>();
		
		UserVO uvo = u_dao.id_info(name_info);
		
		map.put("id",uvo.getId());
		
		
		return map;
	}
	
	//PW 이름을 찾기 
	@RequestMapping(value = "/pwsearch.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> pw_info(String nickname_info){
		
		System.out.println(nickname_info);
		
		Map<String, String>map = new HashMap<String, String>();
		
		UserVO uvo = u_dao.pw_info(nickname_info);
		
		map.put("pw",uvo.getPw());
		
		return map;
	}
}
