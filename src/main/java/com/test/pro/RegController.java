package com.test.pro;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private HttpSession session;
	
	//회원 가입
	@RequestMapping(value = "/regOk.inc",method =  RequestMethod.POST)
	public ModelAndView newid(String id,String pw,String name,String nickname)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		UserVO vo = new UserVO();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setNickname(nickname);
		vo.setStatus("0");
		
		u_dao.search(vo);
		if(vo!=null)
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
	
	// 로그인
	@RequestMapping(value = "/userdo.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login_id(String id,String pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean chk = u_dao.log(id,pw);
		map.put("chk", chk);
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(pw);
		
		//회원 정보 찾기 
		UserVO uvo = u_dao.search_user(id,pw);
		session.setAttribute("userVO",uvo);
		
		return map;
	}
}
