<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int purNo = (int)request.getAttribute("purNo");
	String add = (String)request.getAttribute("add");
	int ddd = (int)request.getAttribute("ddd");
	String proName = (String)request.getAttribute("proName");
	int proNum = (int)request.getAttribute("proNum");
	int price = (int)request.getAttribute("price");
	int listCount = (int)request.getAttribute("listCount9");
%>	
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_My배송현황</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap"rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
div {
	box-sizing: border-box;
	/*border: 1px solid red; /*가이드라인*/
	height: 100%;
}

/*content영역*/
.content div {
	height: 0%;
}

.content {
	position: relative;
}
/*왼쪽 메뉴바 전체*/
#side_menubar {
	width: 150px;
	height: 852px;
	display: inline-block;
	float: left;
	position: absolute;
}

/*왼쪽 메뉴바 상세 div*/
#side_menubar_1 {
	width: 100%;
	height: 50px;
}

#side_menubar_2 {
	width: 100%;
	height: 170px;
}

#side_menubar_3 {
	width: 100%;
	height: 500px;
}

#side_menubar_1>p {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
	color: rgba(36, 49, 121, 0.6);
	margin-top: 170px;
	margin-left: 30px;
	margin-bottom: 0px;
	font-weight: bolder;
}

#side_menubar_2>button {
	display: block;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	width: 100%;
	height: 50px;
	background-color: rgba(24, 189, 234, 0.5);
	color: white;
	border: rgba(73, 71, 71, 0.5) 0px solid;
	border-radius: 5px;
	margin: 2px;
}

#side_menubar_2>button:hover {
	background-color: white;
	color: black;
	border: 1px solid rgb(192, 192, 192);
}
/*content영역 전체*/
.content {
	width: 1000px;
	height: 100%;
	/* border: 1px solid black; */
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
}
/*content영역 상단*/
#content_header {
	width: 85%;
	height: 1100px;
	float: right;
}

#content_body1 {
	width: 100%;
	height: 250px;
}

#cart_whole {
	width: 100%;
	height: 130px;
}

#cart {
	margin-right: 30px;
	float: right;
	width: 250px;
	height: 100%;
	border: rgba(73, 71, 71, 0.5) 2px solid;
	border-radius: 10px;
}

#cart1 {
	width: 250px;
	height: 70%;
}

#cart2 {
	width: 250px;
	height: 30%;
}

#cart1_1 {
	width: 110px;
	height: 100%;
	display: inline;
	float: left;
}

#cart1_1>img {
	width: 60px;
	height: 60px;
	margin-left: 40px;
	margin-top: 15px;
}

#cart1_2 {
	display: inline;
	width: 200px;
	height: 100%;
	line-height: 100px;
	font-size: 23px;
	margin-left: 13px;
}

#cart2_1 {
	width: 140px;
	height: 100%;
	display: inline-block;
	text-align: right;
}

#cart2_2 {
	display: inline;
	width: 100px;
	height: 100%;
}

#content_title {
	width: 100%;
	height: 100px;
}

#content_title>h2 {
	margin-left: 30px;
	color: rgba(36, 49, 121, 0.9);
	font-size: 40px;
	margin: 0px;
	padding-left: 30px;
	padding-top: 15px;
	padding-bottom: 15px;
}

#content_title>hr {
	width: 800px;
	padding: 0px;
	margin: 0px;
	margin-left: 25px;
}

/*content영역 중간*/
#content_body2 {
	width: 100%;
	height: 100%;
	margin: 0px;
}

#content_delivery {
	height: 200px;
	width: 100%;
	position: relative;
}

#delivery1, #delivery5 {
	height: 200px;
	width: 120px;
	display: inline-block;
	float: left;
}

#delivery2, #delivery3, #delivery4 {
	width: 200px;
	height: 200px;
	display: inline-block;
	float: left;
}

#content_delivery img {
	width: 180px;
	height: 180px;
	margin-left: 10px;
}

#delivery_ing {
	height: 50px;
}

#delivery_ing>p {
	width: 200px;
	height: 50px;
	display: inline-block;
	float: left;
	margin: 0px;
	text-align: center;
	font-size: 20px;
	color: rgba(36, 49, 121, 0.5);
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bolder;
}

#delivery_detail {
	height: 400px;
}

#delivery_detail>p {
	height: 30px;
	display: inline-block;
	padding: 0px;
}

#dp1 {
	margin-left: 30px;
	color: rgba(36, 49, 121, 0.9);
	font-size: 20px;
	margin: 0px;
	font-weight: bolder;
}

