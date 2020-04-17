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

import com.data.vo.CommVO;
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
	//선택 회원 댓글을 보기
	@RequestMapping(value="/selectview_bbs.inc", method = RequestMethod.GET)
	public ModelAndView selectview_bbs(String nickname) {
		ModelAndView mv = new ModelAndView();
		
		List<CommVO> c_list = m_dao.selectview_bbs(nickname);
		
		mv.addObject("c_list", c_list);
		mv.addObject("nickname", nickname);
		mv.setViewName("adminComm");
		
		return mv;
		
	}
	//선택 회원 댓글 삭제버튼 눌렀을때 
	@RequestMapping(value = "/comment_ban.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> comment_ban(String c_idx){
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		Boolean chk = m_dao.select_comment_ban(c_idx);
		map.put("chk", chk);
		
		return map;
	}
	
	//선택 회원 댓글 복구버튼 눌렀을때 
		@RequestMapping(value = "/comment_recover.inc", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Boolean> comment_recover(String c_idx){
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			Boolean chk = m_dao.select_comment_recover(c_idx);
			
			map.put("chk", chk);
			
			return map;
		}
	
}
