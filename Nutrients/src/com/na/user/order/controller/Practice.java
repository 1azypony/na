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

/**
 * Servlet implementation class Practice
 */
@WebServlet("/Practice.practice")
public class Practice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Practice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cartNo = request.getParameter("cartNo");
		
		ArrayList<String> aaa = new OrderService().practice(cartNo);
		ArrayList<String> bbb = new OrderService().practice2(cartNo);
		 
		/*	Integer.parseInt(aaa.get(0)) - PUR_NO
		 *  aaa.get(1) - PUR_ADDRESS
		 *  Integer.parseInt(aaa.get(2)) - PUR_DATE 숫자
		 *  Integer.parseInt(aaa.get(3)) - SYSDATE 숫자
		 *  Integer.parseInt(aaa.get(4)) - SYSDATE-1 숫자
		 *  Integer.parseInt(aaa.get(5)) - SYSDATE-2 숫자
		 *  bbb.get(0) - 제품명
		 *  Integer.parseInt(bbb.get(1)) - 제품개수
		 *  Integer.parseInt(bbb.get(2)) - 제품가격
		 *  
		 *  int ddd > 1 or 2 or 3 ( 1 - 결제완료 / 2 - 배송중 / 3 - 배송완료 )
		 */
		
		int ccc = Integer.parseInt(aaa.get(2)); // 구매일
		int ddd = 0;
		
		
		if(ccc==Integer.parseInt(aaa.get(3))) {
			ddd=1;
		}else if(ccc==Integer.parseInt(aaa.get(4))) {
			ddd=2;
		}else {
			ddd=3;
		}
		int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int listCount9 = new MypageService().selectListCount9(uN);
		request.setAttribute("listCount9", listCount9);
		
		request.setAttribute("purNo", Integer.parseInt(aaa.get(0)));
		request.setAttribute("add", aaa.get(1));
		request.setAttribute("ddd", ddd);
		request.setAttribute("proName", bbb.get(0));
		request.setAttribute("proNum", Integer.parseInt(bbb.get(1)));
		request.setAttribute("price", Integer.parseInt(bbb.get(1))*Integer.parseInt(bbb.get(2)));
		
//		System.out.println(Integer.parseInt(aaa.get(0)));
//		System.out.println(aaa.get(1));
//		System.out.println(ddd);
//		System.out.println(bbb.get(0));
//		System.out.println(Integer.parseInt(bbb.get(1)));
//		System.out.println(Integer.parseInt(bbb.get(1))*Integer.parseInt(bbb.get(2)));

		request.getRequestDispatcher("views/user/myPage/mypageDelivery.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
