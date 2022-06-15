<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.product.model.vo.Product, com.na.template.model.vo.PageInfo" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NUTRIENTS ALMIGHTY</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

    <style>

        *{
                font-family: 'Noto Sans KR', sans-serif;
            }

      div{
          box-sizing: border-box;
          /* border: 1px solid red; */
          /*가이드라인 */
      }





      /* content영역 */
      .content{

           width: 1000px;
           height : 1100px;
           margin : auto;
           margin-top : 50px;
       }
       .content_title{
           margin: auto;
           width:80%;
           height:100px;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;

           /* border:1px solid red; */
       }


        .content_detail{
            float:right;
            width: 1000px;
            height: 600px;
            /* border:1px solid red; */
            margin:auto;
            margin-top:50px;

        }

                
        #mem_paging{
        	width:400px;
            margin: auto;
            margin-top: 50px;
        	margin-bottom: 50px;
        }



      #search_area{
          font-weight: 700;
          width: 60%;
          margin:auto;
      }
      .suj{
        width:45px;
        height:32px;
        margin-right:5px;
      }
              #enrollPro {

            margin-left: 880px;
            

        }




    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../common/header_admin.jsp" %>
       <div class="content">
        <div class="content_title">
             <div style="color:rgba(36, 49, 121, 0.9)">
                 제품관리
                 <hr>
             </div>
        </div>
        <div class="content_category_title"></div>

         
         <div class="content_detail">

            <div id="search_area" style="margin-left:270px; margin-bottom:40px;">
                <form action="<%=contextPath%>/proManageSearch.pr" method="get">
				<input type="hidden" name="currentPage" value="1">
                <span style="margin:10px;">검색어</span>
                <input type="text" name="keyword" maxlength="30" style="margin:10px; width:300px;" required>
                <button type="submit" class="btn btn-light" style="margin:10px; color:white; background-color:rgba(24,189,234, 0.5); height:35px;">검색</button>

                </form>
            </div>

					<table class="table table-hover">
                    	<thead>
                         	<tr>
                                <th>제품번호</th>
                                <th>제품이미지</th>
                                <th>제품명</th>
                                <th>제품가격</th>
                                <th>등록일자</th>
                                <th>재고상태</th>
                                <th>진열상태</th>
                                <th>수정/삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(Product p : list) {%>
                            <tr>
                                <th><%=p.getProNo() %></th>
                                <td><img width="100" height="100" src="<%=p.getProImgPath()%>"></td>
                                <td><%=p.getProName()%></td>
                                <td><%=p.getPrice()%></td>
                                <td><%=p.getProDate()%></td>
                                <td><%=p.getStock() %></td>
                                <td><%if(p.getStatus().equals("Y")){ %><%="진열중"%><%}else{ %><%="숨김"%><%} %></td>
                                <td><button type="button" class="btn btn-success btn-sm" style="opacity:0.7;" onclick="location.href='<%=contextPath%>/proEdit.pr?pno=<%=p.getProNo() %>'">수정</button><br>
                                    <button type="button" class="btn btn-danger btn-sm" style="opacity:0.7;" onclick="location.href='<%=contextPath%>/proDelete.pr?pno=<%=p.getProNo() %>'">삭제</button></td>
                            </tr>
                         <%} %>
                        </tbody>
                    </table>
                    
                    <div id="enrollPro">
                        <button onclick="location.href='<%=contextPath%>/proAdd.pr'" type="button" class="btn btn-light btn-sm"  style="opacity: 0.7; background-color: gray; color: white;">추가</button>
                    </div>
                    
            <div id="mem_paging" class="page_nation">
            <%if(list.size()!=0){ %> 
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proManageList.pr?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proManageList.pr?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>     
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>      
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			               
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proManageList.pr?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>                    
                    </ul>
            <%} %>
            </div>

         </div>
    </div>
    
<%@ include file="../common/footer_admin.jsp" %>
</body>
</html>