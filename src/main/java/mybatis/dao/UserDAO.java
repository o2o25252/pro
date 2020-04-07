package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.BbsVO;
import com.data.vo.StarVO;
import com.data.vo.UserVO;


public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	// 회원가입 을 했는지 판단 부분 
	public boolean search(UserVO vo) {
		//신규가입자라면 true 
		//기존에 가입되어있다면 false
		boolean chk = true;
		
		int cnt = ss.selectOne("user.search_id", vo.getId());
		//id를 주었을때 cnt 의 값이 올라가면 
		if(cnt > 0) {
			chk = false;
		}			
		
		if(chk) {
			insertMem(vo);
		}
		
		return chk; 
	}

	// 신규 가입
	private void insertMem(UserVO vo) {
		int cnt2 = ss.insert("user.h_add", vo);
	}
	
	//★★★★★★★★★★별점 DAO 
	//별점 추가 
	public boolean staradd(StarVO svo) {
		boolean chk = false;
		
		int cnt =ss.insert("star.star_add", svo);
		if(cnt > 0) {
			chk =true;
		}
		
		return chk;
	}
	
	//별점 평균 보기 
	public double avg(String moviecd) {
		double avgr =ss.selectOne("star.avg_r",moviecd);
		return avgr;
	}
	
	// 별점 리스트 가져옴
	public List<StarVO> getList(String moviecd) {
	
		List<StarVO> s_list = ss.selectList("star.list", moviecd);
		
		return s_list;
	}

	//아이디 중복 확인
	public boolean id_okok(String id) {
		boolean chk = false;
		
		 List<UserVO> cnt =  ss.selectList("user.id_ok",id);
		 for(UserVO uvo:cnt) {
			 if(uvo.getId().equals(id)) {
				 chk = true;
				 break;
			 }
		 }
		return chk;
	}
	
	// 로그인
	public boolean log(String id, String pw) {
		boolean chk = false; // id , pw 둘다 맞을떄 true 주기용
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		List<UserVO> cnt = ss.selectList("user.id_login", map);
		
		if(cnt.size()>0) {
			chk = true;
		}
		return chk;
	}
	
	//회원 정보 찾기 
	public UserVO search_user(String id,String pw) {
		UserVO[] ar = null;
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		UserVO uvo = ss.selectOne("user.id_login", map);
		
		return uvo;
	}
	
}















