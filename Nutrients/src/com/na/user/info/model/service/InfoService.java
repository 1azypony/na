package com.na.user.info.model.service;
import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.dao.InfoDao;
import com.na.user.info.model.vo.Faq;
import com.na.user.info.model.vo.Notice;
import com.na.user.info.model.vo.Qna;



public class InfoService {
	
	public int selectNoticeCount() {
		
		Connection conn = getConnection();
		int listCount = new InfoDao().selectNoticeCount(conn);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new InfoDao().selectNoticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Notice selectNotice(int notiNo) {
		
		Connection conn = getConnection();
		
		Notice n = new InfoDao().selectNotice(conn, notiNo);
		
		close(conn);
		
		return n;
		
	}
	
	public ArrayList<Faq> selectFaqList(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new InfoDao().selectFaqList(conn);
		
		close(conn);
		
		return list;
	}
	
	public Faq selectFaq(int faqNo) {
		Connection conn = getConnection();
		Faq f = new InfoDao().selectFaq(conn, faqNo);
		
		close(conn);
		return f;
		
	}
	
	public int selectListCount5(int userNo) {
		Connection conn = getConnection();
		
		int listCount = new InfoDao().selectListCount5(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	
	
	
	public ArrayList<Qna> selectQnaList(PageInfo pi, int userNo){
		// 커넥션 연결해주기
		Connection conn = getConnection();
		
		// DAO에 메소드 호출하기
		ArrayList<Qna> list = new InfoDao().selectQnaList(conn, pi, userNo);
		
		// SELECT문이니 트랜잭션 생략
		
		// 자원 반납
		close(conn);
		
		// 결과값 반환
		return list;
		
	}
	
	public Qna selectQnaDetail(int inqueryNo) {
		Connection conn = getConnection();
		
		Qna q = new InfoDao().selectQnaDetail(conn, inqueryNo);
		
		close(conn);
		
		return q;
	}
	
	public int insertQna(Qna q) {
		// 커넥션 
		Connection conn = getConnection();
		
		// Dao단 호출
		int result = new InfoDao().insertQna(conn, q);
		
		// 트랜잭션 처리
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
	
	public int deleteQna(int inqueryNo) {
		
		// Connection
		Connection conn = getConnection();
		
		// Dao단에 메소드호출
		int result = new InfoDao().deleteQna(conn, inqueryNo);
		
		// 트랜잭션
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int updateQna(Qna q) {
		// 커넥션
		Connection conn = getConnection();
		
		// Dao단 메소드 호출
		int result = new InfoDao().updateQna(conn, q);
		System.out.println("질문 : "+q.getInqQuery());
		// 트랜잭션 처리
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

}
