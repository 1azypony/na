package com.na.admin.info.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Qna;

import static com.na.template.JDBCTemplate.*;

public class InfoDao {
	private Properties prop = new Properties();
	
	public InfoDao() {
		try {
			prop.loadFromXML(new FileInputStream(InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		// 필요한 변수 세팅
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// Sql문
		String sql = prop.getProperty("selectListCount9");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public int selectListCount(Connection conn, String keyword) {
		// 필요한 변수 세팅
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// SQL문
		String sql = prop.getProperty("selectListCountSearch");
		
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
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
				
	}
	
	public ArrayList<Qna> selectInqList(Connection conn, PageInfo pi, int userNo){
		// 필요한 변수 세팅
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql문 
		String sql = prop.getProperty("selectInqList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			// 게시물 시작값  = (현재페이지-1) * 게시물 최대개수 + 1
			// 예를 들어, 한페이지의 게시물 최대 개수가 10이라면
			// 1페이지 = 1 ~ 10
			// 2페이지 = 11 ~ 20
			// 3페이지 = 21 ~ 30
			// ...
			
			// 게시물 끝 값 = 시작값 + 게시물 최대개수 - 1
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("INQ_NO"),
						 		 rset.getString("INQ_TITLE"),
						 		 rset.getString("MEM_ID"),
						 		 rset.getString("D"),
						 		 rset.getString("답변여부")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	public Qna selectInqDetail(Connection conn, int ino) {
		// 필요한 변수 세팅
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql문 
		String sql = prop.getProperty("selectInqDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ino);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new Qna();
				q.setInqNo(rset.getInt("INQ_NO"));
				q.setInqTitle(rset.getString("INQ_TITLE"));
				q.setUserNo(rset.getString("MEM_ID"));
				q.setInqDate(rset.getString("INQ_DATE"));
				q.setStatus(rset.getString("INQ_STATUS"));
				q.setInqQuery(rset.getString("INQ_QUERY"));
				q.setInqAnswer(rset.getString("답변내용"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
				
	}
	
	public int updateInq(Connection conn, Qna q) {
		
		// 필요한 변수 설정
		int result = 0;
		PreparedStatement pstmt = null;
		
		// sql문
		String sql = prop.getProperty("updateInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getInqAnswer());
			pstmt.setInt(2, q.getInqNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result ; 
	}
	
	public ArrayList<Qna> selectInqSearch(Connection conn, String keyword, PageInfo pi){
		// 필요한 변수
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// sql문
		String sql = prop.getProperty("selectInqSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			String addName = "%"+keyword+"%";
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(1, addName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Qna(rset.getInt("INQ_NO")
								,rset.getString("INQ_TITLE")
								,rset.getString("MEM_ID")
								,rset.getString("D")
								,rset.getString("답변여부")));
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
