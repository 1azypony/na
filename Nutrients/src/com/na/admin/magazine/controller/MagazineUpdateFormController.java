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
 * Servlet implementation class MagazineUpdateFormController
 */
@WebServlet("/updateform.mg")
public class MagazineUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 우선적으로 수정하기 폼에서 필요로 하는 데이터들을 요청
				// 카테고리 전체조회, 해당게시글 상세조회, 해당게시글에 딸린 첨부파일 상세조회
				MagazineService mService = new MagazineService();
				
				int magNo = Integer.parseInt(request.getParameter("mno"));
				
				Magazine m = mService.selectMagazine(magNo);
				// 글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일
				
				// 수하물 붙이기
				request.setAttribute("m", m);
//				System.out.println(m);
				// 일반게시글 수정하기 폼 포워딩
				request.getRequestDispatcher("views/admin/magazine/magazineUpdateForm.jsp").forward(request, response);
			}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
