package com.na.user.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.service.MypageService;

/**
 * Servlet implementation class MemberInfoUpdate
 */
@WebServlet("/memInfoUp.my")
public class MemberInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdate() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post방식이기 때문에 인코딩 설정 제일 먼저 해줘야 함
		request.setCharacterEncoding("UTF-8");
	
		//사용자 입력값 뽑아오기 
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String userId = m.getUserId();
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String newName = request.getParameter("userName");
		
		//Service에 뽑아온 값 넘겨주기 
		//update될 것이기 때문에 결과값 int로 받아주기 
		Member updateMem = new MypageService().updateMemberInfo(userId, userPwd, newPwd, newName);
		
		HttpSession session = request.getSession();
		
		//돌아온 결과값에 따라서 보여주는 페이지 다르게 설정
		if(updateMem==null) {
			//update 실패 
			//실패 시 update 실패 alert창과 동시에 errorPage로 이동
			session.setAttribute("alertMsg", "기존 비밀번호가 일치하지 않습니다(다시입력해주세요)");
			
			request.getRequestDispatcher("views/user/myPage/mypageInfoUpdate.jsp").forward(request, response);
			//response.sendRedirect("views/user/myPage/mypageInfoUpdate.jsp");
		}else {
			//update 성공
			session.setAttribute("alertMsg", "회원정보 수정 성공!");
			session.setAttribute("loginUser", updateMem);
			
			//update성공시 메인페이지로 이동
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
