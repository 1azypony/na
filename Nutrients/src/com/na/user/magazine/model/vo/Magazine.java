package com.na.user.magazine.model.vo;

import java.sql.Date;

public class Magazine {
	
	private int magNo;	// MAGAZINE_NO	NUMBER
	private String magTitle;	// MAGAZINE_TITLE	VARCHAR2(150 BYTE)
	private String magDes;	// MAGAZINE_DESCRIPTION	VARCHAR2(3000 BYTE)
	private String magDate;	// MAGAZINE_DATE	DATE
	private int count;	// MAGAZINE_VIEWS	NUMBER
	private String magImgPath;	// MAGAZINE_IMG_PATH	VARCHAR2(150 BYTE)
	private String status;	// MAGAZINE_STATUS	VARCHAR2(3 BYTE)
	
	
	public Magazine() {
		super();
	}


	public Magazine(int magNo, String magTitle, String magDes, String magDate, int count, String magImgPath,
			String status) {
		super();
		this.magNo = magNo;
		this.magTitle = magTitle;
		this.magDes = magDes;
		this.magDate = magDate;
		this.count = count;
		this.magImgPath = magImgPath;
		this.status = status;
	}
	
	
	// 매거진 게시판 리스트 조회용 생성자
	public Magazine(int magNo, String magTitle, String magDate, int count, String magImgPath) {
		super();
		this.magNo = magNo;
		this.magTitle = magTitle;
		this.magDate = magDate;
		this.count = count;
		this.magImgPath = magImgPath;
		
	}

	
	// 매거진 상세 조회용 생성자 
	public Magazine(int magNo, String magTitle, String magDes, String magDate, int count, String magImgPath) {
		super();
		this.magNo = magNo;
		this.magTitle = magTitle;
		this.magDes = magDes;
		this.magDate = magDate;
		this.count = count;
		this.magImgPath = magImgPath;
	}
	
	// 관리자 리스트 조회
	
		public Magazine(int magNo, String magTitle, String magDate) {
			super();
			this.magNo = magNo;
			this.magTitle = magTitle;
			this.magDate = magDate;
		}


	public int getMagNo() {
		return magNo;
	}



	public void setMagNo(int magNo) {
		this.magNo = magNo;

	}


	public String getMagTitle() {
		return magTitle;
	}


	public void setMagTitle(String magTitle) {
		this.magTitle = magTitle;
	}


	public String getMagDes() {
		return magDes;
	}


	public void setMagDes(String magDes) {
		this.magDes = magDes;
	}


	public String getMagDate() {
		return magDate;
	}


	public void setMagDate(String magDate) {
		this.magDate = magDate;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getMagImgPath() {
		return magImgPath;
	}


	public void setMagImgPath(String magImgPath) {
		this.magImgPath = magImgPath;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Magazine [magNo=" + magNo + ", magTitle=" + magTitle + ", magDes=" + magDes + ", magDate=" + magDate
				+ ", count=" + count + ", magImgPath=" + magImgPath + ", status=" + status + "]";
	}

	
	
	
}
