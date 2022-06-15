<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.member.model.vo.*" %>    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NUTRIENTS ALMIGHTY</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

    <style>
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
           transform : scale(1);
       } 
       #navi>li>a:hover+ul {
           display: block; 
           background-color:rgba(24,189,234, 0.3);
       } 
        #navi>li>ul:hover{
           display: block; 
                      background-color:rgba(24,189,234, 0.3);
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<script>
		// script태그 내에서도 스크립틀릿과 같은 jsp요소들을 사용할 수 있음.
		var msg = "<%=alertMsg %>"; // "성공적으로 로그인이 되었습니다." / "null"
		if(msg != "null"){
			alert(msg);
			
			// 알림창을 띄워준 후, session에 담긴 해당 메세지를
			// session.removeAttribute("키값") 메소드로 지워주어야 함.
			// 안그러면, menubar.jsp가 로딩될때마다 매번 alert가 계속 뜸.
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>

       <div id="header">
           <div id="header_1"></div>
           <div id="header_2">
            <a href="/na/proManageList.pr?currentPage=1" target="_self">
                <img src="/na/resources/image/상호이미지.png" id="logo">
            </a>
           </div>
           <div id="header_3">
                <div id="icon1">
                    <a href="<%=contextPath %>/logout.me" id="i1"><img src="/na/resources/image/관리자.png" style="width: 100%; height: 100%; margin-top : 20px; margin-left : 10px;"></a>
                    <ul style="margin-right : 1000px;"><a href="<%=contextPath %>/logout.me" id="i2">로그아웃</a></ul>
                </div>
           </div>
       </div>
       <div id="navigator">
        <ul id="navi">
            <li><a href="<%=contextPath%>/proManageList.pr?currentPage=1">제품관리</a></li>
            <li><a href="<%=contextPath%>/noticelist.no?currentPage=1">게시글관리</a>
            <ul>
                <li><a href="<%=contextPath%>/noticelist.no?currentPage=1">공지사항</a></li>
                <li><a href="<%=contextPath%>/inquerylist.in?currentPage=1">1:1문의</a></li>
                <li><a href="<%=contextPath%>/faqlist.fa">FAQ</a></li>
                <li><a href="<%=contextPath%>/adminlist.mg?currentPage=1">매거진</a></li>
            </ul>
            </li>
            <li>
                <a href="<%=contextPath%>/reviewadlist.re?currentPage=1">후기관리</a>
            </li>
            <li>
                <a href="<%=contextPath%>/memManageList.me?currentPage=1">회원관리</a>
            </li>
        </ul>
       </div> 

    
    
    <!-- <div id="footer">
        <table>
            <tr>
                <td><hr style="border: solid 0.5px rgba(73, 71, 71, 0.1)"></td>
            </tr>
            <tr>
                <td id="ft1">
                   <a href="" >이용약관</a>  |
                   <a href="" >개인정보취급방침</a>  
                </td>
                <td id="ft2">
                   <a href="">고객센터</a>
                </td>
            </tr>
           <tr>
               <td>&nbsp;</td>
           </tr>
           <tr>
               <td id="ft3">
                   (주)건강이내게5조 <br>
                   사업자번호: 768-34-333445 <br>
                   대표 : 한세인  <br>
                   주소 : 서울특별시 영등포구 당산동 <br>
                   유통판매신고 : 제 2333-330000 <br>
               </td>
               <td id="ft4">
                  고객센터: sein151@naver.com <br>
                  전화 : 02-1588-3333 <br>
                  상담시간 : 평일 10:00 ~18:00 (점심시간 : 12:00~13:00) <br>
                  비지니스 문의 : sein151@naver.com
               </td>
           </tr>
           <tr>
               <td id="ft5">
                    @content by all right
               </td>
           </tr>
        </table>
        <br><br>
       </div> -->

</body>
</html>