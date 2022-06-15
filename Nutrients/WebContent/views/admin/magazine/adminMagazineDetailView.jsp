<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.magazine.model.vo.*" %>    
<% 
	Magazine m = (Magazine)request.getAttribute("m");
%>       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>NUTRIENTS ALMIGHTY</title>
	<style>
	    
	        /*content 영역 스타일*/
	        .content{ 
	            /*border: 1px solid black;*/
	            width: 1000px;
	            height: 100%;
	            margin:auto;
	            
	        }
	        .content>div{
	            /*border: 1px solid blue;*/
	            width: 1000px;
				height: 100%;
	            margin:auto;
	           
	        }
	        #content_1{ height: 100%;}
	        #content_2{ height: 100%;}
	        #content_3{ height: 100%;} 
	
	        hr{color: rgba(73, 71, 71, 0.5); width: 1000px;}
	        
	        #content_1 {
				/*border: 1px solid red;*/
				width: 1000px;
	        	margin-top: 50px;
				margin-bottom: 30px;
	        }

			#content_1>#title-area {
				margin: auto;
			}
	
			#content_2 {
				/*border: 1px solid red;*/
	        	margin-top: 50px;
				margin-bottom: 30px;
				height: 100%;
				margin:auto;
	        }


	        #content_2>#detail-area{
	            margin: auto;
	        }
	        
	        #detail-area{
	           /* border: 1px solid rgba(73, 71, 71, 0.5);*/
	            width: 1000px;
	        }
	        #detail-area td{
	            text-align: center;
	        }

	        #detail-area img{
	            display: block;
	            width: 70%;
	            height: 70%;
				margin: auto;
	        }
	    </style>
	</head>
	<body>
		<%@ include file="../common/header_admin.jsp" %>
	       <div class="content">
				<div id="content_1">
					<table id="title-area">
						<tr>
							<th width="700" align="left" style="font-size:24px"><%= m.getMagTitle() %> </th>
							<th width="70" style="font-weight: bold">조회수</th>
							<th width="70"><%= m.getCount() %></th>
							<th width="70" style="font-weight: bold">작성일</th>
							<th width="90" align="right"><%= m.getMagDate() %></th>
						</tr> 
					</table>
				</div>	
				<div id="content_2"><br>
					<table id="detail-area">
						<!--(tr>th+td+td+td)*4-->
						<tr>
							<td><img src="<%= m.getMagImgPath() %>"></td>
						</tr>
						<tr>
							<td colspan="5"> <%= m.getMagDes()%></td>
						</tr>
					</table><br><br>
					<div align="center">
						<a href="<%= contextPath %>/updateform.mg?mno=<%= m.getMagNo() %>" class="btn btn-dark btn-sm">수정하기</a>
						<a href="<%= contextPath %>/adminlist.mg?currentPage=1" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">목록가기</a>
						<a href="<%= contextPath %>/delete.mg?mno=<%= m.getMagNo() %>" class="btn btn-dark btn-sm">삭제하기</a>
					</div>
				</div>
	       </div>
	   <br><br>

	    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>