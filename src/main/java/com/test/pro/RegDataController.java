package com.test.pro;

import java.io.File;
import java.io.FileWriter;
import java.util.List;

import javax.servlet.ServletContext;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemVO;

@Controller
public class RegDataController {

	private String f_path ="/resources/data.xml";
	@Autowired
	private ServletContext application;
	@RequestMapping("/reg.inc")
	private String reg() {
		return "reg";
	}
	
	@RequestMapping("/login.inc")
	private String login() {
		
		return "login";
	}
	@RequestMapping(value="/login_ok.inc", method = RequestMethod.POST)
	private ModelAndView login_ok(String id, String pw) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String path = application.getRealPath(f_path); //절대 경로 
		File file = new File(path);  

		Document doc = null;
		Element root = null;
		//1. 파일 존재여부 확인
		//2.파일 읽어서 member의 id 에 속성값과 지금 입력되어온 인자의 id 값과 동일한지 비교 
		//3.member 에 속해있는 pw에 속성값과 지금 입려되어온 인자의 pw 값과 동일한지 비교 
		if(file.exists()) {
			
			SAXBuilder builder = new SAXBuilder();
			
			doc = builder.build(path);
			root =doc.getRootElement();
			
			
			//id 찾기
			boolean id_chk = false;
			List<Element> reg_list = root.getChildren();
			String member_name = null;
			String member_id = null;
			for(Element e: reg_list) {
				if(e.getAttributeValue("id").equals(id)) {
					
					member_id =e.getAttributeValue("id");
					//System.out.println(member_id);
					Element name = e.getChild("name"); //xml 에 있는 name 
					member_name =	name.getAttributeValue("name");
					
					//지금 입력한 id 가 기존에 있는 id 와 같은지 확인
					id_chk =true;
					break;
				}
			}//id _for 끝
				//System.out.println(id_chk);
			//pw 찾기
			Element member = root.getChild("member");
			Element member_pw = member.getChild("pw");
			boolean pw_chk = false;
			List<Element> reg_list2 =member.getChildren("pw");
			
			for(Element e: reg_list2) {
				if(e.getAttributeValue("pw").equals(pw)) {
					
					//지금 입력한 pw 가 기존에 있는 pw 와 같은지 확인
					pw_chk = true;
					break;
				}
			}//id_ for 끝
				//System.out.println(pw_chk);
				
				
				
				if(id_chk && pw_chk) {
					// 둘다 true 일떄 					
					MemVO memvo = new MemVO();
					memvo.setM_name(member_name);
					memvo.setM_id(member_id);
					mv.addObject("memvo", memvo);
					
					int ok = 0;
					mv.addObject("ok", ok);
					mv.addObject("id", id);
					mv.setViewName("Main");
				}else {
					//System.out.println("가입된 회원이 없어요");
				}
					
				
		}
		return mv;
	}
	
	
	
	@RequestMapping(value="/add.inc", method = RequestMethod.POST)
	private ModelAndView add(String id, String name,String pw)throws Exception{
		//reg.jsp 에서 입력한 값 인자로 받기  
		

		ModelAndView mv = new ModelAndView();
		String path = application.getRealPath(f_path); //절대 경로 
		File file = new File(path);  

		Document doc = null;
		Element root = null;
		
		if(file.exists()) { //파일 존재시 회원가입이 한번 은 되었다는 거닌깐 
			//다음 추가 회원을 작업을 위한곳
			//System.out.println("가입");
			SAXBuilder builder = new SAXBuilder();

			doc = builder.build(path);

			root =doc.getRootElement();
			//새로운 멤버객체를 추가하기 위해 요소 생성! 

			Boolean chk = false; 
			
			List<Element> reg_list = root.getChildren();
			
			for(Element e: reg_list) {
				//System.out.println(e); //멤버 
				if(e.getAttributeValue("id").equals(id)) {
					
					//지금 입력한 id 가 기존에 있는 id 와 같은지 확인 (중복검사)
					chk =true;
					break;
				}
			}//for 끝
			
			//System.out.println(chk);
			if(!chk) {
				Element member = new Element("member");

				//Element m_id = new Element("id");
				Element m_name = new Element("name");
				Element m_pw = new Element("pw");


				//m_id.setText("아이디");
				m_pw.setText("비밀번호 ");
				m_name.setText("이름");
				
				member.setAttribute("id", id); //인자로 온 id 값
				m_pw.setAttribute("pw",pw);
				m_name.setAttribute("name", name);
				
				//member.addContent(m_id);
				member.addContent(m_name);
				member.addContent(m_pw);

				root.addContent(member);

				mv.addObject("chk",chk);
			}else
				mv.addObject("chk",chk);
		}else {//첫 가입시  파일 만들기 
			//System.out.println("첫가입");
			SAXBuilder builder = new SAXBuilder();

			doc = new Document();//XML 문서 객체 생성 
			//새로만들어진 문서객체이므로 루트를 만들어준다 . 
			root = new Element("root");
			Element member = new Element("member");

			//Element m_id = new Element("id");
			Element m_name = new Element("name");
			Element m_pw = new Element("pw");



			//m_id.setText("아이디");
			m_name.setText("이름");
			m_pw.setText("비밀번호 ");

			member.setAttribute("id", id); //인자로 온 id 값
			m_name.setAttribute("name", name);
			m_pw.setAttribute("pw",pw);

			//member.addContent(m_id);
			member.addContent(m_name);
			member.addContent(m_pw);

			root.addContent(member);
			//루트에 추가 

			//doc 에 root 지정 
			doc.setRootElement(root);

		}
		XMLOutputter xo = new XMLOutputter();
		//출력형식 설정 
		Format f = xo.getFormat();
		f.setIndent(" ");
		f.setLineSeparator("\r\n");
		f.setTextMode(Format.TextMode.TRIM);

		xo.setFormat(f);
		xo.output(doc, new FileWriter(path));
		
		
		
		mv.setViewName("login");

		return mv;
	}
		//로그아웃 
		@RequestMapping("/out.inc")
		private ModelAndView out() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:main.inc");
			return mv;
		}

}
