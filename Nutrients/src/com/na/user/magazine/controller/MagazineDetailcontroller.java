package com.na.user.magazine.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.user.magazine.model.service.MagazineService;
import com.na.user.magazine.model.vo.Magazine;

/**
 * Servlet implementation class MagazineDetailcontroller
 */
@WebServlet("/detail.mg")
public class MagazineDetailcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineDetailcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get방식 ?!
		// 매거진 글 번호 한개를 이용해서 해당 글을 조회 후 상세보기 페이지에 뿌려주기
		
		// 인코딩은 (Post방식일 때만)
		
		// 사용자가 요청 시 전달한 해당 글번호 뽑기
		int magNo = Integer.parseInt(request.getParameter("mno"));
//		System.out.println(magNo);
		// 컨트롤러에서 조회수 증가하는 기능 구현할 건데 조회 전 조회수가 카운트되는 서비스 호출
		int result = new MagazineService().increaseCount(magNo);
		// 한건만 조회수가 올라가야 하니까 unique제약조건이 있어야 함
		
		// 조회수 증가가 성공했다면 상세조회 서비스 요청 후 상세보기 페이지로 포워딩
		if(result > 0) { // 조회수 증가 성공 => 게시글 상세조회
			
			Magazine m = new MagazineService().selectMagazine(magNo);
			
			
			// 조회한 내용을 request 에 담아서 전달
			request.setAttribute("m", m);
			
			// 포워딩 처리
			request.getRequestDispatcher("views/user/magazine/magazineDetailView.jsp").forward(request, response);			
		}
		else { // 에러페이지
			request.setAttribute("errorMsg", "게시글 상세조회 실패");
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
