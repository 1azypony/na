package com.na.admin.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.member.model.service.MemberService;

/**
 * Servlet implementation class MemberAddUpdateController
 */
@WebServlet("/memAddUpdate.me")
public class MemberAddUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String address = request.getParameter("add");
		String currentPage = request.getParameter("currPage");
		
		int result = new MemberService().updateAdd(userNo, address);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "처리되었습니다.");
			response.sendRedirect(request.getContextPath()+"/memManageList.me?currentPage="+currentPage);
		}else {
			request.setAttribute("errorMsg", "수정실패");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
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
