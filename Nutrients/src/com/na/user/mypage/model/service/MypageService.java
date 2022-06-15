package com.na.user.mypage.model.service;

import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.commit;
import static com.na.template.JDBCTemplate.getConnection;
import static com.na.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.dao.MypageDao;
import com.na.user.order.model.vo.Purchase;
import com.na.user.product.model.dao.ProductDao;
import com.na.user.product.model.vo.Product;
import com.na.user.review.model.vo.Review;

public class MypageService {

	//회원정보수정 service
	public Member updateMemberInfo(String userId, String userPwd, String newPwd, String newName) {
		
		//Connection객체 생성
		Connection conn = getConnection();

		//DAO로 사용자 입력 값 넘겨주기 
		int result = new MypageDao().updateMemberInfo(conn, userId, userPwd, newPwd, newName);

		Member updateMem = null;
		
		if(result>0) {
			//회원정보수정 성공 commit과 동시에 connection객체 자원 반납
			updateMem = new MypageDao().selectMember(conn, userId);
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public int memberDelete(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		//탈퇴할 회원의 상태값 update
		int result = new MypageDao().memberDelete(conn, userId, userPwd);
		
		if(result>0) {
			//update 성공됐을 경우  => DML구문 실행 시 commit, 자원반납
			commit(conn);
		}else {
			rollback(conn);
		}
		
		//사용한 connection객체 자원반납
		close(conn);
		
		return result;
	}

	public ArrayList<Product> orderList(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new MypageDao().orderList(conn, userNo);
		
		if(!list.isEmpty()) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return list;
	}
	
	/*
	 * public ArrayList<String> selectCartList(int userNo){
	 * 
	 * Connection conn = getConnection();
	 * 
	 * ArrayList<String> cartList = new MypageDao().selectCartList(conn, userNo);
	 * 
	 * close(conn);
	 * 
	 * return cartList; }
	 */
	
	
	public ArrayList<Purchase> selectMypagePurchaseLsit(int userNo, PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Purchase> list = new MypageDao().selectMypagePurchaseLsit(conn, userNo, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new MypageDao().selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
	public int selectListCount9(int uN) {
		
		Connection conn = getConnection();
		int listCount = new MypageDao().selectListCount9(conn, uN);
		
		close(conn);
		return listCount;
		
	}
	
	public int selectListCount8(int uN) {
		
		Connection conn = getConnection();
		int listCount = new MypageDao().selectListCount8(conn, uN);
		
		close(conn);
		return listCount;
		
	}

	public int selectReview(String cartNo){
		
		Connection conn = getConnection();
		
		int result = new MypageDao().selectReview(conn, cartNo);
	
		close(conn);
		
		return result;
	}
	
	public Product selectPurProduct(String cartNo) {
		Connection conn = getConnection();
		
		Product p = new MypageDao().selectPurProduct(conn, cartNo);
		
		close(conn);
		
		return p;
	}
	
	public int insertMyReview(Review r, String cartNo) {
		
		Connection conn = getConnection();
		
		int result2 = 1;
		int result3 = 1;
		
		int purNo = new MypageDao().selectPurNoMyReview(conn, r, cartNo);
		
		result2 = new MypageDao().insertMyReview(conn, r, purNo);
		result3 = new MypageDao().updateMyReview(conn, Integer.parseInt(cartNo));
		
		System.out.println(result2 + ", " + result3 + "지저저기ㅏㄷ저린얼");
		
		if(result2>0 && result3>0) {
			//성공
			commit(conn);
		}else {
			//실패
			rollback(conn);
		}
		close(conn);
		
		return result2*result3; 
	}

}
