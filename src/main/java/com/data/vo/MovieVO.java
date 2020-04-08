package com.data.vo;

import java.util.List;

public class MovieVO {
	private String movieCd,				// 영화코드를 출력합니다.
				   movieNm,				// 영화명(국문)을 출력합니다.
				   movieNmEn,			// 영화명(영문)을 출력합니다.
				   movieNmOg,			// 영화명(원문)을 출력합니다.
				   prdtYear,			// 제작연도를 출력합니다.
				   showTm,				// 상영시간을 출력합니다.
				   openDt,				// 개봉연도를 출력합니다.
				   prdtStatNm,			// 제작상태명을 출력합니다.
				   typeNm,				// 영화유형명을 출력합니다.
				   
//				   nations,				// 제작국가를 나타냅니다.
				   nationNm,			// 제작국가명을 출력합니다.
				   genreNm,				// 장르명을 출력합니다.
				   directors_peopleNm,		// 감독명을 출력합니다.
				   directors_peopleNmEn,	// 감독명(영문)을 출력합니다.
				   companys,			// 참여 영화사를 나타냅니다.
				   companyCd,			// 참여 영화사 코드를 출력합니다.
				   companyNm,			// 참여 영화사명을 출력합니다.
				   companyNmEn,			// 참여 영화사명(영문)을 출력합니다.
				   companyPartNm,		// 참여 영화사 분야명을 출력합니다.
				   postURL,				// 영화 포스터 썸네일 URL
				   nRating;				// naver 영화 평점
	
	List<StarVO> s_list; 
	
	public List<StarVO> getS_list() {
		return s_list;
	}

	public void setS_list(List<StarVO> s_list) {
		this.s_list = s_list;
	}

	public String getPostURL() {
		return postURL;
	}

	public void setPostURL(String postURL) {
		this.postURL = postURL;
	}

	private ActorsVO[] avo;

	public ActorsVO[] getAvo() {
		return avo;
	}

	public void setAvo(ActorsVO[] avo) {
		this.avo = avo;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getMovieNmEn() {
		return movieNmEn;
	}

	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}

	public String getMovieNmOg() {
		return movieNmOg;
	}

	public void setMovieNmOg(String movieNmOg) {
		this.movieNmOg = movieNmOg;
	}

	public String getPrdtYear() {
		return prdtYear;
	}

	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}

	public String getShowTm() {
		return showTm;
	}

	public void setShowTm(String showTm) {
		this.showTm = showTm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getPrdtStatNm() {
		return prdtStatNm;
	}

	public void setPrdtStatNm(String prdtStatNm) {
		this.prdtStatNm = prdtStatNm;
	}

	public String getTypeNm() {
		return typeNm;
	}

	public void setTypeNm(String typeNm) {
		this.typeNm = typeNm;
	}

	public String getNationNm() {
		return nationNm;
	}

	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}

	public String getGenreNm() {
		return genreNm;
	}

	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}

	public String getDirectors_peopleNm() {
		return directors_peopleNm;
	}

	public void setDirectors_peopleNm(String directors_peopleNm) {
		this.directors_peopleNm = directors_peopleNm;
	}

	public String getDirectors_peopleNmEn() {
		return directors_peopleNmEn;
	}

	public void setDirectors_peopleNmEn(String directors_peopleNmEn) {
		this.directors_peopleNmEn = directors_peopleNmEn;
	}

	public String getCompanys() {
		return companys;
	}

	public void setCompanys(String companys) {
		this.companys = companys;
	}

	public String getCompanyCd() {
		return companyCd;
	}

	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
	}

	public String getCompanyNm() {
		return companyNm;
	}

	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}

	public String getCompanyNmEn() {
		return companyNmEn;
	}

	public void setCompanyNmEn(String companyNmEn) {
		this.companyNmEn = companyNmEn;
	}

	public String getCompanyPartNm() {
		return companyPartNm;
	}

	public void setCompanyPartNm(String companyPartNm) {
		this.companyPartNm = companyPartNm;
	}

	public String getnRating() {
		return nRating;
	}

	public void setnRating(String nRating) {
		this.nRating = nRating;
	}
}
