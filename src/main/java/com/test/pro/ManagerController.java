package com.test.pro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.UserVO;

import mybatis.dao.ManagerDAO;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerDAO m_dao;
	
	//admin.jsp 로 가는 컨트롤러
	@RequestMapping("/admin.inc")
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView();
		
		List<UserVO>u_list =	m_dao.all_info();
		mv.addObject("u_list", u_list);
		mv.setViewName("admin");
		
		return mv;
		}
	//정지 버튼 눌렀을때 
	@RequestMapping(value = "/ban.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ban(String id){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		Boolean chk = m_dao.user_ban(id);
		
		
		map.put("chk", chk);
		
		return map;
	}
	//복구 버튼 눌렀을때
	@RequestMapping(value = "/recover.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> recover(String id, String division){

		Boolean chk = m_dao.user_recover(id, division);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("chk", chk);
		
		return map;
	}
}
