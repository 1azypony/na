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
 * Servlet implementation class QnaDeleteController
 */
@WebServlet("/qnadelete.in")
public class QnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 시, 전달값 뽑기.
		int inqueryNO = Integer.parseInt(request.getParameter("ino"));
		// ino=<%=q.getInqNo()%>
		System.out.println(inqueryNO);
		
		Qna q = new Qna();
		q.setInqNo(inqueryNO);
		
		// Service단 메소드 호출
		int result = new InfoService().deleteQna(inqueryNO);
		
		// 응답뷰 지정
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/qnalist.in?currentPage=1");
		}else {
			request.setAttribute("errorMsg", "공지사항 삭제 실패");
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
