package com.na.admin.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.info.model.service.FaqService;
import com.na.template.model.vo.PageInfo;
import com.na.user.info.model.vo.Faq;

/**
 * Servlet implementation class FaqController
 */
@WebServlet("/faqlist.fa")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

						                
		// 2.현재 사용자가 요청한 페이지 (currentPage)에 보여질 게시글 리스트 요청하기
		ArrayList<Faq> list = new FaqService().selectfaqList();
		
		request.setAttribute("list", list);
		

		
		//일반게시판 리스트 화면 포워딩 테스트
	    request.getRequestDispatcher("views/admin/info/faq.jsp").forward(request, response);	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
