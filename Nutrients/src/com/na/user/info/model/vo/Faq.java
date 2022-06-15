package com.na.user.info.model.vo;

public class Faq {
	
	private int faqNo;				//	FAQ_NO	NUMBER
	private String faqTitle;		//	FAQ_TITLE	VARCHAR2(150 BYTE)
	private String faqDes;			//	FAQ_DESCRIPTION	VARCHAR2(3000 BYTE)
	private String status;			//	FAQ_STATUS	VARCHAR2(3 BYTE)
	public Faq() {
		super();
	}
	public Faq(int faqNo, String faqTitle, String faqDes, String status) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqDes = faqDes;
		this.status = status;
	}
	
	public Faq(int faqNo, String faqTitle) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqDes() {
		return faqDes;
	}
	public void setFaqDes(String faqDes) {
		this.faqDes = faqDes;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqDes=" + faqDes + ", status=" + status + "]";
	}
	
	
	
}
