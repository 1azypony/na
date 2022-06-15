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
 * Servlet implementation class QnaDetailController
 */
@WebServlet("/qnadetail.in")
public class QnaDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 시, 전달값 뽑기
		int inqueryNO = Integer.parseInt(request.getParameter("ino"));
		
		
		// Service단 메소드 호출
		Qna q = new InfoService().selectQnaDetail(inqueryNO);
		
		
		
		// 응답 뷰
		if(q!=null) {
			request.setAttribute("q", q);
			request.getRequestDispatcher("views/user/info/qnaDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "상세조회에 실패하였습니다.");
			request.getRequestDispatcher("views/user/common/errorPage.jsp");
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
