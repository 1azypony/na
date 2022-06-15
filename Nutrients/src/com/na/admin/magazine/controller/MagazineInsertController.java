package com.na.admin.magazine.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.na.admin.magazine.model.service.MagazineService;
import com.na.template.MyFileRenamePolicy;
import com.na.user.magazine.model.vo.Magazine;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdmininsertController
 */
@WebServlet("/insert.mg")
public class MagazineInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagazineInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			//1.전송된 첨부파일에 대한 처리할 내용 지정
			//1_1 최대 용량 지정 (byte)
			int maxSize = 10*1024*1024;
			//1_2 저장경로 지정(resources)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			// 2. 전달된 파일명을 수정 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청 시 전달 값 뽑을 수 있다.
			Magazine m = new Magazine();
			
			m.setMagTitle(multiRequest.getParameter("title"));
			m.setMagDes(multiRequest.getParameter("content"));

			
			m.setMagImgPath("/na/resources/upfiles/"+multiRequest.getFilesystemName("file"));
			
			int result = new MagazineService().insertMagazine(m);
			
			if(result >0) {// 성공
				
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/adminlist.mg?currentPage=1");
				
				
			}else {// 실패 => 에러페이지로 포워딩
				request.setAttribute("errorMsg", "업로드 실패");
				request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
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
