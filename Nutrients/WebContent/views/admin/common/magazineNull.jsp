<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
     

    <title>1:1문의</title>
    <style>
     div{
          box-sizing: border-box;
        /* border: 1px solid red;*/
        
      }
      .wrap{
          width: 1000px;
          height: 1000px;
          margin: auto; /*가운데정렬*/
      }
    
      body{
        font-family: "Sofia", sans-serif;
       }

       /* content영역 */
       .content{
           width: 1000px;
           height : 1100px;
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
            height: 760px;
           /* border:1px solid red; */
        }
        #content_1 {
           /* border : 1px solid red;*/
            width: 900px;
             height: 5%;
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

    #page {margin-left: 200px; }
    
    /*관리자 헤더*/
          div{
          box-sizing: border-box;
          /* border: 1px solid red; */
          /*가이드라인 */
      }

      /* 크게 네가지 영역 */
       /* .wrap>div{ width: 100%; } */

       #header,#footer{
            height: 205px;
            width:1000px;
            margin:auto;
        }
       #navigator { height: 41px;  font-family: 'Noto Sans KR', sans-serif; width: 1000px; margin:auto;}

       /* 각각의 상세 영역 */
       #header>div{
           height: 100%;
           float: left;
       }

       #header_1{ width: 15%;}
       #header_2{ width: 70%;}
       #header_3{ width: 15%;}
       

       #footer{
          width: 1000px;
          height: 200px;  
      }
       
       #icon1{height: 20%;}
       
      /*1.로고 스타일*/
      #header_2{
          position: relative;
      }
      #logo{
          margin: auto;
          position: absolute;
          top: 0px;
          bottom: 0px;
          left: 0px;    
          right: 0px;
      }
        /*3.메뉴바 */
         /* #navi에 대한 스타일 적용 */
         #navi{
          /* border: 1px solid blue; */
           list-style-type: none;
           text-align: center;
           margin: auto; 
           padding: 0px;
           background-color: rgba(24,189,234, 0.5);
           height: 100%;
       }
       /* 메인메뉴에 대한 스타일 적용*/
       #navi>li {
          /* border: 1px solid green; */
           /* display:inline-block; */
           float: left;
           margin-left: 80px;
           width: 15%;
           height: 100%;
           text-align: center;
       }

       /* 공통적인 메뉴 글씨에 대해서 스타일 적용 */
       #navi a { /*a태그는 인라인 요소 */
          /*  border: 1px solid blue; */
           text-decoration: none;
           color: black;
           font-size: 16px;
           font-weight: 900;
           width: 100%;
           height: 100%;
            display : block; 
           line-height: 35px;   
       }
       #navi a:hover{
           color: steelblue;
           font-size: 18px;
           transform : scale(1); /* 1배 확대 */
       }
       /* 서브메뉴에 대한 스타일 적용*/
        #navi>li>ul{
           list-style-type: none;
           padding: 0px;
           display: none; 
       } 
       #navi>li>a:hover+ul {
           display: block; 
       } 
        #navi>li>ul:hover{
           display: block; 
       } 

       /* 서브메뉴 글씨 조절 */
       #navi>li>ul a { font-size: 13px; }
       #navi>li>ul a:hover{ font-size: 13px;} 

       /*오른쪽에 장바구니, 로그인 아이콘*/
       #icon1{
           width: 50px;
           height: 50px;
           display: block;
           cursor: pointer;
           margin-left : 80px;
       }
       #icon1 ul{
            font-family: 'Noto Sans KR', sans-serif;
            list-style-type: none;
            background-color: rgba(24,189,234, 0.5);
            width: 70px;
            padding: 0px;
            height: 25px;
            text-align: center;
            line-height: 25px;
            font-weight: 5px;
            color: gray;
            border-radius: 10px;
            font-size: 12px;
            display: none;
       }

       #icon1>#i1:hover+ul{
           display: block;
       }
       #icon1>ul:hover{
           display: block;
       }
       #i2{
          color: white;
          text-decoration: none;
       }
    


</style>
</head>
<body>
<!--헤더-->
<%@ include file="../common/header_admin.jsp" %>

<!--푸터-->
<%@ include file="../common/footer_admin.jsp" %>
</body>
</html>