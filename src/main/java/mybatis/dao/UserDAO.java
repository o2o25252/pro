package mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.StarVO;
import com.data.vo.UserVO;


public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	//회원가입 을 했는지 판단 부분 
	public boolean search(UserVO vo) {
		
		//신규가입자라면 true 
		//기존에 가입되어있다면 false
		boolean chk = true;
		System.out.println(vo.getId());
		System.out.println(vo.getId());
		System.out.println(vo.getId());
		
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

	private void insertMem(UserVO vo) {
		// 신규 가입
		int cnt2 = ss.insert("user.n_add", vo);
		
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
		
		public List<StarVO> getList(String moviecd) {
		
			List<StarVO> s_list = ss.selectList("star.list", moviecd);
			
			return s_list;
		}
	
	
}
