package com.na.user.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.review.model.service.ReviewService;
import com.na.user.review.model.vo.Review;

/**
 * Servlet implementation class ReviewThumnailListController
 */
@WebServlet("/review3list.re")
public class ReviewThumnailListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewThumnailListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		// 사진게시판 리스트페이지에 필요한 데이터들을 우선적으로 조회
		ArrayList<Review> list2 = new ReviewService().selectReThumbnailList();
		
		// 수화물 보내기
		request.setAttribute("list2", list2);
		
		// 사진게시판 리스트화면 포워딩
		request.getRequestDispatcher("views/user/review/review.jsp").forward(request, response);
		
		//System.out.println(list.get(0).getMagImgPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
