package com.na.admin.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.info.model.service.NoticeService;
import com.na.user.info.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
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
		
		String notiTitle = request.getParameter("title");
		String notiDate = request.getParameter("date_1");
		String notiDes = request.getParameter("des");
		
		Notice n = new Notice();
		n.setNotiTitle(notiTitle);
		n.setNotiDate(notiDate);
		n.setNotiDes(notiDes);
		
		//3) NoticeService의 어떤 메소드를 호출해서 결과 받기
		int result = new NoticeService().insertNotice(n);
		
		//4) 결과에 따라 응답페이지 지정
		if(result>0) {//성공
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다!!");
			response.sendRedirect(request.getContextPath()+"/noticelist.no?currentPage=1");
			
		}else { //실패
			
			request.setAttribute("errorMsg", "공지사항 등록이 실패!!");
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
