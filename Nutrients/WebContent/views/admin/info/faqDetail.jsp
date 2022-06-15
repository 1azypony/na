<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.info.model.vo.Faq"  %>      
<%
   // 전달받은 n을 먼저 뽑기
   Faq f = (Faq)request.getAttribute("f");


  // 글제목, 글내용
%>      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 상세</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <style>
      div{
          box-sizing: border-box;
         /* border: 1px solid red; */
          /*가이드라인 */
      }
      .wrap{
          width: 1000px;
          height: 800px;
          margin: auto; /*가운데정렬*/
      }
      /* 크게 네가지 영역 */
       .wrap>div{ width: 100%; }
      
       body{
        font-family: "Sofia", sans-serif;
       }
      /* content영역 */
      .content{
           /* border : 1px solid red; */
           width: 1000px;
           height : 300px;
           margin-top : 50px;
           padding-right: 50px;
       }
       .content_title{
           float:right;
           width:85%;
           height:21%;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;
          /* padding-left:50px; */
          padding-right: 50px;
           /* border:1px solid red; */
       }
       
        .content_detail{
            float:right;
            width: 800px;
            height: 700px;
            /* border:1px solid red; */
            margin-top:15px;
        }
     
      #form_table{
          border-left: 1px solid rgb(170, 170, 170);
          border-right: 1px solid rgb(170, 170, 170);
      }

      #form_table th{
          text-align: center;
          background-color: gainsboro;
      }
      #form_table td{
          padding-left: 15px;
      }
      #form_table tr{
          border-top: 1px solid rgb(170, 170, 170);
      }

      #text_outer{
          border: 1px solid rgb(170, 170, 170);
          width:750px;
          height:405px;
          margin: 10px;
          margin-left: 25px;
      }

      #text_insert {
          resize: none;
          margin: 20px;
          padding: 10px;
      }
  </style>

</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>
  <br><br><br>
    <div class="wrap">
      
       <div class="content">
        <div class="content_title">
             <div style="color:rgba(36, 49, 121, 0.9)";>
                  FAQ 상세
                 <hr style="border:rgba(73, 71, 71, 0.5) 1px solid;width: 800px;">
             </div>
        </div>
      
         
         <div class="content_detail">
            <br><br>
            <form action="" method="">

            <table id="form_table" align="center">
            
                <tr>
                    <th width="150" height="35">제목</th>
                    <td width="600px"><%= f.getFaqTitle() %> </td>
                </tr>
                <tr style="border-bottom:1px solid black;">
                    <th height="35">작성자</th>
                    <td>admin</td>
                </tr>
            </table>
            <div id="text_outer">
            <p id="text_insert" name="" rows="14" cols="91" >
             <%= f.getFaqDes() %>
            </p>
            </div>

            </form>
         </div>
    </div>
    </div>             
    
        <div id="paging" align="center">
            <a href="<%= contextPath %>/faqlist.fa" class="btn btn-secondary btn-sm">목록가기</a>       
       

             <a href="<%=contextPath%>/delete.fa?fno=<%=f.getFaqNo() %>" class="btn btn-danger btn-sm">삭제하기</a>
       
        </div>
        
        
        
    <!--푸터-->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>