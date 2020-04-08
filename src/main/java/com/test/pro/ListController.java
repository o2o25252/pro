package com.test.pro;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;
import com.data.vo.CommVO;
import com.pro.util.FileRenameUtill;
import com.pro.util.Paging;

import mybatis.dao.BbsDAO;
@Controller
public class ListController  {


	private String imgPath = "/resources/editor_img";
	private String uploadPath ="/resources/upload";

	@Autowired
	private BbsDAO b_dao;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ServletContext application;


	//페이징 기법을 위한 상수들
	public final int BLOCK_LIST = 10; // 한페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 5; // 한블럭당 보여질 페이지 수

	//멤버변수들
	int nowPage; // 현제 페이지
	int rowTotal; // 전체 게시물의 수
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳


	// 리스트 화면으로 전환하기
	@RequestMapping("/notice.inc")
	public ModelAndView handleRequest(String nowPage) throws Exception {
		// 사용자가 브라우저에서 notice.inc라고 요청 했을 때
		// 수행하는 곳

		// 현재 페이지 값을 받는다.
		if(nowPage == null)
			this.nowPage = 1;
		else
			this.nowPage = Integer.parseInt(nowPage);


		// 총 게시물의 수를 MyBatis환경을 통해 얻는다.
		rowTotal = b_dao.getTotalCount();

		// 페이징 처리를 위한 객체 생성
		Paging page = new Paging(this.nowPage,  BLOCK_LIST, BLOCK_PAGE,rowTotal);
		//jsp에서 표현할 페이징 기법의 코드를 pageCode에다가 저장
		pageCode = page.getSb().toString();

		//JSP에서 표현할 게시물들을 목록으로 받기 위해
		// begin과 end가 필요하다.
		int begin = page.getBegin();
		int end = page.getEnd();

		// MyBatis환경을 통해 begin과 end를 전달하면서 
		// 표현할 게시물들을 받는다.
		BbsVO[] ar = b_dao.b_getList(begin, end);

		ModelAndView mv = new ModelAndView();
		mv.addObject("pageCode", pageCode);
		mv.addObject("list", ar);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("rowTotal", rowTotal); // 게시물 앞에 번호찍는용

		mv.setViewName("notice");

		return mv;
	}

	//쓰기  페이지로 가는 곳 갈떄 nowPage 챙기고 가기
	@RequestMapping("/b_write.inc")
	public ModelAndView add(String nowPage) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("nowPage", nowPage);
		mv.setViewName("b_write");

