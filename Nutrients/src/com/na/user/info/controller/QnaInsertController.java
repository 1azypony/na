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
 * Servlet implementation class QnaInsertController
 */
@WebServlet("/qnainsert.in")
public class QnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 요청시, 전달값 뽑기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 히든으로 넘겨옴.
		String userNo = request.getParameter("userNo");
		
		// VO객체로 가공
		Qna q = new Qna();
		q.setInqTitle(title);
		q.setInqQuery(content);
		q.setUserNo(userNo);
		
		// Service단 메소드 호출
		int result = new InfoService().insertQna(q);
		
		// 응답뷰 호출
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "문의를 성공적으로 등록하였습니다.");
			request.removeAttribute("alertMsg");
			response.sendRedirect(request.getContextPath()+"/qnalist.in?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "문의 등록에 실패하였습니다.");
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
