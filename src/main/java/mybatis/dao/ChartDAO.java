package mybatis.dao;

import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.ChartVO;

public class ChartDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public Map<String, Object> chkChartData(String toDay, String tarDay, int count) {
		boolean chk = false;
		
		System.out.println(toDay);
		System.out.println(tarDay);
		System.out.println(count);
		
		Map<String, String> inputMap = new HashMap<String, String>();
		inputMap.put("strDate", toDay);
		inputMap.put("tarDay", tarDay);
		
		
		List<ChartVO> cList = template.selectList("chart.chkChartData", inputMap);
		
		JSONArray jsonAr = new JSONArray();
		if(cList.size() == count) {
			for(ChartVO vo : cList) {
				JSONObject data = new JSONObject();
				data.put("date", vo.getcDate());
				data.put("totalAmt", vo.getTotalAmt());
				jsonAr.add(data);
			} 
			chk = true;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("jsonAr", jsonAr);
			map.put("result", chk);
				
		return map;
	}
	
	public boolean saveChartData(Object json_data) {
		boolean chk = false;
		
		JSONParser jsonParse = new JSONParser();
		try {
			JSONObject jsonObj = (JSONObject) jsonParse.parse((String)json_data);
			
			JSONArray personArray = (JSONArray) jsonObj.get("date");
			for(int i=0; i < personArray.size(); i++) {
				JSONObject personObject = (JSONObject) personArray.get(i);
				System.out.println(personObject);
				System.out.println("0");
			}
			
			personArray = (JSONArray) jsonObj.get("totalAmt");
			for(int i=0; i < personArray.size(); i++) {
				JSONObject personObject = (JSONObject) personArray.get(i);
				System.out.println(personObject);
				System.out.println("1");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("saveChartData END");
		
		return chk;
	}
}
