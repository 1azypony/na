<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.review.model.vo.Review, com.na.template.model.vo.PageInfo" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = (int)request.getAttribute("listCount");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int listCount9 = (int)request.getAttribute("listCount9");
	
%>
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_My구매후기list</title>
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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
div {
	box-sizing: border-box;
}

.content {
	width: 1000px;
	height: 100%;
	margin: auto;
	position: relative;
}

.content div {
	height: 0%;
}

.content {
	position: relative;
}

#content_header {
	width: 85%;
	height: 100%;
	float: right;
}

#content_body1 {
	width: 100%;
	height: 70px;
}

#content_body2 {
	width: 100%;
	height: 780px;
	margin: 0px;
	/* border:1px solid black; */
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
	height: 1100px;
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
	padding-bottom: 5px;
}

#content_title>hr {
	width: 800px;
	padding: 0px;
	margin: 0px;
	margin-left: 25px;
}

/*content영역 중간*/
#content_body2 {
	width: 95%;
	height: 550px;
	margin: auto;
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

input[type=checkbox] {
	margin-left: 8px;
}
#review_paging{
	width:300px;
	margin:auto;
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
				<h2>My 후기</h2>
			</div>
			<!--content중간에 들어갈 내용-->
			<div id="content_body2">
				<div id="review_body">
					<table align="center" class="table">
						<thead>
							<tr>
								<th height="50" width="80">글번호</th>
								<th width="500">제목</th>
								<th width="90">작성자</th>
								<th width="110" style="text-align: center;">작성일</th>
							</tr>
						</thead>
						<tbody>
						<%for(Review r : list){ %>
							<tr onclick="location.href='<%=contextPath%>/reviewDetail.re?rno=<%=r.getRevNo() %>'">
								<th style="font-weight: normal;" height="50" width="80"><%=r.getRevNo() %></th>
								<th style="font-weight: normal;" width="500"><%=r.getRevTitle() %></th>
								<th style="font-weight: normal;" width="90"><%=r.getUserId() %></th>
								<th style="font-weight: normal;" width="110" style="text-align: center;"><%=r.getRevDate() %></th>
							</tr>
						<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<br>
			<!-- 페이징바 -->
            <div id="review_paging" class="page_nation">
            <%if(list.size()!=0){ %> 
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/mypageReviewList.re?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/mypageReviewList.re?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>     
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>      
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			               
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/mypageReviewList.re?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>                    
                    </ul>
            <%} %>
            </div>
		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>