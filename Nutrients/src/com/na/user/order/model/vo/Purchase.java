package com.na.user.order.model.vo;

public class Purchase {
	
	private int purNo;		//PUR_NO NUMBER PRIMARY KEY,                  -- 구매번호
	private String purDate;	//PUR_DATE DATE DEFAULT SYSDATE,              -- 구매날짜
	private String status;	//PUR_STATUS VARCHAR2(30) DEFAULT '주문완료',   -- 구매상태
	private String address;	//PUR_ADDRESS VARCHAR2(100) NOT NULL,         -- 배송지
	private int userNo;		//MEM_NO NUMBER REFERENCES MEMBER(MEM_NO),    -- 회원번호
	private int proNo;		//PRO_NO NUMBER REFERENCES PRODUCT(PRO_NO)    -- 제품번호
	
	private String imgPath;
	private String proName;
	private String proEffi;
	private String pdate;
	private String totprice;
	private String price;
	private int cartAmount;
	private String cartNo;
	
	public Purchase() {
		super();
	}

	public Purchase(int purNo, String purDate, String status, String address, int userNo, int proNo) {
		super();
		this.purNo = purNo;
		this.purDate = purDate;
		this.status = status;
		this.address = address;
		this.userNo = userNo;
		this.proNo = proNo;
	}
	
	public Purchase(String imgPath, String proName, String proEffi, String totprice, int cartAmount, String cartNo) {
		super();
		this.imgPath = imgPath;
		this.proName = proName;
		this.proEffi = proEffi;
		this.totprice = totprice;
		this.cartAmount = cartAmount;
		this.cartNo = cartNo;
	} 

	
	public Purchase(String imgPath, String proName, String proEffi, String pdate, String totprice, String status, 
			String price, String cartNo) {
		super();
		
		this.imgPath = imgPath;
		this.proName = proName;
		this.proEffi = proEffi;
		this.pdate = pdate;
		this.totprice = totprice;
		this.status = status;
		this.price = price;
		this.cartNo = cartNo;
	}

	public int getPurNo() {
		return purNo;
	}

	public void setPurNo(int purNo) {
		this.purNo = purNo;
	}

	public String getPurDate() {
		return purDate;
	}

	public void setPurDate(String purDate) {
		this.purDate = purDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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



	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getTotprice() {
		return totprice;
	}

	public void setTotprice(String totprice) {
		this.totprice = totprice;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	@Override
	public String toString() {
		return "Purchase [purNo=" + purNo + ", purDate=" + purDate + ", status=" + status + ", address=" + address
				+ ", userNo=" + userNo + ", proNo=" + proNo + ", imgPath=" + imgPath + ", proName=" + proName
				+ ", proEffi=" + proEffi + ", pdate=" + pdate + ", totprice=" + totprice + ", price=" + price
				+ ", cartAmount=" + cartAmount + "]";
	}

}

