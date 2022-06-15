package com.na.admin.magazine.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.magazine.model.service.MagazineService;
import com.na.user.magazine.model.vo.Magazine;

/**
 * Servlet implementation class AdminMagazineDetailController
 */
@WebServlet("/adminDetail.mg")
public class AdminMagazineDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMagazineDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get방식 매거진 글 번호 한개를 이용해서 해당 글을 조회 후 상세보기 페이지에 뿌려주기
		
		// 인코딩은 (Post방식일 때만)
		
		// 사용자가 요청 시 전달한 해당 글번호 뽑기
		int magNo = Integer.parseInt(request.getParameter("mno"));
		
			Magazine m = new MagazineService().selectMagazine(magNo);
			
			// 조회한 내용을 request 에 담아서 전달
			request.setAttribute("m", m);
			// 포워딩 처리
			request.getRequestDispatcher("views/admin/magazine/adminMagazineDetailView.jsp").forward(request, response);			
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
