package com.na.admin.product.model.service;
import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.admin.product.model.dao.ProductDao;
import com.na.user.product.model.vo.Product;

public class ProductService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new ProductDao().selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
		
	}
	
	public int selectSearchListCount(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new ProductDao().selectSearchListCount(conn, keyword);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> selectSearchList(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList(conn, pi, keyword);
		
		close(conn);
		
		return list;
		
		
	}
	
	public Product selectProDetail(int proNo) {
		
		Connection conn = getConnection();
		Product p = new ProductDao().selectProDetail(conn, proNo);
		
		close(conn);
		
		return p;
		
		
		
		
	}
	
	public int insertProduct(Product p) {
		
		Connection conn = getConnection();
		int result = new ProductDao().insertProduct(conn, p);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int updateProduct1(Product p) {
		
		Connection conn = getConnection();
		int result = new ProductDao().updateProduct1(conn, p);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int updateProduct2(Product p) {
		
		Connection conn = getConnection();
		int result = new ProductDao().updateProduct2(conn, p);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	public int deleteProductAdmin(int proNo) {
		
		Connection conn = getConnection();
		int result = new ProductDao().deleteProductAdmin(conn, proNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}

}
