package com.na.user.magazine.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.na.template.model.vo.PageInfo;
import com.na.user.magazine.model.vo.Magazine;

import static com.na.template.common.JDBCTemplate.*;



public class MagazineDao {

	
private Properties prop = new Properties();
	
	public MagazineDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MagazineDao.class.getResource("/sql/magazine/magazine-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		// SELECT int -> ResultSet(한개의 행)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		
		String sql = prop.getProperty("selectListCount");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");	
			}
			
		} catch (SQLException e)  {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);		
			
		}
		 return listCount;
	}
	
	//---------------------------------------------------------------
	
	public ArrayList<Magazine> selectList(Connection conn, PageInfo pi) {
		
		//SELECT 문 -> ResultSet 객체는 여러행 조회 -> ArrayList
		
		ArrayList<Magazine> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * boardList가 9까지라는 가정하에
			 * currentPage : 1 -> 시작 1 끝값 9
			 * currentPage : 2 -> 시작 10 끝값 18
			 * currentPage : 3 -> 시작 19 끝값 27
			 * 
			 * ...
			 * 
			 * 시작값 = 
			 * 끝값 = 시작값 + boardLimit-1
			 * 
			 */
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Magazine( rset.getInt("MAGAZINE_NO")
									 , rset.getString("MAGAZINE_TITLE")
									 , rset.getString("LD")
							    	 , rset.getInt("MAGAZINE_VIEWS")
							    	 , rset.getString("MAGAZINE_IMG_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	public ArrayList<Magazine> selectList2(Connection conn, PageInfo pi) {
		
		//SELECT 문 -> ResultSet 객체는 여러행 조회 -> ArrayList
		
		ArrayList<Magazine> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * boardList가 9까지라는 가정하에
			 * currentPage : 1 -> 시작 1 끝값 9
			 * currentPage : 2 -> 시작 10 끝값 18
			 * currentPage : 3 -> 시작 19 끝값 27
			 * 
			 * ...
			 * 
			 * 시작값 = 
			 * 끝값 = 시작값 + boardLimit-1
			 * 
			 */
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Magazine( rset.getInt("MAGAZINE_NO")
									 , rset.getString("MAGAZINE_TITLE")
									 , rset.getString("LD")
							    	 , rset.getInt("MAGAZINE_VIEWS")
							    	 , rset.getString("MAGAZINE_IMG_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
  // --------------------------------------------------------------------
	public int increaseCount(Connection conn, int magNo) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		System.out.println(magNo);
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, magNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	// -----------------------------------------------------------

public Magazine selectMagazine(Connection conn, int magNo) {
		
		// SELECT 문 => ResultSet 객체 (한 행 조회)
		
		Magazine m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMagazine");
		System.out.println(magNo);
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, magNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Magazine();
				m.setMagNo(rset.getInt("MAGAZINE_NO"));
				m.setMagTitle(rset.getString("MAGAZINE_TITLE"));
				m.setMagDes(rset.getString("MAGAZINE_DESCRIPTION"));
				m.setMagDate(rset.getString("DD"));
				m.setCount(rset.getInt("MAGAZINE_VIEWS"));
				m.setMagImgPath(rset.getString("MAGAZINE_IMG_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

 
}

