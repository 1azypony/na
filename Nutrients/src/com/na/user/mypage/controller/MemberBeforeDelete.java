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
 * Servlet implementation class MemberBeforeUpdate
 */
@WebServlet("/beforDel.me")
public class MemberBeforeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBeforeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int listCount9 = new MypageService().selectListCount9(uN);
		request.setAttribute("listCount9", listCount9);
		
		request.getRequestDispatcher("/views/user/myPage/mypageMemberDelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
