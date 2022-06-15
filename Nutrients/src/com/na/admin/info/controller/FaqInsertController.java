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
 * Servlet implementation class FaqInsertController
 */
@WebServlet("/insert.fa")
public class FaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1)인코딩 셋팅(post 방식)
	request.setCharacterEncoding("UTF-8");
	
	//2) 요청 시 전달값 뽑아서 변수에 기록, VO객체로 가공
	//제목, 작성일, 내용 
	
	String faqTitle = request.getParameter("titlef");
	String faqDes = request.getParameter("desf");
		
	Faq f = new Faq();
	f.setFaqTitle(faqTitle);
	f.setFaqDes(faqDes);
	int count = new FaqService().countF();
	if(count>9) {
		request.setAttribute("errorMsg", "FAQ는 최대 10개 등록 가능합니다.");
		request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
	}else {
	//3) FaqService의 어떤 메소드를 호출해서 결과 받기
	int result = new FaqService().insertFaq(f);
	
	//4) 결과에 따라 응답페이지 지정
	if(result>0) {//성공
		request.getSession().setAttribute("alertMsg", "성공적으로 faq이 등록되었습니다!!");
		response.sendRedirect(request.getContextPath()+"/faqlist.fa");
		
	}else { //실패
		
		request.setAttribute("errorMsg", "faq 등록이 실패!!");
		request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
		
	}
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
