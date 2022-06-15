package com.na.admin.magazine.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.na.admin.magazine.model.dao.MagazineDao;
import com.na.user.magazine.model.vo.Magazine;
import com.na.template.model.vo.PageInfo;

import static com.na.template.JDBCTemplate.close;
import static com.na.template.JDBCTemplate.commit;
import static com.na.template.JDBCTemplate.getConnection;
import static com.na.template.JDBCTemplate.rollback;
import static com.na.template.common.JDBCTemplate.*;

public class MagazineService {
	
// -------------------------------------------------------------------	
		public int selectListCount() {
			
			Connection conn = getConnection();
			
			int listCount = new MagazineDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;
		}
		
// -------------------------------------------------------------		
	public int selectListCount(String keyword) {
			
			Connection conn = getConnection();
			
			
			int listCount = new MagazineDao().selectListCount(conn, keyword);
			
			close(conn);
			
			return listCount;
		}
	
	
// ---------------------------------------------------------------------------
	public ArrayList<Magazine> selectSearch(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Magazine> list = new MagazineDao().selectSearch(conn, keyword, pi);
		
		close(conn);
		
		return list;
	}

// ----------------------------------------------------------------------------	
		public ArrayList<Magazine> selectList(PageInfo pi) {
			
			Connection conn = getConnection();
			
			ArrayList<Magazine> list = new MagazineDao().selectList(conn, pi);
			
			close(conn);
			
			return list;
		}
		

// --------------------------------------------------------------------
		public Magazine selectMagazine(int magNo) {
			
			Connection conn = getConnection();
			
			Magazine m = new MagazineDao().selectMagazine(conn, magNo);
			
			close(conn);
			
			return m;
		}
		
// ----------------------------------------------------------------
		
		public int insertMagazine(Magazine m) {
	
			
			Connection conn = getConnection();
			
			// 1. MAAGAZINE 테이블에 INSERT 시켜주는 DAO 호출
			int result = new MagazineDao().insertMagazine(conn, m);

		
			// 3. 커밋 / 롤백 처리 (위 두개의 쿼리문이 성공했을경우만 커밋)
			if(result > 0) { // 성공 => 커밋	
				commit(conn);
			}
			else { // 실패 => 롤백
				
				rollback(conn);
			}
			
			// 4. 자원반납
			close(conn);
			
			// 5. 결과 반환
			return result;
		}
		
// -------------------------------------------------------------------
		public int updateMagazine(Magazine m) {
			
			Connection conn = getConnection();
			
			// 우선적으로 공통적으로 실행해야하는  매거진 테이블 UPDATE 구문
			int result = new MagazineDao().updateMagazine(conn, m);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
	
			}
		
		public int updateMagazine2(Magazine m) {
			
			Connection conn = getConnection();
			
			// 우선적으로 공통적으로 실행해야하는  매거진 테이블 UPDATE 구문
			int result = new MagazineDao().updateMagazine2(conn, m);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
	
			}
// -----------------------------------------------------------------
		public int deleteMagazine(int magNo) {
			
			Connection conn = getConnection();
			
			int result = new MagazineDao().deleteMagazine(conn, magNo);
			
			if(result > 0) {
				
				commit(conn);
			}
			else {
				
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

}
