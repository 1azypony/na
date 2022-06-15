package com.na.admin.info.model.dao;

import static com.na.template.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Notice;


public class NoticeDao {

private Properties prop = new Properties();
	
	public NoticeDao() { //기본 생성자
		
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/sql/info/info-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

// notice 현재 게시글 갯수	
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
  
//notice 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
public ArrayList<Notice> selectList(Connection conn,PageInfo pi){
	
	// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
	
	ArrayList<Notice> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow +pi.getBoardLimit() -1 ;
		
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		
		rset = pstmt.executeQuery();
        
		while(rset.next()) {
			 
			list.add(new Notice(rset.getInt("NOTI_NO")
					          ,rset.getString("NOTI_TITLE")
					          ,rset.getString("D1")));
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
	   
		close(rset);
		close(pstmt);
		
	}
	 return list;	
}
//notice 상세보기용 
public Notice selectNotice(Connection conn,int notiNo) {
	
	// SELECT문=> ResultSet객체 (한행 조회)
	
	Notice n = null;
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectNotice");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, notiNo);
		
		rset = pstmt.executeQuery();
		
	    if(rset.next()) {
	    	
	    	n = new Notice();
	    	n.setNotiNo(rset.getInt("NOTI_NO"));
	    	n.setNotiTitle(rset.getString("NOTI_TITLE"));
	    	n.setNotiDes(rset.getString("NOTI_DESCRIPTION"));
	    	n.setNotiDate(rset.getString("NOTI_DATE"));
	    	
	    }
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(pstmt);
	}
	
	return n;	
}
//공지사항 작성용 DAO
public int insertNotice(Connection conn, Notice n) {

 //필요한 변수 셋팅
	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("insertNotice");	
		
	try {
		//preparedStatement  객체 생성 => 미리 넘김
		pstmt = conn.prepareStatement(sql);
		// 미완성된 쿼리문 완성시키기
		pstmt.setString(1,n.getNotiTitle());
		pstmt.setString(2,n.getNotiDes());
		
		//쿼리문 실행후 결과 받기
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
	
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	return result;
		
 }
// 공지사항 삭제
public int deleteNotice(Connection conn, int noticeNo) {
	
	 // UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		 return result;		
	}
// 검색어
public int selectListCount(Connection conn, String keyword) {
	
	// SELECT 문 => ResultSet 객체 ( 한개의 행)
	
	int listCount = 0;
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectSearchListCount");
	
	
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
public ArrayList<Notice> searchList(Connection conn,PageInfo pi,String keyword){
	
	// SELECT문 => ResultSet 객체 (여러 행 조회) => ArrayList
	
	ArrayList<Notice> list = new ArrayList<>();
	
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("searchList");
	
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
			 
			list.add(new Notice(rset.getInt("NOTI_NO")
					          ,rset.getString("NOTI_TITLE")
					          ,rset.getString("D1")));
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
