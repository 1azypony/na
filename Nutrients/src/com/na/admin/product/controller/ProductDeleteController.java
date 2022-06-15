package com.na.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.na.admin.product.model.service.ProductService;

/**
 * Servlet implementation class ProductDeleteController
 */
@WebServlet("/proDelete.pr")
public class ProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int proNo = Integer.parseInt(request.getParameter("pno"));
		
		int result = new ProductService().deleteProductAdmin(proNo);
		
		if(result >0) {// 성공
			
			request.getSession().setAttribute("alertMsg", "삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/proManageList.pr?currentPage=1");
			
			
		}else {// 실패 => 에러페이지로 포워딩
			request.setAttribute("errorMsg", "구매내역 조회에 상세내역이 이용되어야합니다. 진열상태를 숨김으로 바꿔주세요.");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
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
