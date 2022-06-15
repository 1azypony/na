package com.na.user.info.model.vo;

public class Qna {
private int inqNo;//	INQ_NO	NUMBER
private String inqTitle;//	INQ_TITLE	VARCHAR2(150 BYTE)
private String inqDate;//	INQ_DATE	DATE
private String inqQuery;//	INQ_QUERY	VARCHAR2(3000 BYTE)
private String inqAnswer;//	INQ_ANSWER	VARCHAR2(3000 BYTE)
private String status;//	INQ_STATUS	VARCHAR2(3 BYTE)
private String userNo;//	MEM_NO	NUMBER



public Qna() {
	super();
}


public Qna(int inqNo, String inqTitle, String userNo, String inqDate, String status) {
	super();
	this.inqNo = inqNo;
	this.inqTitle = inqTitle;
	this.userNo = userNo;
	this.inqDate = inqDate;
	this.status = status;
}


public Qna(int inqNo, String inqTitle, String inqDate, String inqQuery, String inqAnswer, String status, String userNo) {
	super();
	this.inqNo = inqNo;
	this.inqTitle = inqTitle;
	this.inqDate = inqDate;
	this.inqQuery = inqQuery;
	this.inqAnswer = inqAnswer;
	this.status = status;
	this.userNo = userNo;
}


public int getInqNo() {
	return inqNo;
}


public void setInqNo(int inqNo) {
	this.inqNo = inqNo;
}


public String getInqTitle() {
	return inqTitle;
}


public void setInqTitle(String inqTitle) {
	this.inqTitle = inqTitle;
}


public String getInqDate() {
	return inqDate;
}


public void setInqDate(String inqDate) {
	this.inqDate = inqDate;
}


public String getInqQuery() {
	return inqQuery;
}


public void setInqQuery(String inqQuery) {
	this.inqQuery = inqQuery;
}


public String getInqAnswer() {
	return inqAnswer;
}


public void setInqAnswer(String inqAnswer) {
	this.inqAnswer = inqAnswer;
}


public String getStatus() {
	return status;
}


public void setStatus(String status) {
	this.status = status;
}


public String getUserNo() {
	return userNo;
}


public void setUserNo(String userNo) {
	this.userNo = userNo;
}


@Override
public String toString() {
	return "Qna [inqNo=" + inqNo + ", inqTitle=" + inqTitle + ", inqDate=" + inqDate + ", inqQuery=" + inqQuery
			+ ", inqAnswer=" + inqAnswer + ", status=" + status + ", userNo=" + userNo + "]";
}



}
