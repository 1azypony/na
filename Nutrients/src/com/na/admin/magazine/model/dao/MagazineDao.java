package com.na.admin.magazine.model.dao;

import static com.na.template.common.JDBCTemplate.close;

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
	
	// -----------------------------------------------------------
	public int selectListCount(Connection conn, String keyword) {
		
		// SELECT int -> ResultSet(한개의 행)
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		
		String sql = prop.getProperty("selectSearchListCount");
		
		
		try {
			String addName = "%"+keyword+"%";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addName);
			
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
	//-------------------------------------------------------------------------------
	public ArrayList<Magazine> selectSearch(Connection conn, String keyword, PageInfo pi) {
		
		//SELECT 문 -> ResultSet 객체는 여러행 조회 -> ArrayList
		
		ArrayList<Magazine> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			String addName ="%"+keyword+"%";
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(1, addName);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Magazine( rset.getInt("MAGAZINE_NO")
									 , rset.getString("MAGAZINE_TITLE")
									 , rset.getString("LD")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	//-----------------------------------------------------------------------------
	
	public ArrayList<Magazine> selectList(Connection conn, PageInfo pi) {
		
		//SELECT 문 -> ResultSet 객체는 여러행 조회 -> ArrayList
		
		ArrayList<Magazine> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Magazine( rset.getInt("MAGAZINE_NO")
									 , rset.getString("MAGAZINE_TITLE")
									 , rset.getString("LD")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
		
	}


// ------------------------------------------------------------------------

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

 

// ------------------------------------------------------------------------
	public int insertMagazine(Connection conn, Magazine m) {
		
		// INSERT 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMagazine");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMagTitle());
			pstmt.setString(2, m.getMagDes());
			pstmt.setString(3, m.getMagImgPath());
			
			System.out.println(m.getMagTitle());
			System.out.println(m.getMagDes());
			System.out.println(m.getMagImgPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
// ---------------------------------------------------------
	
	public int updateMagazine(Connection conn, Magazine m) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMagazine");
				
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMagTitle());
			pstmt.setString(2, m.getMagDes());
			pstmt.setString(3, m.getMagImgPath());
			pstmt.setInt(4, m.getMagNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMagazine2(Connection conn, Magazine m) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMagazine2");
				
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMagTitle());
			pstmt.setString(2, m.getMagDes());
			pstmt.setInt(3, m.getMagNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	
// ---------------------------------------------------------
	public int deleteMagazine(Connection conn, int magNo) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMagazine");
		
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
}
