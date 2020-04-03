package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.BbsVO;

public class BbsDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//전체게시물의 '수'를 반환하는 기능 - list.jsp에서 호출
	public int getTotalCount() {
		
		int cnt = template.selectOne("bbs.totalCount");
		
		return cnt;
	}  
	
	// 원하는 페이지의 게시물을 목록화면으로
	// 표현하기 위해 '배열'로 반환하는 기능 - list.jsp
	public BbsVO[] getList(int begin, int end) {
		BbsVO[] ar = null;
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<BbsVO> list = template.selectList("bbs.bbslist", map);
		// 각 게시물을 의미하는 객체가 BbsVO이다. 그 안에
		// 댓글들이 모두 들어온 상태이다.
		
		// 받은 리스트를 준비된 배열로 변환한다.
		if(list != null) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	//원글 추가  
	public boolean add(BbsVO vo) {
		boolean chk = false;
		int cnt = template.insert("bbs.add",vo);
		
		if(cnt > 0) {
			
			chk= true;
		}
		return chk;
		
	}
	
	// 게시물 보기
	public BbsVO getview(String b_idx) {
		//System.out.println(b_idx);
		BbsVO vo = template.selectOne("bbs.getBbs", b_idx);
		
		return vo;
		
	}
	
	// 게시물 수정 
	public boolean edit(BbsVO vo) {
		
		boolean value = false;
		
		int cnt = template.update("bbs.edit",vo);
		
		if(cnt > 0)
			value = true;
		
		return value;
	}
	
}
