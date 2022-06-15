package com.na.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.info.model.service.InfoService;
import com.na.user.info.model.vo.Qna;

/**
 * Servlet implementation class InqueryDetailController
 */
@WebServlet("/inquerydetail.in")
public class InqueryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("ino").equals("조회된%20리스트가%20없습니다.")) {
			
			request.setAttribute("errorMsg", "잘못된 접근입니다.");
			request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
		}
			
		// 요청 시, 전달값 뽑기
		int ino = Integer.parseInt(request.getParameter("ino"));
		
		// Service단 메소드 호출
		Qna q = new InfoService().selectInqDetail(ino);

		// 응답뷰 지정
		if(q!=null) {
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/admin/info/inqueryDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상세조회에 실패하였습니다.");
			request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
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
