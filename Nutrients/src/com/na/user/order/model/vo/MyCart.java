package com.na.user.order.model.vo;

public class MyCart {
	
	private int cartNo;			//CART_NO NUMBER PRIMARY KEY,                 -- 장바구니 번호
	private int cartProNum;		//CART_AMOUNT NUMBER NOT NULL,                -- 장바구니 제품개수  
	private int userNo;			//MEM_NO NUMBER REFERENCES MEMBER(MEM_NO),    -- 회원번호
	private int proNo;			//PRO_NO NUMBER REFERENCES PRODUCT(PRO_NO) 	  -- 제품번호
	
	private String proName; 
	private String proEffi;
	private String proImgPath;
	private String cartAmount;
	private String totalPrice;
	private String userName;
	private String userEmail;
	private String proPrice;
	
	
	public MyCart() {
		super();
	}

	public MyCart(int cartNo, int cartProNum, int userNo, int proNo) {
		super();
		this.cartNo = cartNo;
		this.cartProNum = cartProNum;
		this.userNo = userNo;
		this.proNo = proNo;
	}

	
	public MyCart(int cartNo,String proName, String proEffi, String proImgPath, String cartAmount, String totalPrice) {
		super();
		this.cartNo = cartNo;
		this.proName = proName;
		this.proEffi = proEffi;
		this.proImgPath = proImgPath;
		this.cartAmount = cartAmount;
		this.totalPrice = totalPrice;
	}

	public MyCart(int cartNo, int cartProNum, int userNo, int proNo, String proName, String proEffi, String proImgPath,
			String cartAmount) {
		super();
		this.cartNo = cartNo;
		this.cartProNum = cartProNum;
		this.userNo = userNo;
		this.proNo = proNo;
		this.proName = proName;
		this.proEffi = proEffi;
		this.proImgPath = proImgPath;
		this.cartAmount = cartAmount;
	}


	public MyCart(int cartNo, String proName, String proEffi, String proImgPath,
			String cartAmount, String totalPrice, String userName, String userEmail, String proPrice) {
		super();
		this.cartNo = cartNo;
		this.proName = proName;
		this.proEffi = proEffi;
		this.proImgPath = proImgPath;
		this.cartAmount = cartAmount;
		this.totalPrice = totalPrice;
		this.userName = userName;
		this.userEmail = userEmail;
		this.proPrice = proPrice;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartProNum() {
		return cartProNum;
	}

	public void setCartProNum(int cartProNum) {
		this.cartProNum = cartProNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProEffi() {
		return proEffi;
	}

	public void setProEffi(String proEffi) {
		this.proEffi = proEffi;
	}

	public String getProImgPath() {
		return proImgPath;
	}

	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}

	public String getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(String cartAmount) {
		this.cartAmount = cartAmount;
	}
	

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getProPrice() {
		return proPrice;
	}

	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}

	@Override
	public String toString() {
		return "MyCart [cartNo=" + cartNo + ", cartProNum=" + cartProNum + ", userNo=" + userNo + ", proNo=" + proNo
				+ ", proName=" + proName + ", proEffi=" + proEffi + ", proImgPath=" + proImgPath + ", cartAmount="
				+ cartAmount + ", totalPrice=" + totalPrice + ", userName=" + userName + ", userEmail=" + userEmail
				+ "]";
	}
	
}
