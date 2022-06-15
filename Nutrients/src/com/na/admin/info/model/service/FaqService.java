package com.na.admin.info.model.service;

import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.commit;
import static com.na.template.JDBCTemplate.getConnection;
import static com.na.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.admin.info.model.dao.FaqDao;
import com.na.admin.info.model.dao.NoticeDao;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Faq;
import com.na.user.info.model.vo.Notice;

public class FaqService {

	// 현재 총 게시글 갯수
	public int selectListCount() {
		
       Connection conn = getConnection();
		
		int listCount = new FaqDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;	
				
	}
	
	//  현재 사용자가 요청한 페이지에 보여질 게시글 리스트 
	 public ArrayList<Faq> selectfaqList() {
		
		Connection conn =getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectList(conn);
		
		close(conn);
		
		return list;
			
	}
 // faq 리스트에서 상세페이지로 이동! 
	public Faq selectFaq(int faqNo) {
		
       Connection conn =  getConnection();
		
		Faq f = new FaqDao().selectFaq(conn,faqNo);
		// 하나만 뽑기 때문에  faqNo
		
		close(conn);
		
		return f;		
				
	}
	//삭제 처리
	public int deleteFaq(int faqNo) {
		
        Connection conn = getConnection();
		
		int result = new FaqDao().deleteFaq(conn,faqNo);
		
		if(result >0 ) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		  close(conn);
		
		  return result;
	
	}

	//저장
	public int insertFaq(Faq f) {
		 
		 Connection conn =  getConnection();
		 
		 //2) dao로 connection 과 전달값 넘기고 결과 받기 
		 int result = new FaqDao().insertFaq(conn,f);
		 
		 //3) 결과에 따라 commit,rollback처리
		 if(result>0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
		 
	 }
	
	public int countF() {
		Connection conn = getConnection();
		int count = new FaqDao().countF(conn);
		close(conn);
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
