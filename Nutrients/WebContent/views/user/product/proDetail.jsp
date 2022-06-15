<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.product.model.vo.Product" %>
<% 
	Product p = (Product)request.getAttribute("p"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }

    div{
        /* border: 1px solid red; */
        box-sizing: border-box;
    }

    #con{
        width:1000px;
        height:1500px;
        margin: auto;
        margin-top:50px;
        margin-bottom: 50px;
        /* border: 2px solid gray; */
    }

    #pro_left, #pro_right{
        width:498px;
        height:500px;
        float:left;

    }

    #pro_title{
        font-size:25px;
        font-weight: bolder;
        margin-top:100px;
        margin-left:50px;
    }
    #pro_price{
        font-size:15px;
        margin-top:10px;
        margin-left:50px;
    }
    #pro_simple{
        font-size:15px;
        margin-top:10px;
        margin-left:50px;
        color:gray;
    }
    #pro_num{
        margin-top:100px;
        margin-left:50px;
    }

    #pro_inp_num{
        font-size:15px;
        width:70px;
        margin-left: 15px;
        margin-right: 30px;
        text-align:center;
    }
    #buy_btn{
        margin-top: 40px;
        margin-left:50px;
        width:150px;
        height:60px;
        font-size: 20px;
    }
    .pro_des{
        float:left;
        width:997px;
        height:50px;
        text-align: center;
        font-size: 17px;
        font-weight:bolder;
        padding-top:10px;
        background-color: rgb(199, 198, 198);
        border: 2px solid gray;
    }
    .pro_des:hover{
        cursor: pointer;
    }

    .des{
        padding:30px;
    }

</style>
</head>
<body onload="init();">
<%@ include file="../common/header.jsp" %>

    <div id="con">

        <div id="pro_left">
            <img src="<%=p.getProImgPath() %>" alt="" style="width : 498px; height : 500px;">
        </div>
        <div id="pro_right">
			
            <div id="pro_title"><%=p.getProName() %></div>
            <div id="pro_price"><%=p.getPrice() %>원</div>
            <div id="pro_simple"><%=p.getProEff() %></div>

			
			<form name="form" method="post" action="<%=contextPath%>/beforMycart.ca">
			<input type="hidden" value="<%=p.getPrice()%>" id="pro_price2">
            <div id="pro_num">
               	 구매수량 : <input type="hidden" name="sell_price" value="<%=p.getPrice()%>" >
                    <input type="text" name="amount" value="1" size="1" onchange="change();" readonly style="border-radius: 5px;">&nbsp;
                    <input type="button" value="+" onclick="add();">&nbsp;<input type="button" value="-" onclick="del();">
                    <br><br>
                    
                    총 금액 : <input type="text" name="sum" size="11" readonly style="border-radius: 5px;">&nbsp;원
                </div>
                <input type="hidden" name="pNo" value="<%=p.getProNo()%>"> 
                <button type="submit" id="buy_btn" class="btn btn-info">장바구니 담기</button>
           </form>
        </div>
	

        <!-- <div class="pro_des" style="border-right:2px solid gray;">상품설명</div> -->
        <div class="pro_des" style="border-right:2px solid gray;">상세정보</div>
        <!-- <div class="pro_des">문의</div> -->

        <div id="des1" class="des" style="clear:both;">
            <%=p.getProDes() %>
        </div>
        <!--설명 걍 하나로 묶어서 통일   상세정보 굵은 제목텍스트는 세인누나컬러로-->
    </div>

    <%@ include file="../common/footer.jsp" %>
	<script>
	   //실시간 가격계산 
       var sell_price;
        var amount;

    function init () {
        sell_price = document.form.sell_price.value;
        amount = document.form.amount.value;
        document.form.sum.value = sell_price;
        change();
    }

    function add () {
        hm = document.form.amount;
        sum = document.form.sum;
        hm.value ++ ;

        sum.value = parseInt(hm.value) * sell_price;
    }

    function del () {
        hm = document.form.amount;
        sum = document.form.sum;
            if (hm.value > 1) {
                hm.value -- ;
                sum.value = parseInt(hm.value) * sell_price;
            }
    }

    function change () {
        hm = document.form.amount;
        sum = document.form.sum;

            if (hm.value < 0) {
                hm.value = 0;
            }
        sum.value = parseInt(hm.value) * sell_price;
    }  

	</script>
</body>
</html>