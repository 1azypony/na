<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%	int listCount9 = (int)request.getAttribute("listCount9"); %>
<%-- <%
	int listCount = (int)request.getAttribute("listCount");
%> --%>
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_회원탈퇴</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
div {
	box-sizing: border-box;
	/*border: 1px solid red; /*가이드라인*/
	/* height : 100%; */
}

/*content영역*/
.content div {
	height: 0%;
}

.content {
	width: 1000px;
	height: 852px;
	/* border: 1px solid black; */
	margin: auto;
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
#content_header {
	width: 85%;
	height: 100%;
	float: right;
	margin: auto;
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
	margin: auto;
	margin-left: 30px;
	font-family: 'Noto Sans KR', sans-serif;
}

#member_secession>#m2, #m6 {
	width: 100px;
	height: 200px;
	display: inline;
	float: left;
	text-align: center;
}

#member_secession>#m3, #m7 {
	width: 730px;
	height: 200px;
	display: inline;
	float: left;
	font-size: 13px;
}

#member_secession>#m4{
	width: 200px;
	height: 50px;
	display: inline-block;
	float: left;
	font-size: 13px;
}

#content_body3>input {
	width: 120px;
	height: 50px;
	float: right;
	margin-right: 70px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	opacity: 0.7;
	background-color: gray;
	color: white;
	cursor: pointer;
	border: 0px;
	border-radius: 10px;
}

.table {
	width: 800px;
}

.table>thead>th {
	text-align: center;
}

.table>tbody>td {
	border: 1px solid white;
	text-align: left;
}

.table>tbody>tr:hover {
	background-color: lightgrey;
	cursor: pointer;
}

.paging-area {
	border: 0px;
	height: 400px;
	margin-top: 50px;
}

.paging-area>button {
	border: 0px;
	margin-left: 5px;
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
							총&nbsp;[구매 <a href=""><%=listCount9 %></a>건]
						</div>
					</div>
				</div>
			</div>


				<div id="content_title">
					<h2>회원탈퇴</h2>
					<hr>
				</div>
				<br>
				<!--content중간에 들어갈 내용-->
				<div id="content_body2">
				<form action="<%=contextPath %>/delete.me" method="post">
					<input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
					<div id="member_secession">
						<div id="m2">회원탈퇴안내 :</div>
						<div id="m3" style="margin-left: 10px;">
							고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족했나 봅니다.<br> 불편하셨던 점이나
							불만 사항을 알려주시면 적극 반영하여 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br>
							<p style="color: red; margin: 0px; padding: 0px; margin-top: 20px; margin-bottom: 0px;">
							아울러 회원 탈퇴시의 아래 사항을 숙지해주시기 바랍니다.</p><br> 
							1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보<br> 
							&nbsp;&nbsp;보호정책에 따라 관리됩니다.<br> 
							2. 탈퇴시 고객님께서 보유하셧던 적립금을 모두 삭제됩니다. <br> 3. 회원 탈퇴 후 30일간 재가입이
							불가능합니다. <br>
						</div>
					</div>
					<br>
					<br>
				
						<div id="member_secession_body">
							<div id="m4" style="display:inline-block;">기존 비밀번호 : </div>
							<div id="m5" style="margin-left: 50px; display:inline-block; margin-left : 0px;">
								<input type="password"
									style="width: 400px; height: 30px; margin-left: 10px; display:inline-block;" name="userPwd">
							</div>
						<div>
						<br>
							<div id="m6" style="text-align: left">
								무엇이<br>불편하셨나요?
							</div>
							<div id="m7" style="margin-left: 10px;">
								<textarea name="complain" cols="100" rows="9" resize="none" placeholder="내용을 입력해주세요(최대 1000자)"></textarea>
							</div>
						</div>
						<br>
						<br>
						<div id="content_body3">
							<input type="submit" onclick="return check();" value="회원탈퇴" class="btn btn-light btn-sm">
						</div>
					</div>
					</form>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script>
		function check(){
			var result = window.confirm("정말 탈퇴하시겠습니까?(탈퇴시 회원정보 모두 삭제됩니다)");
			
			if(result==true){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>