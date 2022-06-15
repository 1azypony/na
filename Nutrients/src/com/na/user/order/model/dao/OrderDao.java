package com.na.user.order.model.dao;

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

import com.na.user.member.model.dao.MemberDao;
import com.na.user.member.model.vo.Member;
import com.na.user.order.model.vo.MyCart;
import com.na.user.order.model.vo.Purchase;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao() {

		String fileName = MemberDao.class.getResource("/sql/order/order-mapper.xml").getPath();
				
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
	
	
	
	public int myCartProductInsert(Connection conn, int userNo, int pNo, int amount) {
		
		//결과 반환값 선언
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("myCartProductInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, amount);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MyCart> myCartProductSelect(Connection conn, String userId) {
		
		ArrayList<MyCart> cart_list = new ArrayList<MyCart>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("myCartProductSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cart_list.add(new MyCart(
								   rset.getInt("CART_NO"),
								   rset.getString("PRO_NAME"),
								   rset.getString("PRO_EFFICACY"),
								   rset.getString("PRO_IMG_PATH"),
								   rset.getString("CART_AMOUNT"),
								   rset.getString("TOTAL_P")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cart_list;
	}



	public int cartDelete(Connection conn, int cartNo) {
		
		//회원 장바구니 삭제 기능 
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("cartDelete");
		
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



	public ArrayList<MyCart> selectPurchaseList(Connection conn, int cartNo1, String userId) {
		
		ArrayList<MyCart> list = new ArrayList<MyCart>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPurchaseList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cartNo1);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new MyCart(
						   rset.getInt("CART_NO"),
						   rset.getString("PRO_NAME"),
						   rset.getString("PRO_EFFICACY"),
						   rset.getString("PRO_IMG_PATH"),
						   rset.getString("CART_AMOUNT"),
						   rset.getString("TOTAL_P"),
						   rset.getString("MEM_NAME"),
						   rset.getString("MEM_EMAIL"),
						   rset.getString("PRO_PRICE")) 
					);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int insertPurchase(Connection conn, String list, String address, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPurchase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, address);
			pstmt.setString(2, list);
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMyCart(Connection conn, String list) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMyCart");
		
			
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(list));
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Purchase> selectCompletePurchaseList(Connection conn, String list, int memNo) {
		
		ArrayList<Purchase> p_list = new ArrayList<Purchase>();
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCompletePurchaseList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, list);
			pstmt.setInt(2, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p_list.add(new Purchase(
							rset.getString("PRO_IMG_PATH"),
							rset.getString("PRO_NAME"),
							rset.getString("PRO_EFFICACY"),
							rset.getString("P_DATE"),
							rset.getString("TOT"),
							rset.getString("PUR_STATUS"),
							rset.getString("PRO_PRICE"),
							rset.getString("CART_NO")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p_list;
	}
	
	public ArrayList<MyCart> selectCartlist(Connection conn, int userNo){
		
		ArrayList<MyCart> list = new ArrayList<MyCart>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				list.add(new MyCart(
						   rset.getInt("CART_NO"),
						   rset.getString("PRO_NAME"),
						   rset.getString("PRO_EFFICACY"),
						   rset.getString("PRO_IMG_PATH"),
						   rset.getString("CART_AMOUNT"),
						   rset.getString("TOTAL_P")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Purchase selectDetailPurchase(Connection conn, String cartno, int userNo) {
		
		Purchase p1 = new Purchase();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailPurchase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, Integer.parseInt(cartno));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p1.setProName(rset.getString("PRO_NAME"));
				p1.setProEffi(rset.getString("PRO_EFFICACY"));
				p1.setTotprice(rset.getString("TOT"));
				p1.setCartAmount(rset.getInt("CART_AMOUNT"));
				p1.setStatus(rset.getString("CART_STATUS"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return p1;
	}
	
public ArrayList<String> practice(Connection conn, String cartNo) {
		
		ArrayList<String> aaa  = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getAllP");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				
				String cartList = rset.getString("CARTLIST");
				String[] list = cartList.split("/");
				
				for(int i=0;list.length>i;i++) {
					if(list[i].equals(cartNo)) {
					aaa.add(Integer.toString(rset.getInt("PUR_NO")));	
					aaa.add(rset.getString("PUR_ADDRESS"));	
					aaa.add(rset.getString("P"));	
					aaa.add(rset.getString("D"));	
					aaa.add(rset.getString("D1"));	
					aaa.add(rset.getString("D2"));	
					}
				}
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		

		return aaa;
	}
	
	public ArrayList<String> practice2(Connection conn, String cartNo) {
		
		ArrayList<String> bbb  = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getCartPnamePrice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cartNo));
			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				bbb.add(rset.getString(1));
				bbb.add(Integer.toString(rset.getInt(2)));
				bbb.add(Integer.toString(rset.getInt(3)));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return bbb;
	}
}
