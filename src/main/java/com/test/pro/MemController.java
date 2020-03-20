package com.test.pro;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemVO;
@Controller
public class MemController {
	
	private String f_path ="/resources/data.xml";
	@Autowired
	private ServletContext application;
	
	
	@RequestMapping("/mem.inc")
	private ModelAndView gothe()throws Exception {
		System.out.println("와쩌염 뿌우");
		ModelAndView mv = new ModelAndView();
		String path = application.getRealPath(f_path); //절대 경로
		//System.out.println(path);
		File file = new File(path);  

		Document doc = null;
		Element root = null;
		
		if(file.exists()) {
			//파일 읽어와서 각부분에 속성값을 vo에 저장 
			
			SAXBuilder builder = new SAXBuilder();
			
			doc = builder.build(path);
			
			root=doc.getRootElement();
			
			List<Element> mem_list = root.getChildren();
			String member_name = null;
			String member_id = null;
			String member_pw = null;
			MemVO vo = null;
			MemVO[] ar  = new MemVO[mem_list.size()];
			int i =0;
			for(Element e: mem_list) {
				vo = new MemVO();
				
				member_id =e.getAttributeValue("id");
				System.out.println(member_id+"아이디");
				
				Element name = e.getChild("name");
				Element pw = e.getChild("pw");
				
				member_name = name.getAttributeValue("name");
				System.out.println(member_id+"이름");
				
				member_pw = pw.getAttributeValue("pw");
				System.out.println(member_pw+"비번");
				
				vo.setM_id(member_id);
				vo.setM_name(member_name);
				vo.setM_pw(member_pw);
				
				ar[i++] = vo;
			}
			
			for(int x= 0; x< ar.length; x++) {
				System.out.println("for문 돌림");
				System.out.println(ar[x].getM_id());
				System.out.println(ar[x].getM_name());
			}
			
				mv.addObject("ar", ar);
				mv.addObject("vo", vo);
				mv.setViewName("Mem");
		}
		
		return mv;
	}
	@RequestMapping("/edit.inc")
	private Map<String, String> edit(){
		Map<String, String> map =new HashMap<String, String>();
		
		
		return map;
				
	}
}
