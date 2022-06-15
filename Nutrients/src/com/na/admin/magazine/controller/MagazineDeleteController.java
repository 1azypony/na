package com.na.admin.magazine.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.magazine.model.service.MagazineService;

/**
 * Servlet implementation class MagazineDeleteController
 */
@WebServlet("/delete.mg")
public class MagazineDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 글번호 뽑기
				int magNo = Integer.parseInt(request.getParameter("mno"));
				
				int result = new MagazineService().deleteMagazine(magNo);
				
				if(result > 0) { // 성공 => /na/adminlist.mg?currentPage=1 url 재요청
					
					request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
					response.sendRedirect(request.getContextPath() + "/adminlist.mg?currentPage=1");
				}
				
				
				else { // 실패 => 에러페이지 포워딩
					request.setAttribute("errorMsg", "게시글 삭제 실패");
					request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
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
