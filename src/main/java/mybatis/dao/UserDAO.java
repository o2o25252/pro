package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
	
}
