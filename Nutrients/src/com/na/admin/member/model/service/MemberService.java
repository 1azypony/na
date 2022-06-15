package com.na.admin.member.model.service;
import static com.na.template.JDBCTemplate.*;
import static com.na.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.admin.member.model.dao.MemberDao;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.dao.InfoDao;
import com.na.user.info.model.vo.Notice;
import com.na.user.member.model.vo.Member;

public class MemberService {
	
	public int selectMemberCount() {
		
		Connection conn = getConnection();
		int listCount = new MemberDao().selectMemberCount(conn);
		close(conn);
		return listCount;
		
	}
	
	public int searchListCount(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new MemberDao().searchListCount(conn, keyword);
		close(conn);
		return listCount;
		
	}
	
	public int searchListCount2(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new MemberDao().searchListCount2(conn, keyword);
		close(conn);
		return listCount;
		
	}
	
	public int searchListCount3(String keyword) {
		
		Connection conn = getConnection();
		int listCount = new MemberDao().searchListCount3(conn, keyword);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Member> selectMemberList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Member> memSearchList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().memSearchList(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Member> memSearchList2(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().memSearchList2(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Member> memSearchList3(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().memSearchList3(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public int updateAdd(int userNo, String address) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateAdd(conn, userNo, address);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	public int resignMember(int userNo) {
		
		Connection conn = getConnection();
		int result = new MemberDao().resignMember(conn, userNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

}
