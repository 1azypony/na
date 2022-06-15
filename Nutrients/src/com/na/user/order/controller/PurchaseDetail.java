package com.na.user.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.member.model.vo.Member;
import com.na.user.order.model.service.OrderService;
import com.na.user.order.model.vo.Purchase;

/**
 * Servlet implementation class PurchaseDetail
 */
@WebServlet("/detail.pur")
public class PurchaseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseDetail() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cartno = (String)(request.getParameter("cartno"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Purchase p_2 = new OrderService().selectDetailPurchase(cartno, userNo);
		
		if(p_2!=null) {
			//조회 성공
			request.setAttribute("p_list", p_2);
			
			request.getRequestDispatcher("views/user/order/user_order_detail.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "구매상세내역 조회에 실패하였습니다.");
			
			request.getRequestDispatcher("views/user/order/user_order_orderResult.jsp").forward(request, response);
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
