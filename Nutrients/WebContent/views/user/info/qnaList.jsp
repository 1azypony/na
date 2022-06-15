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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
      .content{
          width:1000px;
          height : 1200px;
          /* border: 1px solid black; */
          margin:auto;
      }
        .content div{
            height: 0%;
        }
        .content{
            position: relative;
        }
        #side_menubar{
            width: 150px;
            height: 852px;
            display: inline-block;
            float: left;
            position: absolute;
        }
        #content_header{
            width: 85%;
            height: 100%;
            float: right;
        }
        #content_body1{
            width: 100%;
            height: 70px;
        }
        #content_body2{
            width: 100%;
            height: 780px;
            margin: 0px;
            /* border:1px solid black; */
        }
        #side_menubar_1{width: 100%; height: 50px;}
        #side_menubar_2{width: 100%; height: 170px;}
        #side_menubar_3{width: 100%; height: 500px;}

        #side_menubar_1>p{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 25px;
            color: rgba(36, 49, 121, 0.6);
            margin-top: 70px;
            margin-left: 30px;
            margin-bottom: 0px;
            font-weight: bolder;
        }
        #side_menubar_2>button{
            display: block;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            width: 100%;
            height: 50px;
            background-color: rgba(24,189,234, 0.5);
            color: white;
            border: rgba(73, 71, 71, 0.5) 0px solid;
            border-radius: 5px;
            margin:2px;
        }
        #side_menubar_2>button:hover{
            background-color: white;
            color: black;
            border: 1px solid rgb(192, 192, 192);
        }

        #content_body1>h2{
            margin-left: 30px;
            color: rgba(36, 49, 121, 0.9);
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 30px;
            margin-top: 50px;
            margin-bottom: 0px;
        }

        #content_body1>hr{
            width: 800px;
        }

       /* content영역 */
       .content2{
           /* border : 1px solid red; */
           width: 800px;
           height:100%;
           margin:auto;
       }
       #content_title{
           float:right;
           width:800px;
           height:50px;
           font-size: 20px;
           font-weight: 700;
           padding-left: 20px;
           margin-top: 20px;
         
           /* border:1px solid red; */
       }
        .content_detail{
            float:right;
            width:780px;
            height:1200px;
            /* border:1px solid red; */

        }
        #content_description{
            font-size:12px;
            text-align: right;
            color: red;
        }

        .table{font-size: 15px;}
        .cd_table{
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }
        .cd_table tr{border-bottom: 1px solid gray;}
        .cd_table_title{
            background-color: gainsboro;
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
        
        #content_body2{
        	height:0px;
        }
        

