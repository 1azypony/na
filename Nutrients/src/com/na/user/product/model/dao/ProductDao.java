package com.na.user.product.model.dao;
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
		
		String sql = prop.getProperty("selectListCount");
		
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
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectList2(Connection conn, PageInfo pi){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList2");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectList3(Connection conn, PageInfo pi){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList3");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public Product selectPro(Connection conn, int proNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPro");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
//				PRO_NO, PRO_NAME, PRO_PRICE, PRO_EFFICACY, PRO_DESCRIPTION, PRO_IMG_PATH 
				p = new Product(rset.getInt("PRO_NO")
							  , rset.getString("PRO_NAME")
							  , rset.getInt("PRO_PRICE")
							  , rset.getString("PRO_EFFICACY")
							  , rset.getString("PRO_DESCRIPTION")
							  , rset.getString("PRO_IMG_PATH")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;	
				
		
	}
	
	public int selectSearchListCount(Connection conn, String keyword) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
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
		
		String sql = prop.getProperty("selectSearchList");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectSearchList12(Connection conn, PageInfo pi, String keyword){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList12");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectSearchList13(Connection conn, PageInfo pi, String keyword){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList13");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public int selectSearchListCount2(Connection conn, String s1, int s2) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCount2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s1);
			
		    switch(s2){
	        case 1: 
	            pstmt.setInt(2, 10000); 
	            pstmt.setInt(3, 30000); 
	            break;
	        case 2: 
	            pstmt.setInt(2, 30000); 
	            pstmt.setInt(3, 50000); 
	            break;  
	        case 3: 
	            pstmt.setInt(2, 50000); 
	            pstmt.setInt(3, 70000); 
	            break;  
	        case 4: 
	            pstmt.setInt(2, 70000); 
	            pstmt.setInt(3, 100000);  
	            break;
		    }
			
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
	
	public ArrayList<Product> selectSearchList2(Connection conn, PageInfo pi, String s1, int s2){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList2");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s1);
			
		    switch(s2){
	        case 1: 
	            pstmt.setInt(2, 10000); 
	            pstmt.setInt(3, 30000); 
	            break;
	        case 2: 
	            pstmt.setInt(2, 30000); 
	            pstmt.setInt(3, 50000); 
	            break;  
	        case 3: 
	            pstmt.setInt(2, 50000); 
	            pstmt.setInt(3, 70000); 
	            break;  
	        case 4: 
	            pstmt.setInt(2, 70000); 
	            pstmt.setInt(3, 100000);  
	            break;
		    }
		    
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectSearchList21(Connection conn, PageInfo pi, String s1, int s2){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList21");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s1);
			
		    switch(s2){
	        case 1: 
	            pstmt.setInt(2, 10000); 
	            pstmt.setInt(3, 30000); 
	            break;
	        case 2: 
	            pstmt.setInt(2, 30000); 
	            pstmt.setInt(3, 50000); 
	            break;  
	        case 3: 
	            pstmt.setInt(2, 50000); 
	            pstmt.setInt(3, 70000); 
	            break;  
	        case 4: 
	            pstmt.setInt(2, 70000); 
	            pstmt.setInt(3, 100000);  
	            break;
		    }
		    
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}
	
	public ArrayList<Product> selectSearchList22(Connection conn, PageInfo pi, String s1, int s2){
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchList22");
		try {
			pstmt = conn.prepareStatement(sql);

			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, s1);
			
		    switch(s2){
	        case 1: 
	            pstmt.setInt(2, 10000); 
	            pstmt.setInt(3, 30000); 
	            break;
	        case 2: 
	            pstmt.setInt(2, 30000); 
	            pstmt.setInt(3, 50000); 
	            break;  
	        case 3: 
	            pstmt.setInt(2, 50000); 
	            pstmt.setInt(3, 70000); 
	            break;  
	        case 4: 
	            pstmt.setInt(2, 70000); 
	            pstmt.setInt(3, 100000);  
	            break;
		    }
		    
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Product(rset.getInt("PRO_NO")
								 , rset.getString("PRO_NAME")
						         , rset.getInt("PRO_PRICE")
						         , rset.getString("PRO_EFFICACY")
						         , rset.getString("PRO_IMG_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
		
		
	}

}
