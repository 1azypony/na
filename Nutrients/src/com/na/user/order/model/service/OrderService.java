package com.na.user.order.model.service;

import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.commit;
import static com.na.template.JDBCTemplate.getConnection;
import static com.na.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.user.order.model.dao.OrderDao;
import com.na.user.order.model.vo.MyCart;
import com.na.user.order.model.vo.Purchase;

public class OrderService {

	public int myCartProductInsert(int userNo, int pNo, int amount) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().myCartProductInsert(conn, userNo, pNo, amount);
		
		if(result>0) {
			//insert성공
			commit(conn);
		}else {
			//insert실패
			rollback(conn);
		}
		
		//자원반납
		close(conn);
		
		return result;
	}

	//내 장바구니 목록 조회
	public ArrayList<MyCart> myCartProductSelect(String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<MyCart> cart_list = new OrderDao().myCartProductSelect(conn, userId);
		
		close(conn);
		
		return cart_list;
	}

	public int cartDelete(int cartNo) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().cartDelete(conn, cartNo);
		
		if(result>0) {
			//성공
			commit(conn);
		}else {
			//실패
			rollback(conn);
		}
		
		return result;
	}
	
	public ArrayList<MyCart> selectPurchaseList(int cartNo1, String userId){
		
		Connection conn = getConnection();
		
		ArrayList<MyCart> list = new OrderDao().selectPurchaseList(conn, cartNo1, userId);
		
		close(conn);
		
		return list;
	}
	public int insertPurchase(String address, String list, int memNo) {
		
		Connection conn = getConnection();
		
		String[] split_list = list.split("/");
		
		int result1= 0; 
		
		for(int i=0; i<split_list.length; i++) {
			
			result1 += new OrderDao().updateMyCart(conn, split_list[i]);
		}
		
		int result2 = 0;
		if(result1==split_list.length) {
			//장바구니 상태 update 모두 성공 시 구매 테이블에 데이터 insert
			
			result2 = new OrderDao().insertPurchase(conn, list, address, memNo);
		}
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
			close(conn);
			
		return result1*result2;
		
	}
	
	public ArrayList<Purchase> selectCompletePurchaseList(String list, int memNo){
		
		Connection conn = getConnection();
		
		ArrayList<Purchase> p_list = new OrderDao().selectCompletePurchaseList(conn, list, memNo);
		
		close(conn);
		
		return p_list;
	}
	
	public ArrayList<MyCart> selectCartlist(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<MyCart> list = new OrderDao().selectCartlist(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	public Purchase selectDetailPurchase(String cartno, int userNo) {
		
		Connection conn = getConnection();
		
		Purchase p1 = new OrderDao().selectDetailPurchase(conn, cartno, userNo);
		
		close(conn);
		
		return p1;
	}
	
	public ArrayList<String> practice(String cartNo) {
		Connection conn = getConnection();
		ArrayList<String> aaa = new OrderDao().practice(conn, cartNo);
		close(conn);
		return aaa;
	}

	public ArrayList<String> practice2(String cartNo) {
		Connection conn = getConnection();
		ArrayList<String> bbb = new OrderDao().practice2(conn, cartNo);
		close(conn);
		return bbb;
	}
}
