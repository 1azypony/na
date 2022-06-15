package com.na.user.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PurchaseController
 */
@WebServlet("/purcahse.pu")
public class PurchaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String list = request.getParameter("cartNo");
		String del_address = request.getParameter("delivery_add");
		String sendName = request.getParameter("sendName");
		String phone = request.getParameter("phone");
		
		int totPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String[] arrival = (String[])request.getParameterValues("arrival");
		
		String arr = "";
		
		if(arr!=null) {
			arr = String.join(", ", arrival);
		}	
		
		
		String email = request.getParameter("email");
		
		
		request.getSession().setAttribute("del_address", del_address);
		request.getSession().setAttribute("sendName", sendName);
		request.getSession().setAttribute("phone", phone);
		request.getSession().setAttribute("totPrice", totPrice);
		request.getSession().setAttribute("arrival", arrival);
		request.getSession().setAttribute("email", email);
		request.getSession().setAttribute("list", list);
		
	
		
		request.getRequestDispatcher("views/user/order/user_order_payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
