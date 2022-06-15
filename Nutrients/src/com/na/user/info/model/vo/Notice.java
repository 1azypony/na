package com.na.user.info.model.vo;

public class Notice {

	private int notiNo;			//	NOTI_NO	NUMBER
	private String notiTitle;			//	NOTI_TITLE	VARCHAR2(150 BYTE)
	private String notiDes;			//	NOTI_DESCRIPTION	VARCHAR2(1500 BYTE)
	private String notiDate;			//	NOTI_DATE	DATE
	private String status;			//	NOTI_STATUS	VARCHAR2(3 BYTE)
	
	public Notice() {
		super();
	}
	
	public Notice(int notiNo, String notiTitle, String notiDate) {
		super();
		this.notiNo = notiNo;
		this.notiTitle = notiTitle;
		this.notiDate = notiDate;
	}
	

	public Notice(int notiNo, String notiTitle, String notiDate, String status) {
		super();
		this.notiNo = notiNo;
		this.notiTitle = notiTitle;
		this.notiDate = notiDate;
		this.status = status;
	}

	public Notice(int notiNo, String notiTitle, String notiDes, String notiDate, String status) {
		super();
		this.notiNo = notiNo;
		this.notiTitle = notiTitle;
		this.notiDes = notiDes;
		this.notiDate = notiDate;
		this.status = status;
	}
	public int getNotiNo() {
		return notiNo;
	}
	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public String getNotiDes() {
		return notiDes;
	}
	public void setNotiDes(String notiDes) {
		this.notiDes = notiDes;
	}
	public String getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(String notiDate) {
		this.notiDate = notiDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Notice [notiNo=" + notiNo + ", notiTitle=" + notiTitle + ", notiDes=" + notiDes + ", notiDate="
				+ notiDate + ", status=" + status + "]";
	}
	
	
	
}
