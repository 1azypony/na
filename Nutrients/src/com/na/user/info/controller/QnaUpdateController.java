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
 * Servlet implementation class QnaUpdateController
 */
@WebServlet("/qnaupdate.in")
public class QnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달값 뽑아서 VO객체로 대입
		// 글번호, 글제목, 글내용
		int inqueryNo = Integer.parseInt(request.getParameter("ino"));
		String inqTitle = request.getParameter("title");
		String inqContent = request.getParameter("content");
		
		// VO객체로 초기화
		Qna q = new Qna();
		q.setInqNo(inqueryNo);
		q.setInqTitle(inqTitle);
		q.setInqQuery(inqContent);
		
		// Service단 메소드 호출
		int result = new InfoService().updateQna(q);
		
		// 응답뷰 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 문의를 수정하였습니다.");
			response.sendRedirect(request.getContextPath()+"/qnadetail.in?ino="+inqueryNo);
		}else {
			request.setAttribute("errorMsg", "문의 수정에 실패하였습니다.");
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
