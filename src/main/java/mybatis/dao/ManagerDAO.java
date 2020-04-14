package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.UserVO;

public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	// 모든 회원 정보를 보기 위한 기능 
	public List<UserVO> all_info() {
		
		List<UserVO> u_list = ss.selectList("manager.all_info");
		
		return u_list;
	}
	// 정지 버튼 눌렀을때 회원 정지 
	public boolean user_ban(String id) {
		
		boolean chk = false;
		
		int cnt = ss.update("manager.user_ban", id);
		if(cnt > 0 ) {
			chk = true;
		}
		return chk;
	}
	// 복구 번틀 눌렀을떄 회원 복구
	public boolean user_recover(String id , String division) {
		
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("division", division);
		
		int cnt = ss.update("manager.user_recover", map);
		
		if(cnt >0) {
			chk = true;
		}
		
		return chk;
		
	}
}
