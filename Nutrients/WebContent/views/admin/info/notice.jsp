<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.na.user.info.model.vo.Notice, com.na.template.model.vo.PageInfo"%>    
<%
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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

    <title>공지사항</title>
    <style>
     div{
          box-sizing: border-box;
          /* border: 1px solid red; */     
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
           width: 1000px;
           height : 900px;
           margin-top : 50px;
           padding-right: 50px;
       }
       .content_title{
           float:right;
           width:85%;
           height:90px;
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
            height: 750px;
           /* border:1px solid red; */
        }
        #content_1 {
           /* border : 1px solid red;*/
            width: 850px;
            height: 10px;
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
    #page {margin-left: 250px;}

</style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>

    <div class="wrap">
   
       <div class="content">
           <div class="content_title" style="color:rgba(36, 49, 121, 0.9);">
            공지사항      
           </div>
            <div class="content_detail">
                <div id = content_1>
                    <br>
                        <form action="<%= contextPath %>/search.no" method="get" align="right">
                            검색어 : <input type="text" name="keyword" placeholder="제목검색" style="width: 300px; height: 34.5px;"> 
                      <input type="hidden" name="currentPage" value="1">      
                            <button type="submit" class="btn btn-light" style="background-color:rgba(24,189,234, 0.5); color: white;"> 검색 </button> 
                        </form>  
                </div>
                
                <br><br>
                <hr style="border:rgba(73, 71, 71, 0.5) 1px solid";>
           
       
            <table align="center" class="table">
                <thead align="center"> 
                    <p href="" style="color:black; float:right">▼최신순</p>
                  <tr>  
                    <th width="80" >글번호</th>
                    <th width="300">제목</th>
                    <th width="90">작성자</th>
                    <th width="110">작성일</th>
                  </tr>
                </thead>
                <tbody  align="center">
                <% if(list.isEmpty()) { %>
              <tr>
                <td colspan="6">조회된 리스트가 없습니다.</td>
              </tr>
             <% } else { %>
              <% for(Notice n : list) {  %>
                     <tr>
                        
                         <td><%= n.getNotiNo() %></td>
                         <td><%= n.getNotiTitle() %></td>
                         <td>admin</td>
                         <td><%= n.getNotiDate() %></td>                                    
                     </tr>
                    <%} %>
                <%} %>
                </tbody>
             </table>   
             
             <script>
         $(function(){
             $(".table>tbody>tr").click(function(){
                  location.href = "<%= contextPath %>/detail.no?bno="+ $(this).children().eq(0).text();  
             });
         });   
      </script>    
            
              <div id="button" style="margin-left: 745px;">
              
                <button type="submit" onclick="location.href='<%=contextPath %>/enrollForm.no'" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">
                             글작성
                </button>
        
              </div> 
             
          <br>
  
     
            <div id="page">
            
            <div id="pro_paging" class="page_nation" style="width:100%; margin:left; ">
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/noticelist.no?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/noticelist.no?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			              
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/noticelist.no?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>
                    </ul>
            </div>
            
            </div>
              
     
        </div> 

     </div>
    </div>
    <!--푸터-->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>