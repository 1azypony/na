<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.magazine.model.vo.Magazine" %>    
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
	            width: 100%;
	            height: 100%;
	            margin:auto;
	            }
	          
	        .content_title{
		            color: rgba(36, 49, 121, 0.9);
		            font-size: 40px;
		            float:center;
		            width:70%;
		            height: 120px;
		            margin: auto;
		            margin-top: 30px;
		            margin-bottom: 30px;
		            font-weight: 700;
		            padding-left: 30px;
		            padding-top: 15px;
		         	border:1px solid red;
		       }
          
	        
	        .content>div{
	            /*border: 1px solid blue;*/
	            width: 100%;
	            height: 0px;
	            margin:auto;
	           
	        }
	        #content_1{ height: 100%;}
	        #content_2{ height: 100%;}
	        #content_3{ height: 100%;} 
	
	        hr{color: rgba(73, 71, 71, 0.5); width: 1000px;}
	        
	        #content_1 {
	        	margin-top: 50px;
				margin-bottom: 30px;;
	        }
	
	        #content_2>#detail-area{
	            height: 100%;
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
	            margin-left: 30%;
	            width: 100%;
	            height: 100%;
	        }
	    </style>
	</head>
	<body>
		<%@ include file="../common/header.jsp" %>
	    <div class="wrap">
	       <div class="content">
	             <div id="content_1">
	                <h2 align="center">건강매거진 <br>
	                            Health Magazine</h2>
	                <hr>
	           </div>
	        
	         <div id="content_2">
	            <br>
	            <table id="detail-area">
	                <!--(tr>th+td+td+td)*4-->
	                <tr>
	                    <th width="400" align="left" style="font-size:24px"><%= m.getMagTitle() %> </th>
	                    <th width="50" style="font-weight: bold">조회수</th>
	                    <th width="30"><%= m.getCount() %></th>
	                    <th width="50" style="font-weight: bold">작성일</th>
	                    <th width="70" align="right"><%= m.getMagDate() %></th>
	                </tr>
	                <tr><td><br></td></tr>
	                <tr>
	                    <td><img src="<%= m.getMagImgPath() %>"></td>
	                </tr>
	                <tr>
	                    <td colspan="5"> <%= m.getMagDes() %></td>
	                </tr>
	           </table><br><br>
			    <div align="center"> 
					<a href="<%=contextPath%>/detail.mg?mno=<%=m.getMagNo() - 1%>" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">이전</a>
					<a href="<%= contextPath %>/list.mg?currentPage=1" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">목록가기</a>
					<a href="<%=contextPath%>/detail.mg?mno=<%=m.getMagNo() + 1%>" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">다음</a>
            	</div>
	           </div>
	           
	       
	       </div>
	    </div><br><br>
	    <%@ include file="../common/footer.jsp" %>
</body>
</html>