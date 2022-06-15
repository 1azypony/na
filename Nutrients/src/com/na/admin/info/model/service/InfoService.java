package com.na.admin.info.model.service;

import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;
import com.na.admin.info.model.dao.InfoDao;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Qna;

import java.sql.Connection;
import java.util.ArrayList;

public class InfoService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new InfoDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	public int selectListCount(String keyword) {
		// 커넥션 
		Connection conn = getConnection();
		
		// DAO에 메소드 호출하기
		int listCount = new InfoDao().selectListCount(conn,keyword);
		
		// SELECT문이니 트랜잭션 생략
		
		// 자원 반납
		close(conn);
		
		// 결과 반환
		return listCount;
	}
	
	public ArrayList<Qna> selectInqList(PageInfo pi, int userNo){
		// 커넥션 연결해주기
		Connection conn = getConnection();
		
		// DAO에 메소드 호출하기
		ArrayList<Qna> list = new InfoDao().selectInqList(conn, pi, userNo);
		
		// SELECT문이니 트랜잭션 생략
		
		// 자원 반납
		close(conn);
		
		// 결과값 반환
		return list;
		
	}
	
	public Qna selectInqDetail(int ino){
		// 커넥션 
		Connection conn = getConnection();
		
		// Dao단 메소드 호출
		Qna q = new InfoDao().selectInqDetail(conn, ino);
		
		// 트랜잭션은 생략
		
		// 자원반납
		close(conn);
		
		// 결과값 반환
		return q;
	}
	
	public int updateInq(Qna q) {
		
		// 커넥션
		Connection conn = getConnection();
		
		// DAO단에 호출
		int result = new InfoDao().updateInq(conn,q);
		
		// 트랜잭션
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		// 자원반납
		close(conn);
		
		// 결과값 반환
		return result;
	}
	
	public ArrayList<Qna> selectInqSearch(PageInfo pi, String keyword){
		// 커넥션
		Connection conn = getConnection();
		
		// DAO단에서 메소드 호출
		ArrayList<Qna> list = new InfoDao().selectInqSearch(conn, keyword, pi);
		
		// SELECT문이니 트랜잭션 생략
		
		// 자원반납
		close(conn);
		
		// 결과반환
		return list;
	}
	
}
