<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%	int listCount9 = (int)request.getAttribute("listCount9"); %>
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_회원정보수정</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap"
	rel="stylesheet">

<style>
div {
	box-sizing: border-box;
	/*border: 1px solid red; /*가이드라인*/
	/* height : 100%;*/
}

/*content영역*/
.content div {
	height: 0%;
}
/*content영역 전체*/
.content {
	width: 1000px;
	height: 100%;
	/* border: 1px solid black; */
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
#content_header {
	width: 85%;
	height: 100%;
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
	font-family: 'Noto Sans KR', sans-serif;
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
/*content영역 중간*/
#content_body2 {
	width: 100%;
	height: 490px;
	margin: 0px;
}
/*content영역 하단*/
#content_body3 {
	width: 100%;
	height: 120px;
}

#content_title>h2 {
	margin-left: 30px;
	color: rgba(36, 49, 121, 0.9);
	font-family: 'Noto Sans KR', sans-serif;
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

#content_body2>table {
	width: 700px;
	height: 450px;
	margin: auto;
	margin-top: 15px;
}

#content_body2 th {
	text-align: left;
	width: 150px;
	font-size: 18px;
	font-family: 'Noto Sans KR', sans-serif;
}

#content_body2 td {
	text-align: left;
}

#content_body2 input {
	font-family: 'Noto Sans KR', sans-serif;
	box-sizing: border-box;
	width: 100%;
	height: 50px;
	border-radius: 10px;
	border: rgba(73, 71, 71, 0.5) 1px solid;
}

#content_body3>input {
	width: 120px;
	height: 50px;
	margin-left: 370px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: rgba(36, 49, 121, 0.9);
	color: white;
	cursor: pointer;
	border: 0px;
	border-radius: 10px; 
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
							<div id="cart1_2">
								<%=loginUser.getUserName()%>님
							</div>
						</div>

					<div id="cart2">
						<div id="cart2_1" style="margin-left : 80px;">
							총&nbsp;[구매 <a href=""><%=listCount9 %></a>건]
						</div>
					</div>
					</div>
				</div>
				<div id="content_title">
					<h2>회원정보수정</h2>
					<hr style="border: 1px solid rgba(73, 71, 71, 0.1)">
				</div>
			</div> 
			<form action="<%=contextPath%>/memInfoUp.my" method="post">
			<div id="content_body2">
				<table>
					<tr>
						<th>*아이디</th>
						<td><input type="text" name="userId" placeholder="<%=loginUser.getUserId()%>" readonly="readonly"></td> 
					</tr>
					<tr>
						<th>*비밀번호</th>
						<td><input type="password" name="userPwd" required
							placeholder="한글, 숫자 조합으로 6~16자로 입력하세요."></td>
					</tr>
					<tr>
					<!-- 새비밀번호 유효성 검사하기 -->
						<th>*새 비밀번호</th>
						<td><input id="newPwd" type="password" name="newPwd" required
							placeholder="필수 입력 값 입니다."></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="userName" required></td>
					</tr>

				</table>
			</div>
			
			<div id="content_body3">
				<input type="submit" value="회원정보수정" class="btn btn-light btn-sm" onclick="return validate();"
					style="opacity: 0.7; background-color: gray; color: white; margin-left: 650px;">
			</div>
			</form>
		</div>
	</div>
	
		<%@include file="../common/footer.jsp" %>
		
		
		<script>
			function validate(){
				var checkPwd = document.getElementById("newPwd").value;
			
				//사용자 pw유효성 검사
	            regExp = /^[a-z\d]{6,16}$/i;
	            //영문자, 숫자, 특수문자로 8~15자로 입력하시오.
				
				if(!regExp.test(checkPwd)){
					alert("유효한 패스워드가 아닙니다(영문,숫자,특수문자 8~15자 입력하시오)");
					
					return false;
				}else{
					return true;
				}
			}
		</script>
</body>
</html>