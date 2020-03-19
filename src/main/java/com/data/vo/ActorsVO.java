package com.data.vo;

public class ActorsVO {
	private String peopleNm,		// 배우명을 출력합니다.
	   				peopleNmEn,		// 배우명(영문)을 출력합니다.
	   				cast,			// 배역명을 출력합니다.
	   				castEn;			// 배역명(영문)을 출력합니다.

	public String getPeopleNm() {
		return peopleNm;
	}

	public void setPeopleNm(String peopleNm) {
		this.peopleNm = peopleNm;
	}

	public String getPeopleNmEn() {
		return peopleNmEn;
	}

	public void setPeopleNmEn(String peopleNmEn) {
		this.peopleNmEn = peopleNmEn;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getCastEn() {
		return castEn;
	}

	public void setCastEn(String castEn) {
		this.castEn = castEn;
	}
}
