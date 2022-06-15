<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.na.user.member.model.vo.Member, com.na.user.product.model.vo.Product" %>
<%  
	Product p = (Product)request.getAttribute("p");
	int listCount = (int)request.getAttribute("listCount9"); 
	String cartNo = (String)request.getAttribute("cartNo");
%>
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_구매후기작성</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style>
div {
	box-sizing: border-box;
	/*border: 1px solid red; /*가이드라인*/
}

#header_1 {
	width: 15%;
}

#header_2 {
	width: 70%;
}

#header_3 {
	width: 15%;
}

#icon1 {
	height: 20%;
}

#icon2 {
	height: 20%;
}

/*content영역*/
.content div {
	height: 0%;
}

.content {
	width: 1000px;
	height: 100%;
	position: relative;
	margin: auto;
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
	font-size: 30px;
	color: rgba(36, 49, 121, 0.6);
	margin-top: 200px;
	margin-left: 20px;
	margin-bottom: 5px;
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
#content_header {
	width: 85%;
	height: 900px;
	float: right;
}
/*content영역 상단*/
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
	height: 600px;
	margin: 0px;
}

#pro_name, #review_title, #pro_photo{
	width: 800px;
	height: 40px;
	margin-left: 30px;
}
#review_content {
	width: 100%;
	height: 400px;
}

#review_submit {
	width: 100%;
	height: 55px;
}

#review_submit>input {
	float: right;
	margin-right: 40px;
	border: 0px;
	width: 100px;
	height: 30px;
	font-size: 15px;
	border-radius: 10px;
}

#pro_name>div {
	margin-left: 30px;
	color: rgba(36, 49, 121, 0.9);
	font-size: 20px;
	margin: 0px;
	margin-left: 50px;
	padding: 0px;
	margin-top: 20px;
	display: inline;
}

#pro_name>p {
	display: inline;
}

#review_title {
	margin-left: 30px;
	margin-top: 15px;
	margin-bottom: 0px;
}

#review_title>input {
	width: 725px;
	height: 35px;
	border-radius: 5px;
}

#pro_photo>input[type=text] {
	width: 600px;
	height: 30px;
	margin-right : 10px;
	border-radius: 5px;
}

#pro_photo>input[type=file] {
	width: 90px;
	height: 30px;
	border-radius: 5px;
}


#review_content>textarea {
	margin-top: 10px;
	margin-left: 30px;
	width: 770px;
	height: 350px;
	border-radius: 5px;
}
</style>
</head>
<%@ include file="../common/header.jsp" %>

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
							<div id="cart1_2"><%=loginUser.getUserName()%></div>
						</div>

						<div id="cart2">
							<div id="cart2_1" style="margin-left : 80px;">
								총&nbsp;[구매 <a href=""><%=listCount %></a>건]
							</div><!-- 
							<div id="cart2_2">
								&nbsp;취소 <a href="">0</a>건]
							</div> -->
						</div>
					</div>
				</div>
				<div id="content_title">
					<h2>구매 후기작성</h2>
					<hr>
				</div>
			</div>
			<form action="<%=contextPath %>/insert.my" method="post" enctype="multipart/form-data">
			<div id="content_body2">
				<div id="pro_name" style="font-family: 'Noto Sans KR', sans-serif;">
					구매제품명 : &nbsp;
					<p><%=p.getProName()%></p>
					<input type="hidden" name="cartNo" value="<%=cartNo%>">
				</div>
				<div id="review_title">
					제목 : &nbsp; <input type="text" placeholder="제목을 입력하세요" name="title">
				</div>
				<br>
				<div id="pro_photo">
					첨부파일 :&nbsp;&nbsp;<label for="file1"><input type="file" name="review_file" id="file1"></label>
				</div>
				<div id="review_content">
					<textarea placeholder="내용을 입력하세요(3000자 이내 작성가능)" name="review_context" style="resize:none;"></textarea>
				</div>
				<div id="review_submit">
					<input type="submit" value="후기등록" class="btn btn-light btn-sm"
						style="opacity: 0.7; background-color: gray; color: white;">
				</div>
			</div>
			</form>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</body>
</html>