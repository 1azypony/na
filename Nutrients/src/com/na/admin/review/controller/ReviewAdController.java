package com.na.admin.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.review.model.service.ReviewService;
import com.na.template.model.vo.PageInfo;
import com.na.user.review.model.vo.Review;

/**
 * Servlet implementation class ReviewAdController
 */
@WebServlet("/reviewadlist.re")
public class ReviewAdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ----- 페이징 처리 ------
		// 기본적으로 구해야 하는 변수들
		int listCount; // 현재 총 게시글 갯수
		int currentPage; // 현재 보여질 페이지 (즉, 사용자가 요청한 페이지 )
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
		
		// 위의 변수들을 이용해서 계산해서 구해야 하는 변수들 
		int maxPage; // 가장 마지막 페이지가 몇번페이지인지(총 페이지수 )
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		// * listCount : 현재 총 게시글 갯수 (단, STATUS 값이 'Y'일 경우)
		listCount = new ReviewService().selectListCount();
				
		// * currentPage : 현재페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지의 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1 )/pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 1. 페이징 바 만들 때 필요한 객체 셋팅 
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,
				                   maxPage,startPage,endPage);
		
		// 2.현재 사용자가 요청한 페이지 (currentPage)에 보여질 게시글 리스트 요청하기
		ArrayList<Review> list = new ReviewService().selectList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		//일반게시판 리스트 화면 포워딩 테스트
	    request.getRequestDispatcher("views/admin/review/reviewManagement.jsp").forward(request, response);	
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
