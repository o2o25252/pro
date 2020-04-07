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
public class RegController {

	@Autowired
	private UserDAO u_dao;
	
	//회원 가입
	@RequestMapping(value = "/regOk.inc",method =  RequestMethod.POST)
	public ModelAndView newid(String id,String pw,String name,String nickname)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		UserVO vo = new UserVO();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setNickname(nickname);
		
		u_dao.h_reg(vo);
		
		mv.setViewName("main");
		
		return mv;
	}
	
	// 아이디 중복
	@RequestMapping(value = "/idCheck.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> goidCheck(String id){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean chk = u_dao.id_okok(id);
		if(chk) {
			map.put("tru", chk );
		}
		return map;
	}
}
