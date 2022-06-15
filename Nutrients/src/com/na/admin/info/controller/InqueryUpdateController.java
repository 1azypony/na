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
 * Servlet implementation class InqueryUpdateController
 */
@WebServlet("/inqueryupdate.in")
public class InqueryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /*
     * @see HttpServlet#HttpServlet()
     */
    public InqueryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 전달값 뽑기
		int inqueryNo = Integer.parseInt(request.getParameter("inqueryNo"));
		String answer = request.getParameter("answer");
		
		// vo객체로 초기화
		Qna q = new Qna();
		q.setInqNo(inqueryNo);
		q.setInqAnswer(answer);
		
		// Service단에 메소드 호출
		int result = new InfoService().updateInq(q);
		
		// 응답뷰 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변을 추가하였습니다.");
			response.sendRedirect(request.getContextPath()+"/inquerydetail.in?ino="+inqueryNo);
		}else {
			request.setAttribute("errorPage", "답변을 추가하지 못했습니다.");
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
