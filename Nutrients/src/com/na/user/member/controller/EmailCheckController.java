package com.na.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.service.MemberService;

/**
 * Servlet implementation class EmailCheckController
 */
@WebServlet("/emailCheck.me")
public class EmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String checkEmail = request.getParameter("checkEmail");
		System.out.println(checkEmail);
		
		int count = new MemberService().emailCheck(checkEmail);
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(count>0) { // 이메일 존재 (중복)
			
			response.getWriter().print("NNNNN");
			
		}else { //이메일 비존재 (아이디 생성 가능)
			
			response.getWriter().print("NNNNY");
			
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
