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
 * Servlet implementation class MycartDeleteController
 */
@WebServlet("/mycartDel.ca")
public class MycartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MycartDeleteController() {
        super();
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] list = (String[])request.getParameterValues("cartNo");
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		  
		String userId = loginUser.getUserId();
		
		String arr = list[0];
		String[] cartNo= arr.split("/");
		int result = 0;
		
		for(int i=0; i<cartNo.length; i++) {
			
			int cartNo1 = Integer.parseInt(cartNo[i]);	

			 result = new OrderService().cartDelete(cartNo1);
		}
		if(result>0) {
			//삭제 성공
			ArrayList<MyCart> cart_list = new OrderService().myCartProductSelect(userId);
			
			request.getSession().setAttribute("alertMsg", "제품 삭제에 성공하였습니다.");
			request.setAttribute("cart_list", cart_list);
			
			request.getRequestDispatcher("views/user/order/user_order_cart.jsp").forward(request, response);
		}else {
			//삭제 실패 
			request.getSession().setAttribute("alertMsg", "장바구니 삭제에 실패하였습니다.");
			
			response.sendRedirect(request.getContextPath() + "/beforMycart.ca");
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
