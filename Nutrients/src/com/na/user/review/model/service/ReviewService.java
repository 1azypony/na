package com.na.user.review.model.service;

import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.user.member.model.dao.MemberDao;
import com.na.user.product.model.dao.ProductDao;
import com.na.user.product.model.vo.Product;
import com.na.user.review.model.dao.ReviewDao;
import com.na.user.review.model.vo.Review;

public class ReviewService {
	
	public int selectMyReviewCount(int userNo) {
		
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectMyReviewCount(conn, userNo);
		
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Review> selectMyReviewList(PageInfo pi, int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMyReviewList(conn, pi, userNo);
		
		close(conn);
		
		return list;
		
		
	}
	
	// review 현재 총 게시글 갯수
 public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;		
	}	
//review 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
public ArrayList<Review> selectList(PageInfo pi) {
		
		Connection conn =getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
		
	}  
public ArrayList<Review> selectList2(PageInfo pi) {
	
	Connection conn =getConnection();
	
	ArrayList<Review> list = new ReviewDao().selectList2(conn,pi);
	
	close(conn);
	
	return list;
	
}  
//review 리스트에서 상세페이지로 이동! 
public Review selectReview(int revNo) {
	
	Connection conn =  getConnection();
	
	Review r = new ReviewDao().selectReview(conn,revNo);
	// 하나만 뽑기 때문에 Review r
	
	close(conn);
	
	return r;	
}
//review 사진 3 뛰우기
public ArrayList<Review> selectReThumbnailList(){
	
	Connection conn =getConnection();
	
	ArrayList<Review> list2 = new ReviewDao().selectReThumbnailList(conn);
	
	close(conn);
	
	return list2;	
}
public int increaseCount(int revNo) {
	
	Connection conn = getConnection();
	
	int result = new ReviewDao().increaseCount(conn,revNo);
	
	if(result>0) {
		
		commit(conn);
	}
	else {
		rollback(conn);
	}
	
	close(conn);
	
	return result;	
	
	
	
}

}
