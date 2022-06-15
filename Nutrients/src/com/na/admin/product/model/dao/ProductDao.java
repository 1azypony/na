package com.na.admin.product.model.dao;
import static com.na.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.na.template.model.vo.PageInfo;
import com.na.user.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {

		String fileName = ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
				
		try {
			prop.loadFromXML(new FileInputStream(fileName));
					
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;		
		
		
	}
	
	public ArrayList<Product> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAdmin");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
//			PRO_NO, PRO_NAME, PRO_PRICE, PRO_STOCK, PRO_IMG_PATH, TO_CHAR(PRO_ENROLL_DATE, 'YYYYMMDD') D, PRO_STATUS
			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getInt("PRO_STOCK")
						         , rset.getString("PRO_IMG_PATH")
						         , rset.getString("D")
						         , rset.getString("PRO_STATUS")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;	
		
		
	}
	
	public int selectSearchListCount(Connection conn, String keyword) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCountAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;		
		
		
	}
	
	public ArrayList<Product> selectSearchList(Connection conn, PageInfo pi, String keyword){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListAdmin");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
						 , rset.getString("PRO_NAME")
				         , rset.getInt("PRO_PRICE")
				         , rset.getInt("PRO_STOCK")
				         , rset.getString("PRO_IMG_PATH")
				         , rset.getString("D")
				         , rset.getString("PRO_STATUS")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public Product selectProDetail(Connection conn, int proNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			rset = pstmt.executeQuery();
//			PRO_NO, PRO_NAME, PRO_PRICE, PRO_STOCK, PRO_EFFICACY, PRO_DESCRIPTION, PRO_IMG_PATH, TO_CHAR(PRO_ENROLL_DATE, 'YYYYMMDD') D , PRO_STATUS 
			if(rset.next()) {
				p = new Product(
						rset.getInt(1)
					  , rset.getString(2)
					  , rset.getInt(3)
					  , rset.getInt(4)
					  , rset.getString(5)
					  , rset.getString(6)
					  , rset.getString(7)
					  , rset.getString(8)
					  , rset.getString(9));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
		
	}
	
	public int insertProduct(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
//	PRO_NAME, PRO_PRICE, PRO_STOCK, PRO_EFFICACY, PRO_DESCRIPTION, PRO_IMG_PATH, PRO_ENROLL_DATE, PRO_STATUS
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getStock());
			pstmt.setString(4, p.getProEff());
			pstmt.setString(5, p.getProDes());
			pstmt.setString(6, p.getProImgPath());
			pstmt.setString(7, p.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int updateProduct1(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct1");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getStock());
			pstmt.setString(4, p.getProEff());
			pstmt.setString(5, p.getProDes());
			pstmt.setString(6, p.getProImgPath());
			pstmt.setString(7, p.getStatus());
			pstmt.setInt(8, p.getProNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int updateProduct2(Connection conn, Product p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct2");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProName());
			pstmt.setInt(2, p.getPrice());
			pstmt.setInt(3, p.getStock());
			pstmt.setString(4, p.getProEff());
			pstmt.setString(5, p.getProDes());
			pstmt.setString(6, p.getStatus());
			pstmt.setInt(7, p.getProNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int deleteProductAdmin(Connection conn, int proNo){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProductAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
		
	}
}
