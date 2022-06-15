<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.review.model.vo.Review, com.na.template.model.vo.PageInfo"%>    
<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   // 검색하는 페이지 
   String keyword = (String)request.getAttribute("keyword");
   int category = (int)request.getAttribute("category");
   
   // 페이징바 관련 변수
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();
%>       
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 div{
          box-sizing: border-box;
         /* border: 1px solid red; */
          height : 200px;
      }
      .wrap{
          width: 1000px;
          height: 900px;
          margin: auto; /*가운데정렬*/
      }
      body{
        font-family: "Sofia", sans-serif;
       }
       /* content영역 */
       .content{
           /* border : 1px solid red; */
           width: 1000px;
           height : 900px;
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
            width:850px;
            height:750px;
            /* border:1px solid red; */

        }
        .cd_select{width:600px; height:60px;}
        .cd_select>div{
            display: inline-block;

        }
        .cd_select1{
            height:30px;
            width:100px;
        }
        .cd_select2{
            width:300px;
            height:25px;
        }
        .cd_select3{
            width:50px;
            height:30px;
            margin-top: 0px;
        }
        .cd_orderBy{ height:50px;}
        .cd_orderBy>a{
            text-decoration: none;
            color:black;
            font-size: 15px;
            font-weight: 700;
            
        }
        .cd_table{
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }
        .cd_table tr{border-bottom: 1px solid gray;}
        .cd_table_title{
            background-color: gainsboro;
        }
        .cd_button{
            float:right;
            width:50px;
            height:50px;
            margin-right: 70px;
            text-align: right;

        }
        .cd_button>input:hover{
            cursor:pointer;
            color: black;;
        }
        .cd_button>input{
            font-size: 20px;
            height: 30px;
            width:100px;
            background-color:rgba(24,189,234, 0.5);
            border:none;
            color: white;
            font-weight: 700;
            border-radius: 5px;

        }
        .cd_pagingBar{
            padding-top: 50px;
            margin: auto;
            text-align: center;
            width:500px;
            height:150px;
        }
        .cd_pagingBar>a{
            font-size: 20px;
            text-decoration: none;
            color:gray;
            background-color: gainsboro;
            display: inline-block;
            width:30px;
            height:30px;
        }
        .cd_pagingBar>a:hover{
            background-color:rgba(24,189,234, 0.5);
            color:white;   
        }

        /* 부트스트랩 테이블 */
        .table>thead>tr>th{
            text-align: center;
        }
        .table>tbody>tr td{
            border :1px solid white;
            text-align: center;
        }
        .table>tbody>tr:hover{
            background-color: lightgrey;
            cursor: pointer;
        }
</style>
</head>
<body>
<%@ include file="../common/header_admin.jsp" %>
<br><br><br>
      <div class="wrap">
       <div class="content">
           <div class="content_title" style="color:rgba(36, 49, 121, 0.9)";>
                    후기 관리
                   
           </div>
            <div class="content_detail" >
              
                <form action="<%= contextPath %>/searchad.re" method="get" align="right" style="margin-left:250px">
                <input type="hidden" name="currentPage" value="1">
                
              <div class="cd_select" align="right">
                  <br>
                    <select class="cd_select1" name="category" id="">
                        <option name="category" value="1">작성자</option>
                        <option name="category" value="2">글제목</option>
                    </select>
                             
                    <div><input class="cd_select2" type="text" name="keyword" placeholder="검색어를 입력하세요"  style="width: 300px; height: 34.5px;"></div>
                    <div> <button type="submit" class="btn btn-light " style="opacity: 0.7; background-color: rgba(24,189,234, 0.5); color: white;">검색</button></div>
                       </form>
                     </div>
                  <div class="cd_orderBy" align="right">
                   <hr style="border:1px solid rgba(73, 71, 71, 0.5)";>
                    <p href=""></p>
                </div>
                <table class="table table-hover" class="table">
                    <thead>
                        <tr class="cd_table_title">
                            <th width="100">글번호</th>
                            <th width="450">제목</th>
                            <th width="100">작성자</th>
                            <th width="150">작성일</th>
                        </tr>
                    </thead>
                    <tbody align="center" >
                    <% if(list.isEmpty()) { %>
			            <tr>
			              <td colspan="4">조회된 리스트가 없습니다.</td>
			            </tr>
			           <% } else { %>
			            <% for(Review r : list) {  %>
                        <tr onclick="location.href='<%=contextPath %>/reviewadDetail.re?rno=<%=r.getRevNo()%>'">
                            
                            <td><%= r.getRevNo() %></td>
                            <td><%= r.getRevTitle() %></td>
                            <td><%= r.getUserId() %></td>
                            <td><%= r.getRevDate() %></td>
                        </tr>
                    <%}} %> 
                    </tbody>
                </table>
		      <script>
		         $(function(){
		             $(".table>tbody>tr").click(function(){
		                  location.href = "<%=contextPath %>/reviewadDetail.re?rno="+ $(this).children().eq(0).text();  
		             });
		         });   
		      </script>   

		      <div id="paging" align="center">
            <div id="pro_paging" class="page_nation" style="width:100%; margin:left; margin-left:300px;">
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/searchad.re?category=<%=category %>&keyword=<%= keyword %>&currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/searchad.re?category=<%=category %>&keyword=<%= keyword %>&currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			              
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/searchad.re?category=<%=category %>&keyword=<%= keyword %>&currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>
                    </ul>
            </div>
		   
		      </div>

                <div id="page">
           

           
       </div>
       </div>
       </div>
       <br><br>
<%@ include file="../common/footer.jsp" %>       
</body>
</html>