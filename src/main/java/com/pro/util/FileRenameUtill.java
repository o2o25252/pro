package com.pro.util;

import java.io.File;

public class FileRenameUtill {
	
	public static String checkFileName(String path, String fname) {
		
		//static 하는 이유 프로그램이 끝날 떄까지 메모리 상에 유지 시키기 위해서 
		
		//인자인 fname에서 확장자를 뺸 파일명 가려내자, 그렇게 하려면 먼저 "."의 위치를 알아내야 함!
		int period = fname.lastIndexOf("."); //2
		
		//파일명과 확장자를 분리한다.
		String name = fname.substring(0, period); //ok
		
		String suffix =fname.substring(period); //.jpg
		
		//전체 경로
		//String savePath =path+"/"+fname;
		String savePath =path+System.getProperty("file.separator")+fname;
		// System.getProperty("file.separator")는 윈도우는 \ 리눅스는 /로 알아서 들어감.
		
		//이제 위의 경로를 가지고 java.io.File를 객체를 생성하자(이유는 파일의 존재여부를 확인하기 위해서다.
		File f = new File(savePath);
		//같은 이름이 있을 경우 파일명 뒤에 숫자를 붙여줘야 한다.(int형 변수 필요)
				int idx = 1;
				while(f.exists()) {
					//같은 이름의 파일이 있는 경우!! 파일명 뒤에 숫자를 붙여 파일명을 변경함!
					StringBuffer sb = new StringBuffer();
					sb.append(name);
					sb.append(idx++);
					sb.append(suffix);
					
					fname = sb.toString(); // test1.txt;
					
					savePath = path+System.getProperty("file.separator")+fname;
					
					f = new File(savePath);
				}
				
				return fname;
			}

		}
