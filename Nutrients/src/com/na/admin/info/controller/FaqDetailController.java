package com.na.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.info.model.service.FaqService;
import com.na.user.info.model.vo.Faq;

/**
 * Servlet implementation class FaqDetailController
 */
@WebServlet("/faqDetail.fa")
public class FaqDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 요청 시 전달한 해당 글번호 뽑기
	    int faqNo = Integer.parseInt(request.getParameter("fno"));
		
		Faq f= new FaqService().selectFaq(faqNo);
					
		// 조회한 내용을 request 에 담아서 전달
		request.setAttribute("f", f);
	
				
		// 포워딩 처리
      request.getRequestDispatcher("views/admin/info/faqDetail.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
