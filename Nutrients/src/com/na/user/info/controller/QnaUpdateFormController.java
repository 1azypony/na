package com.na.user.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.info.model.service.InfoService;
import com.na.user.info.model.vo.Qna;

/**
 * Servlet implementation class QnaUpdateFormController
 */
@WebServlet("/qnaupdateform.in")
public class QnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inqueryNo = Integer.parseInt(request.getParameter("ino"));
		System.out.println("찍혔니 ? "+inqueryNo);
		Qna q = new InfoService().selectQnaDetail(inqueryNo);
		// INQ_NO, INQ_TITLE, INQ_QUERY
		
		request.setAttribute("q",q);
		
		// 포워딩하기
		request.getRequestDispatcher("views/user/info/qnaModify.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
