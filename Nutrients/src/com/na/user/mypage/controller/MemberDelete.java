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
 * Servlet implementation class MemberDelete
 */
@WebServlet("/delete.me")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Post방식으로 넘어온 값들은 인코딩 제일 먼저 해줘야 함
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		//사용자 입력 값 가져오기 
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		

		//Service에 값 넘겨주기 
		int result = new MypageService().memberDelete(userId, userPwd);
		
		if(result>0) {
			//update 성공
			session.removeAttribute("loginUser");
			//회원 탈퇴 성공시 로그아웃 처리 해야함
			session.setAttribute("alertMsg", "회원탈퇴에 성공했습니다\n.회원탈퇴로 인하여 자동 로그아웃 됩니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else {
			//update 실패
			session.setAttribute("alertMsg", "회원탈퇴실패(비밀번호 불일치)");
			int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			int listCount9 = new MypageService().selectListCount9(uN);
			request.setAttribute("listCount9", listCount9);
			
			//에러페이지로 이동
			request.getRequestDispatcher("views/user/myPage/mypageMemberDelete.jsp").forward(request, response);
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
