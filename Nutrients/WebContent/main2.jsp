<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.member.model.vo.Member" %>
<% 	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

    <title>뉴올 메인페이지</title>
    <style>
        *{
            font-family: 'Noto Sans KR', sans-serif;
        }
        #header_3{
        	padding : 0px;
        	width: 1500px;
        	height : 50px;
        	margin : auto;
        }
		
		 /*오른쪽에 장바구니, 로그인 아이콘*/
       #icon1, #icon2{
           width: 1.5%;
           height: 1.5%;
           display: inline-block;
           float : right;
       }
       #icon1{
       	margin-right : 10px;
       }
       #icon2{
       	margin-right : 40px;
       }
       
       #cart_icon>img, #login_icon>img{
           width: 40px;
           height: 40px;
           float: right;
           margin-right : 33px;
       }
    
       #icon2>ul{
		  list-style: none;
		  margin : 0px;
		  padding : 0px;
		  width: 100px;
		  display : none;
	   }
       #icon2 li{
       	  float : left;
       	  width : 100px;
       }
       #icon2>ul>li>a{
       	  text-align: center;
       	  display : inline-block;
       	  text-decoration: none;
       	  width : 90%;
       	  border : 4px solid white;
       	  font-size : 15px; 
       	  padding : 0px;
       	  background-color : rgba(24,189,234, 0.5);
       	  line-height: 25px;
          font-weight: 5px;
          color: white;
          border-radius: 10px;
       }
       	
       #icon2>#login_icon:hover+#login_ul{
           display: block;
       }
       
       #icon2>ul:hover{
           display: block;
       }
       
       #icon2>ul>li>a:hover{
           background-color : rgba(24,189,234, 0.9);
           color : navy;
       }
       
       .fakeimg {
          height: 200px;
          background: #aaa;
        }
        #title{
            background-color: white;
        }
        .navbar-brand{
            color: white;
            float: none;
            margin: 0 auto;
            font-weight: bolder;
        }
        /* Bootstrap Navigation Overriding by Readiz */
        .navbar-default { 
            background-color: rgba(24,189,234, 0.5);
            width: 1500px;
            margin: auto;
            height : 50px;
            line-height : 35px;
        }
        
       	
        #l1{
            margin: 0;
            margin-left: 400px;
            margin-right: 60px;
        }
        #l2, #l3, #l4{
            margin: 0;
            margin-left: 60px;
            margin-right: 60px;
        } 
        .fakeimg>#p1, .fakeimg>#p2, .fakeimg>#p3{
            display: inline-block;
            height: 100px;
            width: 150px;
            margin-right: 10px;
        }
        #p1>a{
            float: left;
            margin-left: 20px;
        }

        #p2>a{
            float: left;
            margin-left: 70px;
        }

        #p3>a{
            float: left;
            margin-left: 120px;
        }

        #p1 img, #p2 img, #p3 img{
            width: 250px;
            height: 200px;
        }
        #m1{
            width: 500px;
            height: 80px;
            margin: 0px;
            padding: 0px;
            float: left;
        }
        #m2{
            width: 530px;
            height: 120px;
            margin: 0px;
            padding: 0px;
            float: left;
        }
        #m3{
            display: inline-block;
            height : 200px;
        }
	      #footer>table{
		     width:1500px;
		     margin: auto;
		     margin-top: 100px;
		     height : 100px;
		  }
	      #ft1 {
	          float: left;
	          margin-right: 320px;
	      }
	      #ft1>a{
	        padding: 0px;
	        margin: 0px;
	      }
	      #ft2 {
	        float: right; 
	      }
	      #ft3 {
	          font-family: 'Noto Sans KR', sans-serif;
	          float: left;
	          margin-left : 25px;
	          font-size: 15px;
	          text-align : left;
	      }
	      #ft4 {
	         font-family: 'Noto Sans KR', sans-serif;
	          font-size: 15px;
	          text-align: right;
	          float: right; 
	          margin-left: auto;
	          margin-right : 25px;
	      }
	      #ft1>a, #ft2>a {
	        font-family: 'Noto Sans KR', sans-serif;
	          text-decoration: none;
	          color: black;
	          font-size: 150%;
	          font-weight: 600;
	          margin-top : 15px;
	    	  margin-right : 25px;
	    	  margin-left : 25px;
	          vertical-align: middle; 
	      }
	
	      #ft5{
	        font-size: 13px;
	        font-family: 'Noto Sans KR', sans-serif;
	        color: rgba(73, 71, 71, 0.5);
	      	padding-right : 25px;
	        text-align: right;
	      }
		  
		  
    </style>
