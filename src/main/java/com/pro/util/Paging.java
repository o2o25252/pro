package com.pro.util;

public class Paging {
	
	private int nowPage, totalPage, begin, end , blocklist//한 페이지당 표현할 게시물수 
	, blockpage//한블럭당  보여질 페이지 수 
	, rowtotal //총게시물 수
	,startPage,endPage; // 블럭의 시작과 끝
	
	private boolean isPrePage; //이전 페이지로 
	private boolean isNextPage;//다음 페이지 기능 
	
	//JSP에서 표현할 페이징 HTML 코드를 저장할 곳! 
	
	private StringBuffer sb ;
	
	//생성자 생성
	public Paging(int nowPage, int blocklist, int blockpage, int rowtotal) {
		super();
		this.nowPage = nowPage;
		this.blocklist = blocklist;
		this.blockpage = blockpage;
		this.rowtotal = rowtotal;
		
		MakeHTML();
	} 
	
	public void MakeHTML() {
		//이전 기능과 다음 기능을 초기화 시킨다. 
		isPrePage = false;
		isNextPage = false;
		
		//입력된 전체 게시물의 수를 통해
		//전체 페이지 수를 구한다. 
		totalPage =(int)Math.ceil((double)rowtotal/blocklist);
		
		//현재 페이지의 값이 전체 페이지의 값보다
		//크다면 전체 페이지 값을 현재 페이지 값으로 지정 
		if(nowPage > totalPage)
			nowPage = totalPage;
		//현재 블럭의 시작페이지 값과 마지막 페이지 값을 구한다.
		startPage = (int)((nowPage-1)/blockpage)*blockpage+1;
		endPage = startPage+blockpage-1;
		
		//마지막 페이지 값이 전체 페이지 값보다 클떄 
		if(endPage> totalPage)
			endPage = totalPage;
		
		//현재 페이지 값에 의해서 시작 게시물의 행번호(begin)와
		//마지막 겟ㅣ물의 행번호(end)를 지정한다.
		begin =(int)(nowPage-1)/blocklist+1;
		end = begin+blocklist-1;
		
		
		//이전 기능 가능여부 확인 
		if(startPage > 1)
			isPrePage = true;
		//다은 기능 가능여부 확인
		if(endPage < totalPage)
			isNextPage = true;
		
		//이제 현재페이지 값도 알고, 시작페이지와
		//미자믹 페이지 값을 알았으니 페이지 기법에 사용할 코드를
		//작성하여 StringBuffer에 저장하자!
		sb = new StringBuffer("<ol class='paging'>");
		
		//이전 버튼 활성화 되어있을때 링크 
		if(isPrePage) {
			sb.append("<li><a href='list.inc?nowPage=");
			sb.append(nowPage-blockpage);
			sb.append("'> &lt; </a></li>");
		}else {
			//비활성화
			sb.append("<li class='disable'> &lt; </li>");
		}
		
		//페이지 번호 출력하는 반복문 
		for(int i=startPage; i<=endPage; i++) { // 블락 페이지 마지막 부분까지 표현 하는 반복분
			//i 의 가 현재 페이지 값과  같을때 비활성화 
			if(i == nowPage) {
				sb.append("<li class='now'>");
				sb.append(i);
				sb.append("</li>");
			}else {
				sb.append("<li><a href='notice.inc?nowPage=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
			}
		}//for 
		
		
		//페이지 다음 으로 가능 기능 여부 확인 
		if(isNextPage) {
			//활성화
			
			sb.append("<li><a href='list.inc?nowPage=");
			sb.append(nowPage+blockpage);
			sb.append("'> &gt' </a></li>");
		}else {
			sb.append("<li class='disable'> &gt;</li>");
		}
		
			sb.append("</ol>");
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBlocklist() {
		return blocklist;
	}

	public void setBlocklist(int blocklist) {
		this.blocklist = blocklist;
	}

	public int getBlockpage() {
		return blockpage;
	}

	public void setBlockpage(int blockpage) {
		this.blockpage = blockpage;
	}

	public int getRowtotal() {
		return rowtotal;
	}

	public void setRowtotal(int rowtotal) {
		this.rowtotal = rowtotal;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrePage() {
		return isPrePage;
	}

	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	
	
	
	
}
