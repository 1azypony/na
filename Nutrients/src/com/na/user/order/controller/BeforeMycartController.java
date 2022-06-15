package com.na.user.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.vo.Member;
import com.na.user.order.model.service.OrderService;
import com.na.user.order.model.vo.MyCart;

/**
 * Servlet implementation class BeforeMycartController
 */
@WebServlet("/beforMycart.ca")
public class BeforeMycartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeforeMycartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if((Member)request.getSession().getAttribute("loginUser")==null) {
			request.setAttribute("errorMsg", "로그인 후 이용하세요");
			request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
		}
		
		//POST인코딩
		request.setCharacterEncoding("UTF-8");
		
		//현재 로그인한 유저 id값 세팅 
		Member loginUser= (Member)request.getSession().getAttribute("loginUser");
		
		//현재 장바구니에 담을 상품 번호 
		int pNo = Integer.parseInt(request.getParameter("pNo"));

		//제품 선택 갯수
		int amount = Integer.parseInt(request.getParameter("amount"));
		//제품 총 가격
		int total = Integer.parseInt(request.getParameter("sum"));
		System.out.println(loginUser.getUserNo());
		System.out.println(pNo);
		System.out.println(amount);
		//Service단으로 제품 디테일에서 가져온 값 세팅해주기 
		int result = new OrderService().myCartProductInsert(loginUser.getUserNo(), pNo, amount);

		if(result>0) {
			//장바구니 제품추가 성공후 장바구니 리스트 전부 검색하여 list에 담아주기
			ArrayList<MyCart> cart_list = new OrderService().myCartProductSelect(loginUser.getUserId());
			
			request.getSession().setAttribute("alertMsg", "장바구니 추가에 성공하였습니다.");
			request.setAttribute("cart_list", cart_list);
			
			request.getRequestDispatcher("views/user/order/user_order_cart.jsp").forward(request, response);
		}else {
			//장바구니 제품추가 실패 
			request.getSession().setAttribute("alertMsg", "장바구니 추가에 실패하였습니다.");
			
			response.sendRedirect(request.getContextPath()+"/proDetail.pr");
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