		return mv;
	}

	//에디터에 이미지 표현 부분
	@RequestMapping(value = "/saveImage.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImage(BbsVO vo) throws Exception{
		String f_name = null;
		MultipartFile mf = vo.getUpload();
		if( mf != null &&mf.getSize() > 0) {

			String path = application.getRealPath(imgPath);
			f_name = mf.getOriginalFilename();

			f_name = FileRenameUtill.checkFileName(path, f_name);

			mf.transferTo(new File(path, f_name));
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("url", request.getContextPath()+imgPath+"/"+f_name);
		String url = request.getContextPath()+imgPath+"/"+f_name;
		return map;
	}

	//원글 추가 기능 
	@RequestMapping(value = "/b_add.inc", method = RequestMethod.POST)
	public ModelAndView write(BbsVO vo )throws Exception{

		ModelAndView mv = new ModelAndView();

		MultipartFile mf = vo.getUpload();

		if(mf != null && mf.getSize() >0) {
			String path = application.getRealPath(uploadPath);

			String f_name = mf.getOriginalFilename();

			f_name = FileRenameUtill.checkFileName(path, f_name);

			mf.transferTo(new File(path, f_name));

			vo.setFile_name(f_name);
		}else{
			vo.setFile_name("");
		}

		vo.setIp(request.getRemoteAddr());  //ip

		boolean value  = b_dao.b_add(vo);

		if(value)
			mv.setViewName("redirect://notice.inc");
		else
			mv.setViewName("redirect:/b_write.inc?nowPage="+vo.getNowPage());

		return mv;

	}

	// 보기 화면 전환
	@RequestMapping("/b_view.inc")
	public ModelAndView view(String b_idx,String nowPage) {

		ModelAndView mv = new ModelAndView();

		BbsVO vo = b_dao.getview(b_idx);
		mv.addObject("vo", vo);
		mv.setViewName("b_view");
		mv.addObject("b_idx", b_idx);
		mv.addObject("nowPage", nowPage);
		return mv;
	}

	// 수정 화면 전환
	@RequestMapping("/b_editgo.inc")
	public ModelAndView goedit(String b_idx, String nowPage) {

		BbsVO vo = b_dao.getview(b_idx);

		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.setViewName("b_edit");

		return mv;
	}

	// 원글 수정 완료
	@RequestMapping(value = "/b_editok.inc", method = RequestMethod.POST)
	public ModelAndView editok(BbsVO vo) throws Exception{

		// 파일 처리시 예외 처리 가능하여 뒤에 throws Exception을 사용 만약 try catch를 사용하면 필요가 없다.
		ModelAndView mv = new ModelAndView();

		MultipartFile mf = vo.getUpload();

		if(mf != null && mf.getSize()>0) {
			String path = application.getRealPath(uploadPath);

			String file_name = mf.getOriginalFilename();

			file_name = FileRenameUtill.checkFileName(path, file_name);

			mf.transferTo(new File(path,file_name));

			vo.setFile_name(file_name);
		}

		vo.setIp(request.getRemoteAddr());

		boolean value = b_dao.b_edit(vo);

		if(value) {
			mv.setViewName("redirect:/b_view.inc?nowPage="+vo.getNowPage()+"&b_idx="+vo.getB_idx());
		}

		return mv;
	}

	//게시물삭제
	@RequestMapping(value = "/b_del.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> del(String b_idx, String pwd) {
		Map<String, Boolean> map = new  HashMap<String, Boolean>();

		boolean chk =	b_dao.b_del(b_idx, pwd);



		map.put("chk", chk);


		return map;

	}
	//댓글 입력 
	@RequestMapping(value = "/comm_add.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, CommVO> comment_add(String b_idx, String c_writer, String c_pwd, String c_content){

		Map<String, CommVO> map = new HashMap<String, CommVO>();

		CommVO cvo = new CommVO();
		cvo.setB_idx(b_idx);
		cvo.setContent(c_content);

		String ip = request.getRemoteAddr();
		cvo.setIp(ip);
		cvo.setPwd(c_pwd);
		cvo.setWriter(c_writer);

		b_dao.comment_add(cvo); //여기까지 DB 댓글 등록


		map.put("cvo", cvo);

		return map;
	}

	//댓글 표현
	@RequestMapping(value = "/comm_view.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> comment_add(String b_idx){

		Map<String, Object> map = new HashMap<String, Object>();

		List<CommVO> c_list = b_dao.getcomlist(b_idx);

		CommVO[] c_ar = null;

		if(c_list.size() != 0) {
			c_ar = new CommVO[c_list.size()];
			c_list.toArray(c_ar);
		}
		map.put("c_ar", c_ar);

		return map;
	}
	//댓글 삭제
	@RequestMapping(value = "/comm_del.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> comment_del(String c_idx, String pwd) {

		Map<String, Object> map = new  HashMap<String, Object>();

		boolean chk =	b_dao.comment_del(c_idx, pwd);
		map.put("pwd",pwd);
		map.put("chk", chk);

		return map;

	}

	// 댓글 수정 완료
	@RequestMapping(value = "/c_editok.inc", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> c_editok(String content,String pwd,String c_idx) throws Exception{
		
		boolean chk = b_dao.c_edit(content, pwd, c_idx);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("chk", chk);
		return map2;
	}

}
