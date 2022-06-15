<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.magazine.model.vo.Magazine, com.na.template.model.vo.PageInfo" %>    
<%
 	ArrayList<Magazine> list = (ArrayList<Magazine>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String keyword = (String)request.getAttribute("keyword");
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
    
    <title>NUTRIENTS ALMIGHTY</title>
    <style>
    

       /* content영역 */
       .content{
           width: 100%;
           height : 100%;
           margin: auto;
       }
       .content_title{
            color: rgba(36, 49, 121, 0.9);
            font-size: 40px;
            float:center;
            width:55%;
            height: 120px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            font-weight: 700;
            padding-left: 30px;
            padding-top: 15px;
          /*border:1px solid red;*/
       }

        #content_detail{
            width: 850px;
            height: 100%;
            float: center;
            margin: auto;
           /* border:1px solid green;*/
        }
        #content_1 {
           /* border : 1px solid red;*/
            width: 850px;
            height: 70px;;
            border-right: 40px;
            margin-top: 30px;
            margin-bottom: 30px;
            margin:auto;
        }

        #content_2 {
            /*border: 1px solid purple;*/
            width: 850px;
            height: 100%;
            margin:auto;

        }
        
          #mglist:hover{
	         	cursor: pointer;
	        }
	        
	        
        #content_3{
           /* border: 1px solid red;*/
            float: right;
            height: 50px;
            margin-top: 10px;
            margin:auto;
        }

      /* 페이징 바*/
        #content_4 {
            /*border: 1px solid green;*/
            margin-top:20px;
            margin: auto;
            width: 850px;
            
        }

      #page { margin-left: 200px; 
             margin-top: 80px;}
</style>
</head>
<body> 
	<%@ include file="../common/header_admin.jsp" %>
	
       <div class="content">
           <div class="content_title"> 매거진 조회 <hr></div>
            
            <div id="content_detail">
                <div id = content_1>
                        <form action="<%=contextPath %>/magSearch.mg" method="get" align="center">
                            <b>검색어</b> <input type="text" name="keyword" style="width: 300px; height: 30px;"> <!-- name 속성 : key 값-->
                            <input type="hidden" name="currentPage" value="1">
                            <button type="submit" class="btn btn-light btn-sm" style=" color: white; background-color:rgba(24,189,234, 0.5)"> 검색 </button> 
                        </form>  
                </div>
            
                <div id="content_2">
                    <table class="table table-hover" id="mglist">
                        <thead align="center">
                            <tr style="cursor: pointer">  
                                <th width="80">글번호</th>
                                <th width="580">제목</th>
                                <th width="120">작성일</th>
                            </tr>
                        </thead>
                        <tbody align="center">
                        <%for(Magazine m : list){ %>
                            <tr>
                                <td><%=m.getMagNo() %></td>
                                <td><%=m.getMagTitle() %></td>
                                <td><%=m.getMagDate() %></td>               
                            </tr>
                           <%} %>    
                        </tbody>
                    </table>   
                     <script>
					$(function() {
					
					
					    $("#mglist>tbody>tr").click(function() {
					        location.href = "<%= contextPath %>/adminDetail.mg?mno=" + $(this).children().eq(0).text();
					    });
					});

        </script>    
                </div>
              <div id="content_3">
                <button type="button" onclick="location.href='<%=contextPath %>/insertform.mg'" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">추가</button>
              </div>
            </div>
        
               
            <!-- 페이징 바 -->
					<div id="content_4" class="paging-area" >
						<div id="page" class="page_nation" style="margin-left: 230px;" >
							<ul class="pagination" >
								<%if(currentPage==1){ %>
								<%}else{ %>
										<li class="page-item"><a class="page-link" href="/na/adminlist.mg?keyword=<%=keyword %>&currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
								<%} %>
								<%for(int p = startPage; p <= endPage; p++){ %>
									<%if(p!=currentPage){ %>
										<li class="page-item"><a class="page-link" href="/na/adminlist.mg?keyword=<%=keyword %>&currentPage=<%=p%>" style="color: black"><%=p %></a></li>
								<%} else {%>
										<li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
									<%}} %>
								<%if(currentPage==maxPage || maxPage==0){ %>
								<%}else{ %>				              			              
										<li class="page-item"><a class="page-link" href="/na/adminlist.mg?keyword=<%=keyword %>&currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
								<%} %>
                   			</ul>
            			</div>
	        		</div>
      </div> 
    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>