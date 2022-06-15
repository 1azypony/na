package com.na.user.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.service.MypageService;
import com.na.user.order.model.service.OrderService;
import com.na.user.order.model.vo.MyCart;

/**
 * Servlet implementation class PurchaseBeforeController
 */
@WebServlet("/purbefor.pu")
public class PurchaseBeforeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseBeforeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  String list = (String)request.getParameter("cartNo");
		  
		  Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		  
		  String userId = loginUser.getUserId();
		  
		  ArrayList<MyCart> order_List = new ArrayList<MyCart>();
		  
		  String arr = list; 
		  String[] cartNo= arr.split("/"); 
		  
		  
		  for(int i=0; i<cartNo.length; i++) {
			  
			  int cartNo1 = Integer.parseInt(cartNo[i]);
			  
			  order_List.addAll((ArrayList<MyCart>)new OrderService().selectPurchaseList(cartNo1, userId));   
			 
		  }
		  
		 request.setAttribute("orderList", order_List);
		 request.setAttribute("list", list);

		 
		request.getRequestDispatcher("views/user/order/user_order_orderAddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
