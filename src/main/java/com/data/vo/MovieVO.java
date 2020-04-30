package com.data.vo;

import java.util.List;

public class MovieVO {
	private String movieCd,             // 영화코드를 출력합니다.
					movieNm,            // 영화명(국문)을 출력합니다.
					movieNmEn,          // 영화명(영문)을 출력합니다.
					movieNmOg,          // 영화명(원문)을 출력합니다.
					prdtYear,           // 제작연도를 출력합니다.
					showTm,             // 상영시간을 출력합니다.
					openDt,             // 개봉연도를 출력합니다.
					prdtStatNm,         // 제작상태명을 출력합니다.
					typeNm,             // 영화유형명을 출력합니다.
					watchGradeNm,       // 관람등급을 출력합니다.
					nationNm,           // 제작국가명을 출력합니다.
					genreNm,            // 장르명을 출력합니다.
					directors, 			// 감독명을 출력합니다.
					postURL,            // 영화 포스터 썸네일 URL
					nRating,            // naver 영화 평점
					hRating;            // 홈페이지 평점
	private String story, storyCon, actors;

	List<StarVO> s_list; 

	private ActorsVO[] avo;
	private String[] companyNm;
	private String[] companyPartNm;

	public String[] getCompanyNm() {
		return companyNm;
	}

	public void setCompanyNm(String[] companyNm) {
		this.companyNm = companyNm;
	}

	public String[] getCompanyPartNm() {
		return companyPartNm;
	}

	public void setCompanyPartNm(String[] companyPartNm) {
		this.companyPartNm = companyPartNm;
	}
	
	public List<StarVO> getS_list() {
		return s_list;
	}

	public void setS_list(List<StarVO> s_list) {
		this.s_list = s_list;
	}
	
	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getStoryCon() {
		return storyCon;
	}

	public void setStoryCon(String storyCon) {
		this.storyCon = storyCon;
	}
	public String getPostURL() {
		return postURL;
	}

	public void setPostURL(String postURL) {
		this.postURL = postURL;
	}

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

	public String getnRating() {
		return nRating;
	}

	public void setnRating(String nRating) {
		this.nRating = nRating;
	}

	public String getWatchGradeNm() {
		return watchGradeNm;
	}

	public void setWatchGradeNm(String watchGradeNm) {
		this.watchGradeNm = watchGradeNm;
	}

	public String gethRating() {
		return hRating;
	}

	public void sethRating(String hRating) {
		this.hRating = hRating;
	}

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}
}
