package com.na.user.mypage.model.dao;

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
import com.na.user.member.model.vo.Member;
import com.na.user.order.model.vo.Purchase;
import com.na.user.product.model.vo.Product;
import com.na.user.review.model.vo.Review;

public class MypageDao {
	
	Properties prop = new Properties();
	
	//기본 생성자 -> MypageDao()로 호출 시 실행됨
	public MypageDao(){
		
		String fileName = MypageDao.class.getResource("/sql/mypage/mypage-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//회원 1명의 정보 select
	public Member selectMember(Connection conn, String userId) {
		
		//조회된 회원의 정보 담을 Member객체 생성 
		Member updateMem = null;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//위치홀더 세팅
			pstmt.setString(1, userId);
			
			//쿼리문 실행
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				updateMem = new Member(rset.getInt("MEM_NO"),
									   rset.getString("MEM_ID"),
									   rset.getString("MEM_PWD"),
									   rset.getString("MEM_NAME"),
									   rset.getString("MEM_GENDER"),
									   rset.getString("MEM_BIRTH"),
									   rset.getString("MEM_EMAIL"),
									   rset.getString("MEM_ADDRESS"),
									   rset.getString("MEM_MARKETING_YN"),
									   rset.getString("MEM_STATUS"),
									   rset.getDate("MEM_ENROLL_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return updateMem;
	}
	
	//회원정보수정 update 
	public int updateMemberInfo(Connection conn, String userId, String userPwd, String newPwd, String newName) {
		
		//수정된 회원정보 담아줄 객체 생성
		int result = 0;
		PreparedStatement pstmt = null;
		
		System.out.println(userId);
		
		//실행할 sql key값 세팅해주기 
		String sql = prop.getProperty("updateMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//sql 위치홀더로 구멍 뚫어준 부분 매꿔주기
			pstmt.setString(1, newPwd);
			pstmt.setString(2, newName);
			pstmt.setString(3, userId);
			pstmt.setString(4, userPwd);
			
			//실행시킨 sql문 결과값 => 처리된 행의 갯수에 따라서 회원정보수정 여부 확인 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	//회원탈퇴 
	public int memberDelete(Connection conn, String userId, String userPwd) {
		
		//update구문 실행
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("memberDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//위치홀더 구멍 매꿔주기
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			//sql쿼리문 실행과 동시에 결과값 받아주기 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Product> orderList(Connection conn, int userNo) {
		
		//select조회 결과값 
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				Product p = new Product();
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	/*
	 * public ArrayList<String> selectCartList(Connection conn, int userNo){
	 * 
	 * ArrayList<String> list = new ArrayList<>(); PreparedStatement pstmt = null;
	 * 
	 * ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectCartList");
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, userNo);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while(rset.next()) {
	 * 
	 * list.add(rset.getString("CARTLIST"));
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); }finally { close(rset);
	 * close(pstmt); } return list; }
	 */
	
	public ArrayList<Purchase> selectMypagePurchaseLsit(Connection conn, int userNo, PageInfo pi){
		
		ArrayList<Purchase> list = new ArrayList<Purchase>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

		String sql = prop.getProperty("selectMypagePurchaseLsit");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				list.add(new Purchase(rset.getString("PRO_IMG_PATH"),
									  rset.getString("PRO_NAME"), 
									  rset.getString("PRO_EFFICACY"),
						              rset.getString("TOT"),
						              rset.getInt("CART_AMOUNT"),
						              rset.getString("CART_NO")));			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
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
	
	public int selectListCount9(Connection conn, int uN) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount9");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uN);
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
	
	public int selectListCount8(Connection conn, int uN) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount8");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uN);
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
	
	public int selectReview(Connection conn, String cartNo){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cartNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("C");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public Product selectPurProduct(Connection conn, String cartNo) {
		
		Product p = new Product();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPurProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cartNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p.setProName(rset.getString("PRO_NAME"));
				p.setProNo(rset.getInt("CART_NO"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public int selectPurNoMyReview(Connection conn, Review r, String cartNo) {
		System.out.println(cartNo);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int purNo = 0;
		
		try {
			String sql1 = prop.getProperty("selectMyCartList");
			
			pstmt = conn.prepareStatement(sql1);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String cartlist = rset.getString("CARTLIST");
				
				String[] list = cartlist.split("/");
				
				for(int i=0; i<list.length; i++) {
					if(list[i].equals(cartNo)) {
						purNo = rset.getInt("PUR_NO");
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return purNo;
	}
	
	
	public int insertMyReview(Connection conn, Review r, int purNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("insertMyReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, r.getRevTitle());
			pstmt.setString(2, r.getRevDes());
			pstmt.setString(3, r.getRevPath());
			pstmt.setInt(4, purNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public int updateMyReview(Connection conn, int cartNo) {
		
		int result = 0; 
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMyReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cartNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
