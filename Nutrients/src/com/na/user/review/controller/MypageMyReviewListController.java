package com.na.user.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.review.model.service.ReviewService;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.service.InfoService;
import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.service.MypageService;
import com.na.user.review.model.vo.Review;

/**
 * Servlet implementation class MypageMyReviewListController
 */
@WebServlet("/mypageReviewList.re")
public class MypageMyReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if((Member)request.getSession().getAttribute("loginUser")!=null) {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		// ---- 페이징 처리 ----
		// 기본적으로 구해야 하는 변수들
		int listCount; // 현재 총 게시글 갯수
		int currentPage; // 현재 보여질 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수
		
		// 위의 변수들을 이용해서 계산해서 구해야 하는 변수들
		int maxPage; // 마지막이 몇 페이지인지
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new ReviewService().selectMyReviewCount(userNo);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (int)Math.floor((double)(currentPage - 1)/pageLimit)*pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = new ReviewService().selectMyReviewList(pi, userNo);

		int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int listCount9 = new MypageService().selectListCount9(uN);
		request.setAttribute("listCount9", listCount9);
		request.setAttribute("listCount", listCount);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/user/myPage/mypageMyReview_list.jsp").forward(request, response);
		
		}else {
			request.setAttribute("errorMsg", "로그인 후 이용하세요");
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
