package com.test.pro;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.data.vo.MovieVO;
import com.data.vo.RankVO;

@Controller
public class DataController {
	
	@RequestMapping("main.inc")
	public String Gomain() {
		
	
		return	"Main";
	}
	
	@RequestMapping("/dd.inc")
	public Map<String, Object> Dailydata() throws Exception{
		
		// 금일 박스오피스 순위
		URL Dailyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=4855fdf6db4ccb1111545e16fb5c682b&targetDt=20200317");
		
		Element root = connectXML(Dailyurl);
		
		Element dailyBoxOfficeList = root.getChild("dailyBoxOfficeList");
		
		List<Element> d_list = dailyBoxOfficeList.getChildren("dailyBoxOffice"); 
		
		RankVO[] ar = new RankVO[d_list.size()];
		
		int i=0;
		for(Element e : d_list) {
			RankVO vo = new RankVO();
			
			vo.setRnum(e.getChildText("rnum"));			// 순번
			vo.setMovieCd(e.getChildText("movieCd"));	// 영화 코드
			vo.setMovieNm(e.getChildText("movieNm"));	// 영화 이름
			vo.setOpenDt(e.getChildText("openDt"));		// 개봉일
			
			System.out.println(e.getChildText("movieNm"));
			
			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Dailyar", ar);
		return map;
	}
	
	public Map<String, Object> Weeklydata() throws Exception{
		
		// 금주 박스오피스 순위
		URL Weeklyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=4855fdf6db4ccb1111545e16fb5c682b&targetDt=20200310");
		
		Element root = connectXML(Weeklyurl);
	
		Element weeklyBoxOfficeList = root.getChild("weeklyBoxOfficeList");
		
		List<Element> w_list = weeklyBoxOfficeList.getChildren("weeklyBoxOffice"); 
		
		RankVO[] ar = new RankVO[w_list.size()];

		int i=0;
		for(Element e : w_list) {
			RankVO vo = new RankVO();
			
			vo.setRnum(e.getChildText("rnum"));			// 순번
			vo.setMovieCd(e.getChildText("movieCd"));	// 영화 코드
			vo.setMovieNm(e.getChildText("movieNm"));	// 영화 이름
			vo.setOpenDt(e.getChildText("openDt"));		// 개봉일

			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Weeklyar", ar);
		return map;
	}
	
	
	
	// 미완성-----------------------------------------------------
	public Map<String, Object> Moviedata(String movieCd) throws Exception{
		
		// 영화 상세정보
		URL Weeklyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=4855fdf6db4ccb1111545e16fb5c682b&movieCd="+movieCd);
		
		Element root = connectXML(Weeklyurl);
	
		Element weeklyBoxOfficeList = root.getChild("weeklyBoxOfficeList");
		
		List<Element> w_list = weeklyBoxOfficeList.getChildren("weeklyBoxOffice"); 
		
		MovieVO[] ar = new MovieVO[w_list.size()];

		int i=0;
		for(Element e : w_list) {
			MovieVO vo = new MovieVO();
			

			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("moviInfo", ar);
		return map;
	}

	public Element connectXML(URL url) throws Exception{
		// 연결객체 생성
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		// 연결객체로 부터 결과를 받는 contentType설정
		conn.setRequestProperty("Content-Type", "application/xml");
		
		conn.connect();
		
		// 연결된 결과는 xml문서이고 그 문서를
		// Document로 로드하기 위해 파서 준비
		SAXBuilder builder = new SAXBuilder();

		Document doc = builder.build(conn.getInputStream());
		
		// 루트 반환
		return doc.getRootElement();
	}
}
