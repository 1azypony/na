package com.na.user.product.model.vo;

import java.sql.Date;

public class Product {

	private int proNo;				//	PRO_NO	NUMBER
	private String proName;			//	PRO_NAME	VARCHAR2(120 BYTE)
	private int price;				//	PRO_PRICE	NUMBER
	private int stock;				//	PRO_STOCK	NUMBER
	private String proEff;			//	PRO_EFFICACY	VARCHAR2(300 BYTE)
	private String proDes;			//	PRO_DESCRIPTION	VARCHAR2(3000 BYTE)
	private	String proImgPath;			//	PRO_IMG_PATH	VARCHAR2(150 BYTE)
	private String proDate;			//	PRO_ENROLL_DATE	DATE
	private String status;			//	PRO_STATUS	VARCHAR2(1 BYTE)
	public Product() {
		super();
	}
	public Product(int proNo, String proName, int price, int stock, String proEff, String proDes, String proImgPath,
			String proDate, String status) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.stock = stock;
		this.proEff = proEff;
		this.proDes = proDes;
		this.proImgPath = proImgPath;
		this.proDate = proDate;
		this.status = status;
	}
	

	public Product(int proNo, String proName, int price, String proEff, String proImgPath) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.proEff = proEff;
		this.proImgPath = proImgPath;
	}	
	
	public int getProNo() {
		return proNo;
	}
	public Product(int proNo, String proName, int price, String proEff, String proDes, String proImgPath) {
	super();
	this.proNo = proNo;
	this.proName = proName;
	this.price = price;
	this.proEff = proEff;
	this.proDes = proDes;
	this.proImgPath = proImgPath;
}
	
	
	public Product(int proNo, String proName, int price, int stock, String proImgPath, String proDate, String status) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.stock = stock;
		this.proImgPath = proImgPath;
		this.proDate = proDate;
		this.status = status;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getProEff() {
		return proEff;
	}
	public void setProEff(String proEff) {
		this.proEff = proEff;
	}
	public String getProDes() {
		return proDes;
	}
	public void setProDes(String proDes) {
		this.proDes = proDes;
	}
	public String getProImgPath() {
		return proImgPath;
	}
	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}
	public String getProDate() {
		return proDate;
	}
	public void setProDate(String proDate) {
		this.proDate = proDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Product [proNo=" + proNo + ", proName=" + proName + ", price=" + price + ", stock=" + stock
				+ ", proEff=" + proEff + ", proDes=" + proDes + ", proImgPath=" + proImgPath + ", proDate=" + proDate
				+ ", status=" + status + "]";
	}
	
	
	
}
