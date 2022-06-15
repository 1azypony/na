package com.na.admin.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.review.model.service.ReviewService;
import com.na.user.review.model.vo.Review;

/**
 * Servlet implementation class ReviewAdDetailController
 */
@WebServlet("/reviewadDetail.re")
public class ReviewAdDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//사용자가 요청 시 전달한 해당 글번호 뽑기
		 int revNo = Integer.parseInt(request.getParameter("rno"));
					
		Review r= new ReviewService().selectReview(revNo);
			
	// 조회한 내용을 request 에 담아서 전달
		request.setAttribute("r", r);
	// 포워딩 처리
      request.getRequestDispatcher("views/admin/review/reviewManagementDetail.jsp").forward(request, response);
						
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
