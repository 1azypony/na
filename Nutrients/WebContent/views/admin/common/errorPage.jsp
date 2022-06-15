<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 5) 지금 이 페이지에서 필요로 하는 데이터를 뽑기 (request 의 attribute 영역으로부터)
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#imgError{
		width : 350px;
		height : 350px;
		margin : auto;
		margin-left : 37%;
		margin-top : 150px;
	}
</style>
</head>
<body>

<%-- 6) 응답화면에 데이터 뿌리기 --%>
	
	<img alt="" src="/na/resources/image/error.png" id="imgError">
	<h1 align="center" style="color : red;"><%=errorMsg %></h1>
	<h1 align="center" style="color : black; opacity : 0.5; font-size: 25px;">자세한 문의는 관리자에게 문의해주세요</h1>
</body>
</html>