package com.na.admin.review.model.service;

import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.commit;
import static com.na.template.JDBCTemplate.getConnection;
import static com.na.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.admin.info.model.dao.NoticeDao;
import com.na.admin.review.model.dao.ReviewDao;
import com.na.template.model.vo.PageInfo;
import com.na.user.review.model.vo.Review;

public class ReviewService {

	// review 현재 게시글 갯수
	 public int selectListCount() {
			
			Connection conn = getConnection();
			
			int listCount = new ReviewDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;		
		}	
	 
	 public int selectListCount2(String keyword) {
			
			Connection conn = getConnection();
			
			int listCount = new ReviewDao().selectListCount2(conn, keyword);
			
			close(conn);
			
			return listCount;		
		}	
		
	  // review 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
	 public ArrayList<Review> selectList(PageInfo pi) {
			
			Connection conn =getConnection();
			
			ArrayList<Review> list = new ReviewDao().selectList(conn,pi);
			
			close(conn);
			
			return list;
			
		}
	// review 리스트에서 상세페이지로 이동! 
	 public Review selectReview(int revNo) {
	 	
	 	Connection conn =  getConnection();
	 	
	 	Review r = new ReviewDao().selectReview(conn,revNo);
	 	// 하나만 뽑기 때문에 Review r
	 	
	 	close(conn);
	 	
	 	return r;	
	 }
	// review 삭제
	 public int deleteReview(int revNo) {
			
			Connection conn = getConnection();
			
			int result = new ReviewDao().deleteReview(conn,revNo);
			
			if(result >0 ) {
				commit(conn);
			}
			else {
				rollback(conn);
			}
			  close(conn);
			
			  return result;
		} 
	 
	// review 검색어
		 public int selectListCount(String keyword) {
				
				Connection conn = getConnection();
				
				int listCount = new ReviewDao().selectListCount(conn,keyword);
				
				close(conn);
				
				return listCount;		
			}
		// review 검색어 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
		 public ArrayList<Review> searchList(PageInfo pi,String keyword) {
				
				Connection conn =getConnection();
				
				ArrayList<Review> list = new ReviewDao().searchList(conn,pi,keyword);
				
				close(conn);
				
				return list;
				
			} 
		 public ArrayList<Review> searchList2(PageInfo pi,String keyword) {
				
				Connection conn =getConnection();
				
				ArrayList<Review> list = new ReviewDao().searchList2(conn,pi,keyword);
				
				close(conn);
				
				return list;
				
			} 
		 
	
	
}
