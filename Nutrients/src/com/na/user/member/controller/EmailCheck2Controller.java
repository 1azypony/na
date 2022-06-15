package com.na.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.service.MemberService;

/**
 * Servlet implementation class EmailCheck2Controller
 */
@WebServlet("/emailCheck2.me")
public class EmailCheck2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheck2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String checkEmail = request.getParameter("checkEmail");
		String checkId = request.getParameter("checkId");
		
		int count = new MemberService().emailCheck2(checkId, checkEmail);
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(count>0) { // 해당 아이디 존재.
			
			response.getWriter().print("NNNNN");
			
		}else { // 해당 정보 없음.
			
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
