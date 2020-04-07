package com.test.pro;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.data.vo.UserVO;

import mybatis.dao.UserDAO;

@Controller
public class RegController {

	@Autowired
	private UserDAO u_dao;
	
	//회원 가입
	@RequestMapping(value = "/regOk.inc",method = RequestMethod.GET)
	public Map<String, Object> newid(String id,String pw,String name,String nickname)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setNickname(nickname);
		
		map.put("uvo", vo);
		
		return map;
	}
}
