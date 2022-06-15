package com.na.user.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.service.MypageService;
import com.na.user.order.model.vo.Purchase;
import com.na.user.product.model.vo.Product;

/**
 * Servlet implementation class MemberReviewInsertCotroller
 */
@WebServlet("/selectReview.my")
public class MemberReviewSelectCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewSelectCotroller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String purlist = request.getParameter("purlist");
		String cartNo = request.getParameter("cartNo");
		int listCount = Integer.parseInt(request.getParameter("listCount"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		
		
		//해당 회원이 해당 상품의 구매후기 선 작성되어있는지 조회
		int result = new MypageService().selectReview(cartNo);
		
		if(result>0) {
			//조회시 이미 작성한 리뷰가 있을 경우 
			request.getSession().setAttribute("alertMsg", "이미 작성된 후기가 존재합니다.");
			
			request.getRequestDispatcher("views/user/myPage/mypageOrderlist.jsp").forward(request, response);
		}else {
			//조회 시 이미 작성한 리뷰가 없을 경우 
			
			Product p = new MypageService().selectPurProduct(cartNo);
			
			request.setAttribute("p", p);

			int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			int listCount9 = new MypageService().selectListCount9(uN);
			request.setAttribute("listCount9", listCount9);

			request.setAttribute("loginUser", loginUser);

			request.setAttribute("cartNo", cartNo);
			
			
			request.getRequestDispatcher("views/user/myPage/mypageReviewWrite.jsp").forward(request, response);
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
