<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,com.na.user.review.model.vo.*" %>    
<%
   //전달받은 r을 먼저 뽑기
   Review r = (Review)request.getAttribute("r");
   
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객후기상세조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <style>
      div{
          box-sizing: border-box;
          border: 1px solid white; /*가이드라인*/
      }
      .wrap{
          width: 1000px;
          height: 1160px;
          margin: auto; /*가운데정렬*/
      }
      .wrap1{
          width: 1050px;
          height: 1160px;
          margin: auto; /*가운데정렬*/
      }

      /* 크게 네가지 영역 */
       .wrap>div{ width: 100%; }
       
      body{
        font-family: "Sofia", sans-serif;
       }
           
       #content1_title {height: 80px; }
       #content2_title {height: 40px;}
       #content3{height: 40px;}
    
       #content4 {height: 600px; }
       #content5 {height:  250px }
       #paging {height: 50px;}
  
       body{
        font-family: "Sofia", sans-serif;
       }
       
       /*하단 목록 버튼*/ 
       #btn1:hover{
         background-color: white;
       }
       #content5{
         padding: 40px;
         padding-left: 100px;
         border-radius: 10px;
         border-color: gray;
         border-width: 2px;
        
       }
    
       .wrap{
         padding: 40px;
         padding-left: 100px;
         padding-right: 100px;
         border-radius: 10px;
         border-color: gray;
         border-width: 2px;

       }
    

   

    </style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header.jsp" %>
 <br><br><br>
   <div class="wrap1" >
    <div class="wrap"  >
       
    <div id="content1_title" style="font-size:40px; font-weight:700; color: rgba(36, 49, 121, 0.9);;"  >고객후기</div>
    <div id="content2_title" style="font-size:20px; color: rgba(73, 71, 71, 0.5); font-weight:700;">
      뉴트리언트 올마이티의 생생한 고객후기를 확인하세요</div> 
    <div id="content3" >
    <div id="content3_title" style="font-size:25px; font-weight: 700;">
      제목: <%= r.getRevTitle() %>
    </div>    
    <div id="content4_title" align="right">
        작성일자: <%= r.getRevDate() %>
    </div>
    </div> 
    <div id="writer" style="font-weight: 500;">
      작성자 : <%=r.getUserId() %>
    </div>   
    <hr style="border:rgba(73, 71, 71, 0.5) 1px solid";>
    <div id="content4" align="center" >
      <img src="<%= r.getRevPath() %>" style="width:500px; height:500px; margin-top: 30px; ">
    </div>
    <div id="content5"  >
      <p >
        <%= r.getRevDes() %>
     </p>
    </div>
  </div>
</div>
    <br><br> 
            <br><br><br>
        <div id="paging" align="center">
           
            <a href="<%= contextPath %>/reviewDetail.re?rno=<%=r.getRevNo()-1 %>" class="btn btn-secondary ">이전글</a>
            <a href="<%= contextPath %>/reviewlist.re?currentPage=1" class="btn btn-secondary">목록가기</a>
            <a href="<%= contextPath %>/reviewDetail.re?rno=<%=r.getRevNo()+1 %>" class="btn btn-secondary ">다음글</a>
        </div><br>


   
     <!--푸터-->
    <%@ include file="../common/footer.jsp" %>
   

</body>
</html>