#dp2 {
	margin-left: 30px;
	color: rgba(222, 68, 68, 0.9);
	font-size: 12px;
	margin: 0px;
	font-weight: bolder;
	margin-left: 350px;
}

#delivery_detail>div {
	height: 40px;
}

#dp3>p, #dp4>p, #dp5>p, #dp6>p, #dp7>p{
	display: inline-block;
	float: left;
	padding-bottom: 0px;
}

#dp_btn {
	background-color: rgba(138, 164, 223, 0.7);
	color: white;
	width: 80px;
	height: 30px;
	font-size: 10px;
	border-radius: 10px;
	padding: 0px;
	cursor: pointer;
	border: 0px;
	margin-left: 15px;
	
}
</style>
</head>
<%@ include file="../common/header.jsp"%>

	<div class="content">
		<!--왼쪽 사이드메뉴바 정렬-->
		<br>
		<div id="side_menubar">
			<div id="side_menubar_1">
				<p>마이뉴올</p>
			</div>
			<div id="side_menubar_2">
				<button onclick="location.href='<%=contextPath%>/beforinfo.my'">회원정보수정</button>
				<button onclick="location.href='<%=contextPath%>/beforepur.my?currentPage=1'">구매내역</button>
				<button onclick="location.href='<%=contextPath%>/mypageReviewList.re?currentPage=1'">내가작성한글</button>
				<button onclick="location.href='<%=contextPath%>/beforDel.me'">회원탈퇴</button>
			</div>
			<div id="side_menubar_3"></div>
		</div>
		<div id="content_header">
			<div id="content_body1">
				<div id="cart_whole">
					<div id="cart">

					<div id="cart1">
						<div id="cart1_1">
							<img src="/na/resources/image/장바구니2.png">
						</div>
						<div id="cart1_2"><%=loginUser.getUserName() %>님</div>
					</div>

					<div id="cart2">
						<div id="cart2_1" style="margin-left : 80px;">
							총&nbsp;[구매 <a href=""><%=listCount %></a>건]
						</div>
					</div>
					</div>
				</div>
				<div id="content_title">
					<h2>배송현황</h2>
					<hr>
				</div>
			</div>
			<!--content중간에 들어갈 내용-->
			<div id="content_body2">
				<div id="content_delivery">
					<div id="delivery1"></div>
					<div id="delivery2">
						<img src="/na/resources/image/주문접수.png">
					</div>
					<div id="delivery3">
						<img src="/na/resources/image/배송.png">
					</div>
					<div id="delivery4">
						<img src="/na/resources/image/주문완료.png">
					</div>
					<div id="delivery5"></div>
				</div>
				<div id="delivery_ing">
				<!-- 날짜에 따라 결제완료, 배송중, 배송완료가 결정됨. -->
				
				<p id="ddd1" style="margin-left: 120px;">결제완료</p>
				<p id="ddd2">배송중</p>
				<p id="ddd3">배송완료</p>
				</div>
				<br>
				<br>
		<script>
		
		$(function(){
			
			if(<%=ddd%>==1){
				$("#ddd1").css('color', 'red');
			}
			if(<%=ddd%>==2){
				$("#ddd2").css('color', 'red');
			}
			if(<%=ddd%>==3){
				$("#ddd3	").css('color', 'red');
			}
			
		});
		
		</script>
				<div id="delivery_detail">
					<p id="dp1">배송상세정보조회</p>
					<p id="dp2">*택배사의 상황에 따라 배송도착일이 2~3일 지연될 수 있습니다.</p>
					<br><br>

					<div id="dp3">
						<p>*주문번호 :</p>
						<p>&nbsp;<%=purNo %></p>
					</div>
					<hr style="width: 820px; margin: 5px; padding: 0px;">
					<div id="dp4">
						<p>*주문내역 :</p>
						<table id="purAddress">
							<p>&nbsp;<%=proName %> - <%=proNum %>개</p>
						</table>

					<br clear="both">	
					</div>
					<hr style="width: 820px; margin: 5px; padding: 0px;">
					<div id="dp5">
						<p>*배송지 :</p>
						<p>&nbsp;<%=add %></p>
					</div>
					<hr style="width: 820px; margin: 5px; padding: 0px;">
					<div id="dp6">
						<p>*결제금액 :</p>
						<p>&nbsp;<%=price %> 원</p>
					</div>
					<hr style="width: 820px; margin: 5px; padding: 0px; margin-bottom : 10px;">
					<div id="dp7">
						<p>*택배사 :</p>
						<p>&nbsp;CJ대한통운(운송장번호 : 1234567899999)</p>
						<a href="https://www.cjlogistics.com/ko/tool/parcel/tracking" target="_blank"><button id="dp_btn">택배사운송확인</button></a>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>