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
import com.na.user.order.model.vo.Purchase;

/**
 * Servlet implementation class PurchaseSucessController
 */
@WebServlet("/purSucess.pu")
public class PurchaseSucessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PurchaseSucessController() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
        
   			String sendname = request.getParameter("sendname");
   			String phone = request.getParameter("phone");
   			int totPrice = Integer.parseInt(request.getParameter("totPrice"));
   			String email = (String)request.getParameter("email");
			String list = request.getParameter("list");
			String address = request.getParameter("address");
			
			
			//회원번호 넘기고 
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			int memNo = loginUser.getUserNo();
			
			int result = new OrderService().insertPurchase(address, list, memNo);
			
			String[] list2 = list.split("/");
			
			ArrayList<Purchase> p_list = new ArrayList<Purchase>();
			
			if(result>0) {
				//성공
				
				for(int i=0; i<list2.length; i++) {
					
					p_list.addAll(new OrderService().selectCompletePurchaseList(list2[i], memNo));
				}
				
				request.getSession().setAttribute("alertMsg", "결제가 성공되었습니다.");
				request.setAttribute("purlist", p_list);
				
				request.getRequestDispatcher("views/user/order/user_order_orderResult.jsp").forward(request, response);
			
			}else {
				//실패
				request.getSession().setAttribute("alertMsg", "결제가 실패하였습니다.");
				
				response.sendRedirect(request.getContextPath());
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
