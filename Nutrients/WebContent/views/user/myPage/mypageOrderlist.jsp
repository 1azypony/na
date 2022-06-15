<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.na.user.order.model.vo.MyCart, java.util.*, java.text.*, com.na.user.order.model.vo.Purchase, com.na.template.model.vo.PageInfo" %>
<% 
	DecimalFormat formatter = new DecimalFormat("###,###");
	ArrayList<Purchase> purlist = (ArrayList<Purchase>)(request.getAttribute("plist"));
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = (int)request.getAttribute("listCount");
	int listCount9 = (int)request.getAttribute("listCount9");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">
<title>NutrientsAlmighty_마이페이지_구매내역</title>
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
	/*border: 1px solid red; /*가이드라인*/
	/*height : 100%;*/
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
}

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
	height: 800px;
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

#content_body2 input {
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
	background-color: rgba(36, 49, 121, 0.9);
	color: white;
	cursor: pointer;
	border: 0px;
	border-radius: 10px;
}

#order_list {
	width: 750px;
	height: 130px;
	margin: auto;
	position: relative;
	border: 1px solid rgba(73, 71, 71, 0.5);
}

#order_img {
	width: 120px;
	float: left;
	height: 120px;
}

#order_img img {
	width: 120px;
}

#order_table {
	width: 430px;
	float: left;
	height: 120px;
}

#order_table>div {
	height: 29px;
}

#order_table p {
	margin: 0px;
	padding: 0px;
	font-size: 14px;
}

#order_right {
	height: 120px;
	width: 190px;
	float: right;
}

#order_right1 {
	height: 28px;
}

#order_right1>p {
	float: right;
	margin: 0px;
	padding: 0px;
	font-size: 12px;
}

#order_right2 {
	height: 90px;
}

#order_btn1 {
	border: 0px;
	background-color: rgba(36, 49, 121, 0.9);
	color: white;
	width: 80px;
	height: 40px;
	font-size: 12px;
	margin-top: 22px;
	margin-left: 7px;
	padding: 0px;
	border-radius: 5px;
}

#order_btn2 {
	border: 0px;
	background-color: rgba(138, 164, 223, 0.6);
	color: white;
	width: 80px;
	height: 40px;
	font-size: 12px;
	margin-top: 22px;
	margin-left: 5px;
	border-radius: 5px;
}

#order_right2 input {
	border: 0px;
	background-color: rgba(138, 164, 223, 0.6);
	color: white;
	width: 80px;
	height: 40px;
	font-size: 12px;
	margin-top: 22px;
	margin-left: 5px;
	border-radius: 5px;
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
				<h2>구매내역</h2>
				<hr>
			</div>
		</div>
		<div id="content_body2">
			<p style="margin-left: 50px; color: grey; font-size: 12px;">| 최근 구매한 상품을 기준으로 조회</p>
			<!-- 구매내역 list -->
			<% for(Purchase p : purlist){ %>
			<div id="order_list" style="margin-left : 50px; margin-bottom : 10px; ">
				<div id="order_img">
					<img src="<%=p.getImgPath()%>">
				</div>
				<div id="order_table">
					<div>
						<p style="font-weight: bolder; font-size: 13px; margin-top: 5px;">
							상품명</p>
					</div>
					<hr style="width: 620px; margin: 0px; padding: 0px;">
					<div>
						<p><%=p.getProName() %></p>
					</div>
					<div>
						<p>결제금액 : <%=formatter.format(Integer.parseInt(p.getTotprice())) %> | <%=p.getCartAmount() %> 개</p>
					</div>
					<div>
					<%-- <%if(p.getStatus().equals("P")){ %> --%>
						<p>주문상태 : 주문완료</p><%-- 
						<%}else{ %>
						<p>주문상태 : 주문 미완료</p> --%><%-- 
						<%} %> --%>
					</div>
				
				</div>
				<div id="order_right">
					<div id="order_right1">
						<p
							style="font-weight: bolder; font-size: 13px; margin-top: 5px; margin-right: 15px;">
							</p>
					</div>
					<div id="order_right2">
						<button id="order_btn1" onclick="location.href='<%=contextPath%>/Practice.practice?cartNo=<%=p.getCartNo()%>'">배송현황</button>
						<button id="order_btn2" onclick="location.href='<%=contextPath%>/selectReview.my?cartNo=<%=p.getCartNo()%>&listCount=<%=listCount%>'">후기작성</button>
					</div>
				</div>
			</div>
			<%} %>
			<br>
			<br>
			<!-- 페이징바 -->
			 <div id="pro_paging" class="page_nation" style="margin-left : 370px;">
            <%if(purlist.size()!=0){ %> 
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/beforepur.my?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/beforepur.my?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>     
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>      
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			               
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/beforepur.my?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>                    
                    </ul>
            <%} %>
            </div>
		</div>
		<br>
		<br>
	</div>
</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>