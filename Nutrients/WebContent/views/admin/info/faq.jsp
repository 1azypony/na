<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.info.model.vo.Faq,com.na.template.model.vo.PageInfo "%>        
<%
ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");

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

    <title>FAQ 관리</title>
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
            width: 850px;
            height: 750px;
           /* border:1px solid red; */
        }
        #content_1 {
           /* border : 1px solid red;*/
            width: 850px;
            height: 5%;
        }

  #button{
      margin-top: 30px;
      margin-left: 88%;
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
 

</style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>

    <div class="wrap">
   
       <div class="content">
           <div class="content_title" style="color:rgba(36, 49, 121, 0.9)";>
            FAQ 관리    
           </div>
            <div class="content_detail">
                <hr style="border:1px solid rgba(73, 71, 71, 0.5)";>
           
       
            <table align="center" class="table table-hover">
                <thead align="center"> 
                   
                    <p href="" style="color:black; float:right"></p>
                  <tr>
                 
                    <th width="90" >글번호</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                  
                  </tr>
                </thead>
                <tbody  align="center">
                <% if(list.isEmpty()) { %>
                    <tr>
                    <td colspan="6">조회된 리스트가 없습니다.</td>
                    </tr>
                    <% } else { %>
                    <% for(Faq f : list) {  %>
                     <tr>
                             
                         <td><%= f.getFaqNo() %></td>
                         <td><%= f.getFaqTitle() %></td>
                         <td>admin</td>
                                                         
                     </tr>
                  <%} %>
                <%} %>
   
                </tbody>
             </table>    
             
             
             <script>
             $(function(){
                 $(".table>tbody>tr").click(function(){
                      location.href = "<%= contextPath %>/faqDetail.fa?fno="+ $(this).children().eq(0).text();  
                 });
             });  
             </script>   
            
              <div id="button" style="margin-left: 745px;">
               <button type="submit" onclick="location.href='<%=contextPath %>/enrollForm.fa'" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">
                                    글작성
                </button>
                </div>
              
          
              
              
              
              
     
        </div> 

     </div>
    </div>
    <!--푸터-->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>