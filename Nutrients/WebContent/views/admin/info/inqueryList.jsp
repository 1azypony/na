<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.info.model.vo.Qna, java.util.ArrayList, com.na.template.model.vo.PageInfo" %>   
<% 
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 관련 변수
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

     

    <title>1:1문의</title>
    <style>
     div{
          box-sizing: border-box;
        /* border: 1px solid red;*/
        
      }
      .wrap{
          width: 1000px;
          height: 1000px;
          margin: auto; /*가운데정렬*/
      }
    
      body{
        font-family: "Sofia", sans-serif;
       }

       /* content영역 */
       .content{
           width: 1000px;
           height : 1100px;
           margin-top : 50px;
           padding-right: 50px;
       }
       .content_title{
           float:right;
           width:85%;
           height:10%;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;
            /* padding-left:50px; */
            padding-right: 50px;
          /* border:1px solid red;*/
       }
       
        .content_detail{
            float:right;
            width: 850px;
            height: 760px;
           /* border:1px solid red; */
        }
        #content_1 {
           /* border : 1px solid red;*/
            width: 900px;
             height: 5%;
        }

       
    /*리스트 */
    #button{
      margin-top: 30px;
      margin-left: 80%;
  }
    .table>thead>th{
            text-align: center;
        }
    .table>tbody>td{
        border :1px solid white;
        text-align: left;
    }
    .table>tbody>tr:hover{
        background-color: lightgrey;
        cursor: pointer;
    }

    #page {margin-left: 200px; }


</style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>
    <div class="wrap">
   
       <div class="content">
           <div class="content_title" style="color:rgba(36, 49, 121, 0.9);">
            1:1 문의글 관리
          
           </div>
          
            <div class="content_detail">
                <div id = content_1>
                    <br>
                        <form action="<%=contextPath %>/inquerysearch.in" method="get" align="center" style="float: right;  ">
                            검색어 : <input type="text" name="keyword" style="width: 300px; height: 34.5px;"> <!-- name 속성 : key 값-->
                   <input type="hidden" name="currentPage" value="1">
                        <button type="submit" class="btn btn-light" style="background-color:rgba(24,189,234, 0.5); "> 검색 </button> 
                        </form>
                </div>
                <br><br>
                <hr style="border:1px solid rgba(73, 71, 71, 0.5)";>
            
            <table align="center" class="table table-hover" class="table" >
                <thead align="center">

                  <tr>
                    <th width="80" >글번호</th>
                    <th width="200" >제목</th>
                    <th width="90">작성자</th>
                    <th width="110">작성일</th>
                    <th width="90">답변여부</th>
                  </tr>
                </thead>
                <tbody align="center">
                    <%if(loginUser != null){ %>
	                    <%if(list.isEmpty()){ %>
	                        <tr>
	                        	<td colspan="5">조회된 리스트가 없습니다.</td>
	                        </tr>
	                    <%}else{ %>  
	                    	<%for(Qna q : list){ %>
	                    	<tr>  
	                            <td><%=q.getInqNo() %></td>
	                            <td><%=q.getInqTitle() %></td>
	                            <td><%=q.getUserNo() %></td>
	                            <td><%=q.getInqDate() %></td>
	                            <td><%=q.getStatus() %></td>
	                        </tr>
	                        <%} %>
	                    <%} %>
	                <%}else{ %>
	                	<td colspan="5">로그인 후 이용하시기 바랍니다.</td>
	                <%} %>       
                </tbody>
             </table>
             <script>
             	$(function(){
             		$(".table>tbody>tr").click(function(){
             			var ino = $(this).children().eq(0).text();
             			location.href = "<%=contextPath%>/inquerydetail.in?ino="+ino;
             		});
             	});
             </script>
             <div id="button" style="margin-left: 745px;">
                
              
              </div> 
          	
    
              	<div id="qnalist_paging" class="page_nation" style="margin-left:250px; margin-top:50px;">
                <ul class="pagination">
		            <%if(currentPage==1){ %>
		            <%}else{ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/inquerylist.in?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
		            <%} %>
					<%for(int p = startPage; p<=endPage; p++){ %>
						<%if(p!=currentPage){ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/inquerylist.in?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
					<%} else {%>
		                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
						<%}} %>
		            <%if(currentPage==maxPage || maxPage==0){ %>
		            <%}else{ %>				              			              
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/inquerylist.in?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
		            <%} %>
                  </ul>
                  
            	</div>
             </div>
            </div>
     
         

            </div>
    </div>
    <!--푸터-->
    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>