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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.ActorsVO;
import com.data.vo.MovieVO;
import com.data.vo.RankVO;

@Controller
public class DataController {
	
	@RequestMapping("main.inc")
	public String Gomain() {
		
	
		return	"Main";
	}
	
	@RequestMapping(value = "/dd.inc",method = RequestMethod.POST)
	@ResponseBody
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
			
			
			
			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Dailyar", ar);
		return map;
	}
	
	@RequestMapping(value = "/weekly.inc",method = RequestMethod.POST)
	@ResponseBody
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
			
			//System.out.println(e.getChildText("movieNm"));
			//System.out.println(e.getChildText("openDt"));

			ar[i++] = vo;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("Weeklyar", ar);
		return map;
	}
	
	
	
	// 미완성-----------------------------------------------------
	@RequestMapping(value = "/oo.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, MovieVO> Moviedata(String movieCd) throws Exception{

		// 영화 상세정보
		URL Weeklyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=4855fdf6db4ccb1111545e16fb5c682b&movieCd="+movieCd);
		System.out.println(movieCd);
		MovieVO vo = new MovieVO();

		Element root = connectXML(Weeklyurl);
	
		Element movieInfo = root.getChild("movieInfo");		
		vo.setMovieCd(movieCd);
		vo.setMovieNm(movieInfo.getChildText("movieNm"));
		vo.setMovieNmEn(movieInfo.getChildText("movieNmEn"));
		vo.setShowTm(movieInfo.getChildText("showTm"));
		vo.setPrdtYear(movieInfo.getChildText("prdtYear"));
		vo.setOpenDt(movieInfo.getChildText("openDt"));
		vo.setPrdtStatNm(movieInfo.getChildText("prdtStatNm"));
		vo.setTypeNm(movieInfo.getChildText("typeNm"));
		
		Element nations = movieInfo.getChild("nations");		// 제작 국가명
		List<Element> nation = nations.getChildren("nation");
		vo.setNationNm(nation.get(0).getChildText("nationNm"));
		
		
		Element genres = movieInfo.getChild("genres");			// 장르명
		List<Element> genre = genres.getChildren("genre");
		vo.setGenreNm(genre.get(0).getChildText("genreNm"));
		
		
		Element directors = movieInfo.getChild("directors");
		List<Element> director = directors.getChildren("director");
		vo.setDirectors_peopleNm(director.get(0).getChildText("peopleNm"));
		vo.setDirectors_peopleNmEn(director.get(0).getChildText("peopleNmEn"));
		
		Element actors = movieInfo.getChild("actors");
		List<Element> actor = actors.getChildren("actor");
		ActorsVO[] actor_ar = new ActorsVO[3];
		
		int i=0;
		for(Element e : actor) {
			ActorsVO avo = new ActorsVO();
			
			avo.setPeopleNm(e.getChildText("peopleNm"));	// 배우명
			avo.setPeopleNmEn(e.getChildText("peopleNmEn"));	// 배우명 영문
			avo.setCast(e.getChildText("cast"));			// 배역명
			avo.setCastEn(e.getChildText("castEn"));		// 배역명 영문
			
			actor_ar[i++] = avo;
			if(i == 3)
				break;
		}
		vo.setAvo(actor_ar);
		
		Element companys = movieInfo.getChild("companys");
		List<Element> company = companys.getChildren("company");
		vo.setCompanyCd(company.get(0).getChildText("companyCd"));
		vo.setCompanyNm(company.get(0).getChildText("companyNm"));
		vo.setCompanyNmEn(company.get(0).getChildText("companyNmEn"));
		vo.setCompanyPartNm(company.get(0).getChildText("companyPartNm"));
		
		
		System.out.println(vo.getMovieCd());
		System.out.println(vo.getMovieNm());
		System.out.println(vo.getDirectors_peopleNm());
		
		System.out.println(vo.getAvo()[0].getPeopleNm());
		System.out.println(vo.getAvo()[0].getCast());
		
		Map<String, MovieVO> map = new HashMap<String, MovieVO>();
		map.put("vo", vo);
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