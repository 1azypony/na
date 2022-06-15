package com.na.admin.info.model.service;

import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.admin.info.model.dao.NoticeDao;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Notice;


public class NoticeService {

	// notice 현재 게시글 갯수
 public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;		
	}	
	
  // notice 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
 public ArrayList<Notice> selectList(PageInfo pi) {
		
		Connection conn =getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
		
	}
 // notice 리스트에서 상세페이지로 이동! 
 public Notice selectNotice(int notiNo) {
		
		Connection conn =  getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn,notiNo);
		// 하나만 뽑기 때문에 Notice n
		
		close(conn);
		
		return n;	
	}
 //notice 리스트에서 글 작성!
 public int insertNotice(Notice n) {
	 
	 Connection conn =  getConnection();
	 
	 //2) dao로 connection 과 전달값 넘기고 결과 받기 
	 int result = new NoticeDao().insertNotice(conn,n);
	 
	 //3) 결과에 따라 commit,rollback처리
	 if(result>0) {
		 commit(conn);
	 }else {
		 rollback(conn);
	 }
	 close(conn);
	 
	 return result;
	 
 }
 // 상세페이지에서 삭제처리
 public int deleteNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		
		if(result >0 ) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		  close(conn);
		
		  return result;
	}
	

 // 검색어
 public int selectListCount(String keyword) {
	 
	 Connection conn = getConnection();
	 
		
		int listCount = new NoticeDao().selectListCount(conn,keyword);
		
		close(conn);
		
		return listCount;		
 }
 public ArrayList<Notice> searchList(PageInfo pi,String keyword) {
		
		Connection conn =getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchList(conn,pi,keyword);
		
		close(conn);
		
		return list;
		
	}
	
	
}
