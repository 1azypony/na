package com.na.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.service.MemberService;
import com.na.user.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberController
 */
@WebServlet("/insertMem.me")
public class InsertMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String years = request.getParameter("years");
		int monthB = Integer.parseInt(request.getParameter("month"));
		int dayB = Integer.parseInt(request.getParameter("day"));
		String email = request.getParameter("email");
		
		String chk = null;
		if(request.getParameter("chk")==null) {
			chk = "N";
		}else {
			chk = "Y";
		}
		
		String month = null;
		String day = null;
		
		if(monthB<10) {
			month = "0" + monthB;
		}else {
			month = "" + monthB;
		}
		
		if(dayB<10) {
			day = "0" + dayB;
		}else {
			day = "" + dayB;
		}
		
		String birth = years + month + day;
		
		Member m = new Member(id, pw, name, gender, birth, email, chk);
		
		int result = new MemberService().insertMember(m);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "회원가입에 성공하셨습니다. 로그인해주세요.");
			response.sendRedirect(request.getContextPath()+"/beforeLog.me");
		}else {
			request.setAttribute("errorMsg", "회원가입 실패");
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
