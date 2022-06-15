package com.na.user.product.model.service;
import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.user.product.model.dao.ProductDao;
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
	
	public ArrayList<Product> selectList2(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList2(conn, pi);
		
		close(conn);
		
		return list;
		
		
	}
	
	public ArrayList<Product> selectList3(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList3(conn, pi);
		
		close(conn);
		
		return list;
		
		
	}
	
	public Product selectPro(int proNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectPro(conn, proNo);
		close(conn);
		return p;
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
	
	public ArrayList<Product> selectSearchList12(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList12(conn, pi, keyword);
		
		close(conn);
		
		return list;
		
		
	}
	
	public ArrayList<Product> selectSearchList13(PageInfo pi, String keyword){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList13(conn, pi, keyword);
		
		close(conn);
		
		return list;
		
		
	}
	
	public int selectSearchListCount2(String s1, int s2) {
		
		Connection conn = getConnection();
		int listCount = new ProductDao().selectSearchListCount2(conn, s1, s2);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Product> selectSearchList2(PageInfo pi, String s1, int s2){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList2(conn, pi, s1, s2);
		
		close(conn);
		
		return list;
		
		
	}
	
	public ArrayList<Product> selectSearchList21(PageInfo pi, String s1, int s2){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList21(conn, pi, s1, s2);
		
		close(conn);
		
		return list;
		
		
	}
	
	public ArrayList<Product> selectSearchList22(PageInfo pi, String s1, int s2){
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectSearchList22(conn, pi, s1, s2);
		
		close(conn);
		
		return list;
		
		
	}
}
