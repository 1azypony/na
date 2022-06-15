package com.na.admin.review.model.dao;

import static com.na.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.na.template.model.vo.PageInfo;

import com.na.user.review.model.vo.Review;


public class ReviewDao {
	
private Properties prop = new Properties();
	
	public ReviewDao() { //기본 생성자
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	// review 현재 게시글 갯수	
	public int selectListCount(Connection conn) {
			
			// SELECT 문 => ResultSet 객체 ( 한개의 행)
			
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectListCountad");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					listCount = rset.getInt("COUNT");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				
			    close(rset);
				close(pstmt);
			}
			
			return listCount;	
		}
	  
	//review 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
	public ArrayList<Review> selectList(Connection conn,PageInfo pi){
		
		// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
		
		ArrayList<Review> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectreviewListad");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow +pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
	        
			while(rset.next()) {
				 
				list.add(new Review(rset.getInt("REVIEW_NO")
				          ,rset.getString("REVIEW_TITLE")
				          ,rset.getString("MEM_ID")
				          ,rset.getString("D1")
				          ,rset.getInt("REVIEW_COUNT")));		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		   
			close(rset);
			close(pstmt);
			
		}
		 return list;	
	}
	//review 상세보기용 
			public Review selectReview(Connection conn,int revNo) {
				
				// SELECT문=> ResultSet객체 (한행 조회)
				
				Review r = null;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectReviewad");
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, revNo);
					
					rset = pstmt.executeQuery();
					
				    if(rset.next()) {
				    	
				    	r = new Review();
				
				    	r.setRevNo(rset.getInt("REVIEW_NO"));
				    	r.setRevTitle(rset.getString("REVIEW_TITLE"));
				    	r.setUserId(rset.getString("MEM_ID"));
				    	r.setRevDate(rset.getString("D1"));
				    	r.setRevDes(rset.getString("REVIEW_DESCRIPTION"));
				    
				    		    	
				    }
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				
				return r;	
			}  	
	
			
			
			
	// review 삭제
	public int deleteReview(Connection conn, int revNo) {
		
		 // UPDATE 문 => int (처리된 행의 갯수)
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, revNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			 return result;		
		}	
 //검색어
	public int selectListCount(Connection conn,String keyword) {
		
		// SELECT 문 => ResultSet 객체 ( 한개의 행)
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCountad");
		
		
		try {
			String addName = "%"+keyword+"%";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, addName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		    close(rset);
			close(pstmt);
		}
		
		return listCount;	
	}
	
	public int selectListCount2(Connection conn, String keyword) {
		
		// SELECT 문 => ResultSet 객체 ( 한개의 행)
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearchListCountad2");
		
		
		try {
			String addName = "%"+keyword+"%";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, addName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		    close(rset);
			close(pstmt);
		}
		
		return listCount;	
	}
	//review 검색 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
		public ArrayList<Review> searchList(Connection conn,PageInfo pi,String keyword){
			
			// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
			
			ArrayList<Review> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("searchReviewListad");
			
			try {
				String addName = "%"+keyword+"%";
				pstmt = conn.prepareStatement(sql);
				
				
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow +pi.getBoardLimit() -1 ;

				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				pstmt.setString(1, addName);
				
				rset = pstmt.executeQuery();
		        
				while(rset.next()) {
					 
					list.add(new Review(rset.getInt("REVIEW_NO")
					          ,rset.getString("REVIEW_TITLE")
					          ,rset.getString("MEM_ID")
					          ,rset.getString("D1")
					          ,rset.getInt("REVIEW_COUNT")));		
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
			   
				close(rset);
				close(pstmt);
				
			}
			 return list;	
		}
		
		public ArrayList<Review> searchList2(Connection conn,PageInfo pi,String keyword){
			
			// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
			
			ArrayList<Review> list = new ArrayList<>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("searchReviewListad2");
			
			try {
				String addName = "%"+keyword+"%";
				pstmt = conn.prepareStatement(sql);
				
				
				int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
				int endRow = startRow +pi.getBoardLimit() -1 ;
				
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				pstmt.setString(1, addName);
				
				rset = pstmt.executeQuery();
		        
				while(rset.next()) {
					 
					list.add(new Review(rset.getInt("REVIEW_NO")
					          ,rset.getString("REVIEW_TITLE")
					          ,rset.getString("MEM_ID")
					          ,rset.getString("D1")
					          ,rset.getInt("REVIEW_COUNT")));		
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
			   
				close(rset);
				close(pstmt);
				
			}
			 return list;	
		}
			
			
			
	
	
	
	
	

}
