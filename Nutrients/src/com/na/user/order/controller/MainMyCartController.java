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
 * Servlet implementation class MainMyCartController
 */
@WebServlet("/mainMycart.my")
public class MainMyCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainMyCartController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if((Member)request.getSession().getAttribute("loginUser")!=null) {
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		ArrayList<MyCart> list= new OrderService().selectCartlist(userNo);
		
		if(!list.isEmpty()) {
			//조회 성공
			request.setAttribute("cart_list", list);
			
			request.getRequestDispatcher("/views/user/order/user_order_cart.jsp").forward(request, response);
			
		}else {
			//조회 실패
			request.getSession().setAttribute("alertMsg", "장바구니에 제품이 없습니다!");
			
			response.sendRedirect(request.getContextPath());
		}}else {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용해주세요");
			response.sendRedirect(request.getContextPath()+"/beforeLog.me");
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
