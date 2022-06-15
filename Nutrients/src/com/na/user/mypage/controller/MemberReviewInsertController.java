package com.na.user.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.na.template.MyFileRenamePolicy;
import com.na.user.mypage.model.service.MypageService;
import com.na.user.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberReviewInsertController
 */
@WebServlet("/insert.my")
public class MemberReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		//enctype이 잘 걸려있나 확인하기 (multipart/form-data로 전송되었는지부터 검사)
		if(ServletFileUpload.isMultipartContent(request)) {
					//잘 전송되었을 경우 true
					
					//1. 전달된 첨부파일에 대한 처리할 내용 지정
					//1-1. 최대 용량지정(byte단위)
					int maxSize = 10 * 1024 * 1024;
					
					//1-2. 저장경로 지정(resources폴더의 thumbnail_upfiles폴더)
					//절대 경로에서 시작점은 WebContent임!!
					String savePath =  request.getSession().getServletContext().getRealPath("/resources/upfiles/");
					
					//2. 전달된 파일명을 수정 후 서버에 업로드까지 해주기 
					MultipartRequest multirequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
						
					//3. 요청 시 전달값 뽑기 
					//Board테이블에 Insert할 데이터 먼저 뽑기 
					Review R = new Review();
					
					R.setRevTitle(multirequest.getParameter("title"));
					R.setRevDes(multirequest.getParameter("review_context"));
					R.setRevPath("/na/resources/upfiles/" + multirequest.getFilesystemName("review_file"));
					String cartNo = multirequest.getParameter("cartNo");
//					System.out.println(cartNo + "받아왔나");
					int result = new MypageService().insertMyReview(R, cartNo);
					
					if(result>0) {
						//성공
						request.getSession().setAttribute("alertMsg", "후기 작성에 성공하였습니다.");
						
						response.sendRedirect(request.getContextPath()+"/beforepur.my?currentPage=1");
						
					}else {
						//실패

						
						request.getRequestDispatcher("views/user/myPage/mypageReviewWrite.jsp").forward(request, response);
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
