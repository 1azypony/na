package com.na.user.magazine.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.template.model.vo.PageInfo;
import com.na.user.magazine.model.dao.MagazineDao;
import com.na.user.magazine.model.vo.Magazine;

import static com.na.template.JDBCTemplate.*;

public class MagazineService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new MagazineDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	//----------------------------------------------------------
	public ArrayList<Magazine> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Magazine> list = new MagazineDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Magazine> selectList2(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Magazine> list = new MagazineDao().selectList2(conn, pi);
		
		close(conn);
		
		return list;
	}

	//------------------------------------------------------------
	
	public int increaseCount(int magNo) {
		
		Connection conn = getConnection();
		
		int result = new MagazineDao().increaseCount(conn, magNo);
		
		if(result > 0) {
			
			commit(conn);
		}
		else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	// --------------------------------------------------------------------
	
	public Magazine selectMagazine(int magNo) {
		
		Connection conn = getConnection();
		
		Magazine m = new MagazineDao().selectMagazine(conn, magNo);
		
		close(conn);
		
		return m;
	}
	

	
 //----------------------------------------------------------------------	
}
