package com.na.admin.magazine.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.na.admin.magazine.model.service.MagazineService;
import com.na.admin.product.model.service.ProductService;
import com.na.template.MyFileRenamePolicy;
import com.na.user.magazine.model.vo.Magazine;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MagazineUpdateController
 */
@WebServlet("/update.mg")
public class MagazineUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Post 방식이므로 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// enctype 이 multipart/form-data 로 잘 전송이 되었나 검사
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1. 파일과 관련된 처리내용들 지정 (파일의용량, 저장경로)
			// 1_1. 파일의 용량 (byte 단위로)
			int maxSize = 10 * 1024 * 1024; // 10mbyte
			
			// 1_2. 전달된 파일을 저장시킬 서버의 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			// 2. 전달된 파일명을 수정하고 그리고 서버에 업로드
			// MultipartRequest 객체 생성구문 
			// => HttpServletRequest 객체를 MultipartRequest 형식으로 변환
			// => 파일명 수정
			// => 서버로 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 본격적으로 SQL 문을 실행할 때 필요한 요청 시 전달값들을 뽑아서 변수에 기록 및 VO 객체로 가공
			// - 공통적으로 수행 : magazine 테이블  Update 구문 실행
			int magNo = Integer.parseInt(multiRequest.getParameter("mno"));
			String magTitle = multiRequest.getParameter("title");
			String magDes = multiRequest.getParameter("content");
			
			Magazine m = new Magazine();
			m.setMagNo(magNo);
			m.setMagTitle(magTitle);
			m.setMagDes(magDes);
			
			if(multiRequest.getOriginalFileName("file")!=null) { //사진 포함 업데이트시
				
				m.setMagImgPath("/na/resources/upfiles/"+multiRequest.getFilesystemName("file"));
			
				int result = new MagazineService().updateMagazine(m);
				
				if(result >0) {// 성공
					
					request.getSession().setAttribute("alertMsg", "성공적으로 수정 되었습니다.");
					response.sendRedirect(request.getContextPath() + "/adminDetail.mg?mno=" + magNo);
					
					
				}else {// 실패 => 에러페이지로 포워딩
					request.setAttribute("errorMsg", "수정 실패");
					request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
				}
			
			}else { // 사진 미포함 업데이트시
			
				int result = new MagazineService().updateMagazine2(m);
				
				if(result >0) {// 성공
					
					request.getSession().setAttribute("alertMsg", "성공적으로 수정 되었습니다.");
					response.sendRedirect(request.getContextPath() + "/adminDetail.mg?mno=" + magNo);
					
					
				}else {// 실패 => 에러페이지로 포워딩
					request.setAttribute("errorMsg", "수정 실패");
					request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
				}
				
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
