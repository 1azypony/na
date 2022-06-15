package com.na.user.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;								//	회원번호
	private String userId;							//	회원아이디
	private String userPwd;							//	비밀번호
	private String userName;						//	회원이름
	private String gender;							//	성별
	private String birthDate;						//	생년월일
	private String email;							//	이메일
	private String address;							//	배송지
	private String marketing;						//	마케팅동의여부
	private String status;							//	회원상태
	private Date enrollDate;						//	회원가입일

	public Member() {
		super();
	}
	
	

	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}


	public Member(int userNo, String userId, String userPwd, String userName, String gender, String birthDate,
			String email, String address, String marketing, String status, Date enrollDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.email = email;
		this.address = address;
		this.marketing = marketing;
		this.status = status;
		this.enrollDate = enrollDate;
	}
	
	

	public Member(String userId, String userPwd, String userName, String gender, String birthDate, String email,
			String marketing) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.email = email;
		this.marketing = marketing;
	}
	
	



	public Member(int userNo, String userId, String userName, String email, String address) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.address = address;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMarketing() {
		return marketing;
	}

	public void setMarketing(String marketing) {
		this.marketing = marketing;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", gender=" + gender + ", birthDate=" + birthDate + ", email=" + email + ", address=" + address
				+ ", marketing=" + marketing + ", status=" + status + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
}
