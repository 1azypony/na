package com.na.user.member.model.service;

import static com.na.template.JDBCTemplate.*;

import java.sql.Connection;

import com.na.user.member.model.dao.MemberDao;
import com.na.user.member.model.vo.Member;

public class MemberService {
	
	public Member login(Member m) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().login(conn, m);
		
		close(conn);
		
		return loginUser;
		
	}
	
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		return count;
		
		
		
	}
	
	public int emailCheck(String checkEmail) {
		
		Connection conn = getConnection();
		int count = new MemberDao().emailCheck(conn, checkEmail);
		
		close(conn);
		return count;
		
		
		
	}
	
	public int emailCheck2(String checkId, String checkEmail) {
		
		Connection conn = getConnection();
		int count = new MemberDao().emailCheck2(conn, checkId, checkEmail);
		
		close(conn);
		return count;
		
		
		
	}
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public String findId(String email) {
		
		Connection conn = getConnection();
		String userId = new MemberDao().findId(conn, email);
		
		close(conn);
		
		return userId;
		
	}
	
	public String findPwd(String email) {
		
		Connection conn = getConnection();
		String userPwd = new MemberDao().findPwd(conn, email);
		
		close(conn);
		
		return userPwd;
		
	}
	

	

}
