package com.test.pro;
 
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.ActorsVO;
import com.data.vo.MovieVO;
import com.data.vo.RankVO;
import com.data.vo.StarVO;
import com.data.vo.UserVO;

import mybatis.dao.UserDAO;

@Controller
public class DataController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	UserDAO u_dao;
	
	// 검색하기
	@RequestMapping("/search.inc")
	public ModelAndView search(String movieNm)throws Exception{
		URL search = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml?key=430156241533f1d058c603178cc3ca0e&movieNm="+movieNm);

		Element s_root = connectXML(search);
		
		Element movieList = s_root.getChild("movieList");
		
		List<Element> m_list = movieList.getChildren("movie");
		MovieVO[] s_ar = new MovieVO[m_list.size()];
		
		int i =0;
		for(Element m: m_list) {
			MovieVO m_vo = new MovieVO();
			
			m_vo.setMovieCd(m.getChildText("movieCd"));
			m_vo.setMovieNm(m.getChildText("movieNm"));
			m_vo.setPrdtYear(m.getChildText("prdtYear"));
			m_vo.setOpenDt(m.getChildText("openDt"));
			m_vo.setTypeNm(m.getChildText("typeNm"));
			m_vo.setNationNm(m.getChildText("nationNm"));
			
			m_vo.setGenreNm(m.getChildText("genreAlt"));
			m_vo.setNationNm(m.getChildText("repNationNm"));
			m_vo.setGenreNm(m.getChildText("repGenreNm"));
			m_vo.setDirectors_peopleNm(m.getChildText("peopleNm"));
			
			s_ar[i++]= m_vo;
		}
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("search", s_ar);
			mv.setViewName("search");
			
			return mv;
		}

	// 영화 상세정보
	@RequestMapping(value = "/oo.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, MovieVO> Moviedata(String movieCd) throws Exception{

		URL Weeklyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=4855fdf6db4ccb1111545e16fb5c682b&movieCd="+movieCd);
		
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
		if(nation.size()>0) {
			vo.setNationNm(nation.get(0).getChildText("nationNm"));
		}
		
		String nationEE;
		
		if(vo.getNationNm().equals("한국")) {
			nationEE = "KR";
		}else if(vo.getNationNm().equals("미국")) {
			nationEE = "US";
		}else if(vo.getNationNm().equals("일본")) {
			nationEE = "JP";
		}else if(vo.getNationNm().equals("홍콩")) {
			nationEE = "HK";
		}else if(vo.getNationNm().equals("영국")) {
			nationEE = "GB";
		}else if(vo.getNationNm().equals("프랑스")) {
			nationEE = "FR";
		}else {
			nationEE = "ETC";
		}
		
		vo.setPostURL(getPost(vo.getMovieNm(), vo.getPrdtYear(), nationEE));	// 영화 썸네일
		
		Element genres = movieInfo.getChild("genres");			// 장르명
		List<Element> genre = genres.getChildren("genre");
		if(genre.size()>0) {
		vo.setGenreNm(genre.get(0).getChildText("genreNm"));
		}
		
		Element directors = movieInfo.getChild("directors");
		List<Element> director = directors.getChildren("director");
		if(director.size()>0) {
		vo.setDirectors_peopleNm(director.get(0).getChildText("peopleNm"));
		
		vo.setDirectors_peopleNmEn(director.get(0).getChildText("peopleNmEn"));
		}
		
		Element actors = movieInfo.getChild("actors");
	      List<Element> actor = actors.getChildren("actor");
	      if(actor.size()>0) {
	         
	         ActorsVO[] actor_ar = null;
	         
	         if(actor.size() > 3) {
	            actor_ar = new ActorsVO[3];
	         }else {
	            actor_ar = new ActorsVO[actor.size()];
	         }
	         
	         int i=0;
	         for(Element e : actor) {
	            ActorsVO avo = new ActorsVO();
	            
	            avo.setPeopleNm(e.getChildText("peopleNm"));   // 배우명
	            // avo.setPeopleNmEn(e.getChildText("peopleNmEn"));   // 배우명 영문
	            // avo.setCast(e.getChildText("cast"));         // 배역명
	            // avo.setCastEn(e.getChildText("castEn"));      // 배역명 영문
	            actor_ar[i++] = avo;
	            
	            if(i == actor_ar.length)
	               break;
	         }
	         vo.setAvo(actor_ar);
	      }
		
		Element companys = movieInfo.getChild("companys");
		List<Element> company = companys.getChildren("company");
		if(company.size()>0) {
			vo.setCompanyCd(company.get(0).getChildText("companyCd"));
			vo.setCompanyNm(company.get(0).getChildText("companyNm"));
			vo.setCompanyNmEn(company.get(0).getChildText("companyNmEn"));
			vo.setCompanyPartNm(company.get(0).getChildText("companyPartNm"));
		}
		
		Map<String, MovieVO> map = new HashMap<String, MovieVO>();
		
		map.put("vo", vo);
		return map;
	}

	 // 영화 포스터 가져오기
	public String getPost(String movieNm, String prdtYear, String nationEE) throws Exception{
     
        String clientID="UssVhdtzaSQlNhAr5bke"; //네이버 개발자 센터에서 발급받은 clientID입력
        String clientSecret = "6bwpOT_Ese";        //네이버 개발자 센터에서 발급받은 clientSecret입력
        
        String mv_name = URLEncoder.encode(movieNm, "UTF-8");
        URL url = new URL("https://openapi.naver.com/v1/search/movie.xml?query="+mv_name+"&yearfrom="+prdtYear+"&yearto="+prdtYear+"&country="+nationEE); 
        
        URLConnection urlConn = url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 
        
        urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
        urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        
        SAXBuilder builder = new SAXBuilder();
        Document doc = builder.build(urlConn.getInputStream());

        Element root = doc.getRootElement();
        Element channel = root.getChild("channel");

        List<Element> item = channel.getChildren("item");
        String image_s = null;
        if(item.size() != 0) {
           image_s = item.get(0).getChildText("image");         
        }else {
           image_s = "http://www.kobis.or.kr/kobis/web/comm/images/main/noimage.png";
        }
      
        return image_s;
   }
	
	//다이어로그 평점 댓글표현
	@RequestMapping(value ="/getComm.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getComm(String movieCd) {
		
		List<StarVO> commList =  u_dao.getList(movieCd);
		
		StarVO[] commAr = null;
		
		if(commList.size() != 0) {
			commAr = new StarVO[commList.size()];
			commList.toArray(commAr);			// commlist 를 ar로 변환
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commAr", commAr);
		
		return map;
	}
	
	//다이어로그 평점 댓글등록
	@RequestMapping(value ="/coco.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> staradd(String movieCd, String
	 rating, String content) {
		
		//StarVO 에 인자 값 온거 넣기
		StarVO vo = new StarVO();
		vo.setMovieCd(movieCd);
		vo.setRating(rating);
		vo.setContent(content);
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO uvo = null;
		Object obj =  session.getAttribute("userVO");
		if(obj != null) {
			uvo = (UserVO) obj;
		
			vo.setWriter(uvo.getNickname());
			
			//vo 를 DB에 넣기 
			if(u_dao.staradd(vo)) {
				map.put("svo", vo);
			}
		}
		return map;
	}

	// 금일 달력 순위 
	@RequestMapping(value = "/last.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Dailydata2(String targetDt) throws Exception{

		// 금일 박스오피스 순위
		URL Dailyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=4855fdf6db4ccb1111545e16fb5c682b&targetDt="+targetDt);
		
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
	
	// 금주 달력
	@RequestMapping(value = "/next.inc",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Weeklydatanext(String targetDt) throws Exception{
		
		// 금주 박스오피스 순위
		URL Weeklyurl = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=4855fdf6db4ccb1111545e16fb5c682b&weekGb=0&targetDt="+targetDt);
		
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
		
		String yearWeekTime = root.getChildText("yearWeekTime");
		
		String ywt_Y = yearWeekTime.substring(2, 4);
		String ywt_W = yearWeekTime.substring(4);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Weeklyar", ar);
		map.put("ywt_Y", ywt_Y);
		map.put("ywt_W", ywt_W);
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