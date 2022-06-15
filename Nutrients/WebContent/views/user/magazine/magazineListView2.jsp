<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.magazine.model.vo.Magazine, com.na.template.model.vo.PageInfo" %>    
<%
 	ArrayList<Magazine> list = (ArrayList<Magazine>)request.getAttribute("list");

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>매거진리스트</title>
    <style>

        #content_1 { 
            /*border: 1px solid green; */
            height: 100px; 
            margin: auto;
            margin-top: 60px;
            color : rgba(36, 49, 121, 0.9);
        }
        #content_2 { 
            /* border: 1px solid plum;*/
            height: 25px; 
            margin-top: 10px; 
            margin-bottom: 10px;
            color: black;	
        }
        #content_3 {
        	 /*border: 1px solid purple;*/
              width : 1000px;
              height : 100%;
       		  margin : auto;

        }
        #content_4 { 
            /* border: 1px solid red; */
            height: 100px;
			width : 1000px;
			float: center;
		}

		#td1{
			 /* border : 1px solid red; */
			  width : 300px;
			  height : 300px;
			  margin: auto;
			  display : inline-block;
			  margin : 10px;	
		}

	
       <!-- #tit_area { display:block;  padding:0; } -->
        .tit { margin-top:15px; font-size:16px; font-weight: bold;
                color:black; font-weight:100; min-height: 30px; text-decoration:none; }
        #tit:hover { color : rgba(6, 198, 252, 0.5); }
		.list:hover { text-decoration: none; }
		.info {color:gray; font-size:12px; text-align:left;}
		#td1> img:hover { opacity:0.7; }
        
          /* 페이징 바*/
		#page { text-align: center;}
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	       <!-- 매거진 영역-->
	       <div class="content" style=" width : 1000px; margin : auto;">
	           <!--건강 매거진 타이틀 -->
	
	           <div id="content_1" align="center">
	            <h2>건강매거진 <br>
	                Health Magazine </h2>
	            <hr>
	      		</div>
	      		
	      		
	           <!-- 최신순/인기순 오른쪽 탭-->
	           <div id="content_2" name="maglist" align="right">
	               <a id="sort" href="<%= contextPath %>/list.mg?currentPage=1" class="latest" value="" style="color:black;">최신순 </a> |
	               <a id="sort" href="<%= contextPath %>/list2.mg?currentPage=1" class="hotist" value="" style="color:black;">인기순</a>
	           </div>
	           
	           
	       	   <!-- 썸네일 형태의 게시판 한페이지당 9개 정렬 -->
	           <div id="content_3">
	           <% if(list != null) { %>
	           			<%for(Magazine m : list) { %>
	  				<div id="td1" align="center">
	                        <!-- magazine pc는 페이징 한개당 리스트 9개 노출 -->
	                        <a href="/na/detail.mg?mno=<%=m.getMagNo()%>" class="list" style="display:inline-block;">
	                            <img src= "<%= m.getMagImgPath() %>" width="300px;" height="200px;"  style ="float: center;">
	                            <p class="tit"><%= m.getMagTitle() %></p>
	                            <p class="info"> 조회  <%= m.getCount() %> 작성일 <%= m.getMagDate() %></p>
	                        </a>
	                </div>
	                
	                       <%} %>
		              <% } else { %>
					등록된 게시글이 없습니다.
				<% } %>
	        	</div><br><br>
					<!-- 페이징 바 -->
					<div id="content_4" class="paging-area" >
						<div id="page" class="page_nation" style="margin-left: 300px;" >
							<ul class="pagination" >
								<%if(currentPage==1){ %>
								<%}else{ %>
										<li class="page-item"><a class="page-link" href="<%=contextPath%>/list2.mg?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
								<%} %>
								<%for(int p = startPage; p<=endPage; p++){ %>
									<%if(p!=currentPage){ %>
										<li class="page-item"><a class="page-link" href="<%=contextPath%>/list2.mg?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
								<%} else {%>
										<li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
									<%}} %>
								<%if(currentPage==maxPage || maxPage==0){ %>
								<%}else{ %>				              			              
										<li class="page-item"><a class="page-link" href="<%=contextPath%>/list2.mg?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
								<%} %>
                   			</ul>
            			</div>
	        		</div>
	    </div>
	    <%@ include file="../common/footer.jsp" %>
</body>
</html>