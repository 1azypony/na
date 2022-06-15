package com.na.admin.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.info.model.service.InfoService;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Qna;
import com.na.user.member.model.vo.Member;

/**
 * Servlet implementation class InqueryListController
 */
@WebServlet("/inquerylist.in")
public class InqueryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/***** 페이징 바 *****/
		int listCount; // 현재 총  게시글 개수
		int currentPage; // 현재 보여질 페이지(주소창에 보여질 페이지)
		int pageLimit; // 한  페이지당 최대로 보여질 페이징바의 개수
		int boardLimit; // 한 페이지에 보여질 게시물의 최대 개수
		
		int maxPage; // 가장 마지막 페이지가 몇번페이지인지 (총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		// 현재 총 게시물의 개수를 SELECT를 통해 반환받음
		listCount = new InfoService().selectListCount();
		
		// qnaList.in?currentPage=X
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// 한페이지의 페이징바 개수
		pageLimit = 10;
		
		// 한페이지의 최대 게시물 개수
		boardLimit = 10;
		
		// ex) 100개의 게시물(status='y')이 있다고 한다면
		// listCount(100개) / boardLimit(페이지당 10개) = maxPage(10개)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// 만약 현재 페이지가 20라고 한다면
		// 1~10 => 현재페이지가 5라면
		// 시작페이지 = [((5-1)/10)*10]+1 = 1
		// 끝 페이지 = 1 + 10 - 1 = 10
		// 11~20 => 현재페이지가 12라면
		// 시작페이지 = ((12-1)/10)*10 + 1 = 11
		// 끝 페이지 = 11 + 10 - 1 = 20
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지 설정
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		/***** 페이징바를 만들때 필요한 객체 세팅 ******/
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		/***** 리스트를 보여 줄 select문 *****/
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// 사용자가 요청한 페이지에 보여질 게시판 리스트 뿌려주기
		ArrayList<Qna> list = new InfoService().selectInqList(pi,userNo);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/admin/info/inqueryList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
