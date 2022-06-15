package com.na.admin.info.model.dao;


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
import com.na.user.info.model.vo.Faq;
import com.na.user.info.model.vo.Notice;


public class FaqDao {

private Properties prop = new Properties();
	
	public FaqDao() { //기본 생성자
		
		try {
			prop.loadFromXML(new FileInputStream(FaqDao.class.getResource("/sql/info/info-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

// faq 현재 게시글 갯수
public int selectListCount(Connection conn) {
	// SELECT 문 => ResultSet 객체 ( 한개의 행)
	
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectListCount");
			
			
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
//현재 사용자가 요청한 페이지에 보여질 게시글 리스트 	
public ArrayList<Faq> selectList(Connection conn){
	
	// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
	
	ArrayList<Faq> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectfaqList");
	
	try {
		pstmt = conn.prepareStatement(sql);
				
		rset = pstmt.executeQuery();
        
		while(rset.next()) {
			 
			list.add(new Faq(rset.getInt("FAQ_NO")
					          ,rset.getString("FAQ_TITLE")));
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
	   
		close(rset);
		close(pstmt);
		
	}
	 return list;	
}

// faq 상세보기용
public Faq selectFaq(Connection conn,int faqNo) {

	// SELECT문=> ResultSet객체 (한행 조회)
	
    Faq f = null;
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectFaq");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, faqNo);
		
		rset = pstmt.executeQuery();
		
	    if(rset.next()) {
	    	
	    	f = new Faq();
	    	f.setFaqNo(rset.getInt("FAQ_NO"));
	    	f.setFaqTitle(rset.getString("FAQ_TITLE"));
	    	f.setFaqDes(rset.getString("FAQ_DESCRIPTION"));
	    	
	    	
	    }
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	
	return f;	
}
//공지사항 삭제
public int deleteFaq(Connection conn, int faqNo) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, faqNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		 return result;		

 }	
//저장
public int insertFaq(Connection conn, Faq f) {
	
	 //필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");	

		try {
			//preparedStatement  객체 생성 => 미리 넘김
			pstmt = conn.prepareStatement(sql);
			// 미완성된 쿼리문 완성시키기
			pstmt.setString(1,f.getFaqTitle());
			pstmt.setString(2,f.getFaqDes());
			
			//쿼리문 실행후 결과 받기
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
			
	 }	
public int countF(Connection conn) {
	int count = 0;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("countF");	

	try {
		//preparedStatement  객체 생성 => 미리 넘김
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			count = rset.getInt(1);
		}
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	return count;
	
}
	
	
	
	
	
	
	
	
	
	
	
	
}




















	
	

