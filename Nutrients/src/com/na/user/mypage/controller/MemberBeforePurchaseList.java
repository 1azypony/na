package com.na.user.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.na.template.model.vo.PageInfo;
import com.na.user.member.model.vo.Member;
import com.na.user.mypage.model.service.MypageService;
import com.na.user.order.model.vo.Purchase;

/**
 * Servlet implementation class MemberBeforePurchaseList
 */
@WebServlet("/beforepur.my")
public class MemberBeforePurchaseList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberBeforePurchaseList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		
		
		listCount = new MypageService().selectListCount8(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
//		System.out.println(listCount);

		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 10;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (int)Math.floor((double)(currentPage - 1)/pageLimit)*pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
//		System.out.println(pi);
		//구매한 상품 조회 후 list페이지에 뿌려주기 
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getUserNo();
		ArrayList<Purchase> p_list = new ArrayList<Purchase>();
//		System.out.println(memNo);
		
		/*//사용자 개인의 구매완료된 모든 장바구니 리스트 조회
		ArrayList<String> cartList = new MypageService().selectCartList(memNo);
		String[] arr = {};
		
		for(String s : cartList) {
			
			arr = s.split("/");*/
		
			/*for(int i=0; i<arr.length; i++) {*/
		
		
		p_list = new MypageService().selectMypagePurchaseLsit(memNo, pi);

				/* } */
		
		if(!p_list.isEmpty()) {
			//조회 성공 
			request.setAttribute("plist", p_list);
			request.setAttribute("pi", pi);
			request.setAttribute("listCount", listCount);
			int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			int listCount9 = new MypageService().selectListCount9(uN);
			request.setAttribute("listCount9", listCount9);
			
			request.getRequestDispatcher("views/user/myPage/mypageOrderlist.jsp").forward(request, response);
		}else {
			//조회 실패 

			request.setAttribute("plist", p_list);
			request.setAttribute("pi", pi);
			request.setAttribute("listCount", listCount);
			int uN = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
			int listCount9 = new MypageService().selectListCount9(uN);
			request.setAttribute("listCount9", listCount9);
			request.getRequestDispatcher("views/user/myPage/mypageOrderlist.jsp").forward(request, response);
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