</style>    
</head>
<body>
<%@ include file="../common/header.jsp" %>
       <div class="content">
           <!--왼쪽 사이드메뉴바 정렬-->
           <br>
           <div id="side_menubar">
               <div id="side_menubar_1">
                   <p>고객센터</p>
               </div>
               <div id="side_menubar_2">
                   <button onclick="location.href='<%=contextPath%>/noticeList.no?currentPage=1'">공지사항</button>
                   <button onclick="location.href='<%=contextPath%>/faqList.fa'">FAQ</button>
                   <button onclick="location.href='<%=contextPath%>/qnalist.in?currentPage=1'">1:1문의</button>
                   <button onclick="location.href='<%=contextPath%>/contract.in'">약관및방침</button>
               </div>
               <script>
               		$(function(){
               			$("#inquery").css({backgroundColor:"white",color:"black", border:"1px solid rgb(192, 192, 192)"});
               			$("#inquery").click(function(){
               				location.href="<%=contextPath%>/qnalist.in?currentPage=1";
               			});

               		});
              	</script>
               <div id="side_menubar_3"></div>
           </div>
           <div id="content_header">
                <div id="content_body1">
                    <h2>1대1문의 - 전체보기</h2>
                    <hr>
                </div>
                <div id="content_body2">
                
       <%--
			1대1문의 전체보기 : qnaList.jsp
			1대1문의 상세보기 : qnaDetail.jsp       
       		
       		전체보기 중 하단의 추가 버튼 : qnaInsert.jsp
       		상세보기 중 하단의 수정 버튼 : qnaModify.jsp
       		상세보기 중 하단의 삭제 버튼 : 컨트롤러로 이동하여 쿼리문 수행
       		
       		맵핑 순서
       		1. QnaListController
       		- header.jsp에서 
       		- '고객센터'버튼을 누를 시, qnalist.in?currentPage=1로 이동
       		- QnaListController(qnalist.in)에서 SELECT문을 실행한 후 결과를 반영하여
       		- qnaList.jsp로 포워딩

       		1-1 QnaInsertFormController, QnaInsertController
       		- qnaList.jsp에서
       		- 가장 하단의 추가버튼을 누를 시, qnainsertform.in로 이동
       		- QnaInsertFormController(qnainsertform.in)에서 qnaInsert.jsp로 포워딩
       		- 삽입 폼을 띄워준 후, 제목과 내용을 입력하고 추가 버튼을 누를 시, /qnainsert.in로 이동
       		- QnaInsertController(/qnainsert.in)에서 INSERT문을 실행한 후 결과를 반영하여
       		- 성공시, /qnalist.in?currentPage=1로 리다이렉트
       		- 실패시, errorPage.jsp로 포워딩
       		
       		2. QnaDetailController
       		- qnaList.jsp에서
       		- function을 통해, table의 tr태그를 누를 시, qnadetail.in?ino="+ino로 이동
       		- QnaDetailController(/qnadetail.in)에서 SELECT문을 실행한 후 결과를 반영하여
       		- qnaDetail.jsp로 포워딩
       		
       		2-1. QnaUpdateFormController, QnaUpdateController 
       		- qnaDetail.jsp에서
       		- 수정버튼을 누를 시, /qnaupdateform.in?ino=<%=q.getInqNo()%>로 이동
       		- QnaUpdateFormController(/qnaupdateform.in)에서 SELECT문을 실행한 후 결과를 반영하여 우선적으로 입력되어 있는 값을 뿌려준후
       		- qnaModify.jsp로 포워딩
       		- 수정 폼을 띄워준 후, 제목과 내용을 입력하고 추가 버튼을 누를 시, /qnaupdate.in로 이동
       		- QnaUpdateController(/qnaupdate.in)에서 UPDATE문을 실행한 후 결과를 반영하여
       		- 성공 시, /qnadetail.in?ino="+inqueryNo로 리다이렉트
       		- 실패 시, errorPage.jsp로 포워딩
       		
       		2-2.QnaDeleteController
       		- qnaDetail.jsp에서
       		- 삭제버튼을 누를 시, /qnadelete.in?ino=<%=q.getInqNo()%>로 이동
       		- QnaDeleteController(/qnadelete.in)에서 DELETE문을 실행한 후 결과를 반영하여 
       		- 성공 시, /qnalist.in?currentPage=1로 리다이렉트
       		- 실패 시, errorPage.jsp로 포워딩
        --%>      
        
        
           
       <div class="content2">
            <div class="content_detail">
                <h2 id="content_description">※ 1:1 문의글은 관리자의 답변유무가 미답변일때만 수정이 가능합니다</h2>
              <form action="<%=contextPath %>/qnainsertform.in" method="post" id="qnaList-form">
                <table class="table table-hover" class="table">
                    <thead>
                        <tr class="cd_table_title">
                            <th width="100">글번호</th>
                            <th width="480">제목</th>
                            <th width="130">작성자</th>
                            <th width="120">작성일</th>
                            <th width="120" height="50px">답변유무</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%if(loginUser != null){ %>
	                    <%if(list.isEmpty()){ %>
	                        <tr>
	                        	<td colspan="5">조회된 리스트가 없습니다.</td>
	                        </tr>
	                    <%}else{ %>  
	                    	<%int index = 1; %>
	                    	<%for(Qna q : list){ %>
	                    	<tr onclick="location.href='<%=contextPath%>/qnadetail.in?ino=<%=q.getInqNo()%>'">  
	                            <td><%=q.getInqNo()%></td>
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

				<div id="qnalist_paging" class="page_nation" style="margin-left:360px; margin-top:50px;">
                <ul class="pagination">
		            <%if(currentPage==1){ %>
		            <%}else{ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnalist.in?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
		            <%} %>
					<%for(int p = startPage; p<=endPage; p++){ %>
						<%if(p!=currentPage){ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnalist.in?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
					<%} else {%>
		                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
						<%}} %>
		            <%if(currentPage==maxPage || maxPage==0){ %>
		            <%}else{ %>				              			              
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/qnalist.in?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
		            <%} %>
                  </ul>
            	</div>
                <div id="btn" align="right">
                    <button type="submit" class="cd_button btn btn-dark btn-sm" style="width:60px; height:30px; text-align: center;">추가</button>
                </div>

           </form>    

            </div>
       </div>
                </div>
           </div>
       </div>
       
<br clear="both">
<div>
<%@ include file="../common/footer.jsp" %>       
</div>
</body>
</html>