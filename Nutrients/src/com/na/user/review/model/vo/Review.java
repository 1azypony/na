package com.na.user.review.model.vo;

public class Review {
	
	// 필드부
	private int revNo;//-- 후기 번호
    private String revTitle;//-- 후기 제목
    private String revDes; //-- 후기 내용
    private String revDate;//-- 후기 작성일
    private int count;//-- 후기 조회수
    private String revPath;//-- 후기 사진경로
    private String status;//-- 후기 게시글 상태
    private int purNo;//-- 구매번호 --외래키 
    
    private String userId; 
    
    
    
    // 생성자부
	public Review() {
		super();
	}

	public Review(int revNo, String revTitle, String revDate, String userId) {
		super();
		this.revNo = revNo;
		this.revTitle = revTitle;
		this.revDate = revDate;
		this.userId = userId;
	}

	public Review(int revNo, String revTitle, String revDes, String revDate, int count, String revPath, String status,
			int purNo) {
		super();
		this.revNo = revNo;
		this.revTitle = revTitle;
		this.revDes = revDes;
		this.revDate = revDate;
		this.count = count;
		this.revPath = revPath;
		this.status = status;
		this.purNo = purNo;
	}
     // 고객전체 리뷰리스트 생성자
	public Review(int revNo, String revTitle,String userId, String revDate, int count) {
		this.revNo = revNo;
		this.revTitle = revTitle;
		this.userId = userId;
		this.revDate = revDate;
		this.count = count;
	}
	//썸네일..
	public Review(int revNo, String revPath,String revTitle,int count) {
		this.revNo = revNo;
		this.revPath = revPath;
		this.revTitle = userId;
		this.count = count;
	}
	
	
	
   // 메소드부
	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevDes() {
		return revDes;
	}

	public void setRevDes(String revDes) {
		this.revDes = revDes;
	}

	public String getRevDate() {
		return revDate;
	}

	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getRevPath() {
		return revPath;
	}

	public void setRevPath(String revPath) {
		this.revPath = revPath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPurNo() {
		return purNo;
	}

	public void setPurNo(int purNo) {
		this.purNo = purNo;
	}
	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", revTitle=" + revTitle + ", revDes=" + revDes + ", revDate=" + revDate
				+ ", count=" + count + ", revPath=" + revPath + ", status=" + status + ", purNo=" + purNo + ", userId="
				+ userId + "]";
	}

	


	
	
	
	
}
