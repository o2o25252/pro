package com.test.pro;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.dao.ChartDAO;

@Controller
public class ChartController {
	
	@Autowired
	private ChartDAO c_dao;

	@RequestMapping(value="/ex5.inc")
	public String ex5() {
		return "chartExO2";
	}
	
	@RequestMapping(value = "/chkChartData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ex0(String toDay, String tarDay, int count) {
		
		Map<String, Object> map = c_dao.chkChartData(toDay, tarDay, count);
		
		return map;
	}
	
	@RequestMapping(value = "/saveChartData", method = RequestMethod.POST)
	@ResponseBody
	public void ex00(Object json_data) {
		
		c_dao.saveChartData(json_data);
		
	}
}
