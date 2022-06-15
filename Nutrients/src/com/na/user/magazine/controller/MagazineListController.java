package com.na.user.magazine.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.template.model.vo.PageInfo;
import com.na.user.magazine.model.service.MagazineService;
import com.na.user.magazine.model.vo.Magazine;

/**
 * Servlet implementation class MagazineListController
 */
@WebServlet("/list.mg")
public class MagazineListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ------페이징 처리 ------
		// 기본적으로 구해야하는 변수
		int listCount; // 현재 총 게시글 갯수
		int currentPage; // 현재 페이지 
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 
		int boardLimit; // 한페이지에 보여질 게시글의 최대 갯수 (한페이지당 몇개 보여줄건지)
		
		// 위의 변수들을 이용해 계산해 구할 변수들
		int maxPage; // 총 페이지
		int startPage; // 시작 페이지
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		// *listCount : 현재 총 게시글 갯수 ( 단, STATUS 값이 'Y'일 경우(
		listCount = new MagazineService().selectListCount();
		
		// System.out.println(listCount);
		
		// 현재페이지
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// 한페이지에 보여질 최대 갯수
		pageLimit = 10;
		
		// 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 9;
		
		// 가장 마지막 페이지가 몇 번째 페이지인지
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage =   (currentPage - 1) / pageLimit  * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
					
					endPage = maxPage;
				}
		
		
		// 페이징 바 만들 때필요한 객체 셋팅
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,
				maxPage, startPage, endPage);
		
		// 현재 사용자가 요청한 페이지에 보여질 게시글 리스트 요청
		ArrayList<Magazine> list = new MagazineService().selectList(pi);
		
		
		//System.out.println(list);
		
		request.setAttribute("list", list);

		request.setAttribute("pi", pi);
	
		request.getRequestDispatcher("views/user/magazine/magazineListView.jsp").forward(request, response);
		
		// 매거진 리스트 화면 포워딩
		//request.getRequestDispatcher("views/user/magazine/magazineListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