</head>
<body>

	<script>
		var msg = "<%=alertMsg%>"; // "성공적으로 로그인이 되었습니다." / "null"
		if(msg != "null") {
			alert(msg);
			// 알림창 띄우며 해당 세션의 해당 키-밸류를 지워줘야 연속해서 안뜬다.
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>
	
    <div class="jumbotron text-center" style="margin-bottom:0;" id="title">
     <div id="header_3">
               <div id="icon1">
                    <a id="cart_icon" href="" target="" title="장바구니">
                      <img src="/na/resources/image/장바구니.png">
                     </a>
                   </div>        
                <div id="icon2" style="width : 100px; ">
                <% if (loginUser == null){ %>
                    <a id="login_icon" href="/na/beforeLog.me" title="로그인">
                    	<img src="/na/resources/image/로그인.png">
                    </a>
                    <%}else{ %>
                    <span id="login_icon" href="" title="로그인">
                    	<img src="/na/resources/image/로그인.png">
                    </span>
                    <ul id="login_ul">
                    	<li><a href="/na/mypageReviewList.re?currentPage=1" id="mypage">마이페이지</a></li>
                    	<li><a href="/na/logout.me" id="logout">로그아웃</a></li>
                    </ul>
                    <%} %>
               </div>

               <div id="icon3"></div>
           </div>
           <br clear="both">
        <a href="" target="_self">
            <img src="/na/resources/image/상호이미지.png" id="logo">
        </a>
        <em style="display : block; font-family: 'Pacifico', cursive; color: rgba(24,189,234, 0.7); font-size: 20px;" >
            Your, Your healthy, with Nutrients Almighty
        </em>
        
      </div>

      <nav class="navbar-default">
            <a class="navbar-brand" href="<%=contextPath%>/proList.pr?currentPage=1" id="l1">제품보기</a>
            <a class="navbar-brand" href="<%=contextPath%>/list.mg?currentPage=1" id="l2">건강매거진</a>
            <a class="navbar-brand" href="<%=contextPath%>/reviewlist.re?currentPage=1" id="l3">고객후기</a>
            <a class="navbar-brand" href="<%=contextPath%>/noticeList.no?currentPage=1" id="l4">고객센터
            </a>
      </nav>

      <div class="container" style="margin-top:30px;">
        <div class="row">
          <div class="col-sm-8" style="margin-top : 50px">
            <h2></h2>
            <h2 style="text-align: center; color :rgba(18, 137, 170, 0.9);font-weight: bold;">이달의 BEST3 영양제</h2><br>
            <div class="fakeimg" style="background-color: rgba(236, 250, 250, 0.0); border-radius: 10px;">
                <div id="p1">
                    <a href=""><img src="/na/resources/image/오메가1.png"></a>
                </div>
                <div id="p2">
                    <a href=""><img src="/na/resources/image/유산균1.png"></a>
                </div>
                <div id="p3">
                    <a href=""><img src="/na/resources/image/비타민1.png"></a>
                </div>
            </div>
            <p style="padding : 0px; margin : 0px; text-align: center; display: inline-block; float: left; margin-left: 90px; font-weight: bold;">Best1.<br> 혈행개선/눈 건강<br>[뉴올 오메가3]</ps>
                <p style="padding : 0px; margin : 0px; text-align: center; display: inline-block; float: left; margin-left: 80px; font-weight: bold;">Best2.<br> 장과 원활한 배변활동<br>[뉴올 프로바이오틱스]</p>
                <p style="padding : 0px; margin : 0px; text-align: center; display: inline-block; float: left; margin-left: 80px; font-weight: bold;">Best3.<br> 에너지 충전을 위한<br>[뉴올 비타민B]</p>
            <br clear="both"><br><br><br><br>

            
            <h2 style="text-align: center; color :rgba(18, 137, 170, 0.9); font-weight: bold;">건강 Magazine</h2><br>
            <div class="fakeimg" style="margin-top: 30px; background-color: rgba(220, 219, 219, 0.2); border-radius: 10px;" >
                <div id="m1">
                    <h5 style="width: 90%; height: 50%; padding: 0px; margin: 0px; text-align: left; margin-top: 20px; margin-left : 10px">[여름이면 찾아오는 장건강 지킴이]</h5>
                    <p style="width : 90%; height : 20%; text-align: left; margin-left : 10px">
                        <a href="" style="text-decoration: none; color: black; ">제2의 뇌 ‘장’이 건강하지 않다는 신호는?</a>
                   </p>
                </div>
                <div id="m2" style=" font-size: 14px; text-align: left; margin-left : 10px">
                    <a href="" style="text-decoration: none; color: black;">
                        <p>장과 뇌는 연결돼 있다는 점에서 정신 건강도 영향을 받는다. 
                        	뇌와 심장은 뇌간에서 복부로 이어지는 미주신경에 의해 연결돼 있고 이 신경이 뇌와 장 사이에 신호를 보내는 역할을 한다. <br><br>
                        	그렇다면 장 건강이 안 좋을 땐 어떤 신호들이 나타날까?
                        </p>
                    </a>
                </div>
                <div id="m3">
                    <a href=""><img src="/na/resources/image/ma1.JPG" style="width : 180px; height : 160px; border-radius: 10px; margin-top:20px;"></a>
                </div>
            </div>
          </div>

          <div class="col-sm-4" style="float : right;">
            <h3 style="text-align: center; color :rgba(3, 50, 63, 0.7); font-weight: bold;">뉴올 Best 후기3</h3>
            <p style="text-align: center;">뉴올 회원의 생생한 후기를 확인해보세요.</p>
            <ul class="nav nav-pills flex-column">
            <li class="nav-item" style="height : 60px">
                <a class="nav-link active" href="#">NO1. 오메가3를 먹은 이후로(김XX)님</a>
            </li>
            <li class="nav-item" style="height : 60px">
                <a class="nav-link" href="#">NO2. 쾌변엔 프로바이오틱스!!(이XX)님</a>
            </li>
            <li class="nav-item" style="height : 60px">
                <a class="nav-link" href="#">NO3. 비타민B 먹고 천리안 됐어요(한XX)님</a>
            </li>
            </ul>

            <h5 style="text-align: center; color :rgba(3, 50, 63, 0.7); font-weight: bold;">뉴올 영양제 FAQ</h3>
            <div class="fakeimg">
                <a href=""><img class="slide1" src="/na/resources/image/main_img1.jpg" style="width : 100%; height : 100%;"></a>
                <a href=""><img class="slide1" src="/na/resources/image/main_img2.jpg" style="width : 100%; height : 100%;"></a>
                <a href=""><img class="slide1" src="/na/resources/image/main_img3.jpg" style="width : 100%; height : 100%;"></a>
                <a href=""><img class="slide1" src="/na/resources/image/main_img4.jpg" style="width : 100%; height : 100%;"></a>
                <a href=""><img class="slide1" src="/na/resources/image/main_img5.jpg" style="width : 100%; height : 100%;"></a>
            </div>
            <br>

            <h5 style="text-align: center; margin-bottom: 30px; color :rgba(3, 50, 63, 0.7); font-weight: bold;">뉴올과 함께하는 영양학</h5>
            <div class="fakeimg" style="display: inline-block; float : left;">
                <iframe width="350" height="250" src="https://www.youtube.com/embed/Nir0jXIABoQ" title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            
            <br clear="both">
            <hr class="d-sm-none">
          </div>

        </div>
      </div>
      
		
		  <div id="footer">
        <table>
            <tr>
                <td><hr style="border: solid 0.5px rgba(195, 197, 198, 0.7); width : 97%"></td>
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
                   	사업자번호: 768-34-333445 <br>대표 : 한세인  <br>
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
       </div>
      
</body>
<script>
    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    
    function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > x.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    x[index-1].style.display = "block";  //해당 인덱스는 block으로
    setTimeout(slideShow, 5000);   //함수를 4초마다 호출
 
}
</script>
</html>
<br><br><br><br><br>