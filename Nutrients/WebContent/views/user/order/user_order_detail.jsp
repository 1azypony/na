<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.order.model.vo.Purchase, java.util.*, java.text.*" %>
<% 
	Purchase p = (Purchase)request.getAttribute("p_2");

	String address = (String)request.getSession().getAttribute("del_address");
	String sendName = (String)request.getSession().getAttribute("sendName");
	String phone = (String)request.getSession().getAttribute("phone");
	String toPrice = (String)request.getSession().getAttribute("totPrice");
	String arrival = (String)request.getSession().getAttribute("arrival");
	String email = (String)request.getSession().getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <title>마이페이지_구매내역상세조회</title>
    <style>
   
       /*content영역*/
       .content div{
            height: 0%;
        }
        .content{
            /* border:1px solid red; */
            width:1000px;
            height:100%;
            margin:auto;
            /* position: relative; */

        }
        /*content영역 전체*/
         /* 장바구니 이미지와 장바구니 */
        #cart_title>div{float:left;}
        #content_title{
            width: 100%;
            height: 100px;
        }
        #cart_title1{
            margin-top:30px;
        }
        #cart_title2{
            margin-left:10px;
            margin-top:50px;
        }
        #cart_title2>h2{
            font-weight: 700;
        }

        /* 제품목록 테이블 */
        #cart_product{
            width:100%;
            font-size: 18px;
            margin-top: 5px;
        }
        #cart_product th{ font-size : 18px; text-align: center;}
        #cart_product td{ font-size : 18px; }
        #content_title{
            width: 100%;
            height: 100px;
        }
        /*content영역 중간*/
        #content_body2{
            width: 1000px;
            height: 800px;
            margin: auto;
        }
        /*content영역 하단*/
        #content_body3{
            width: 100%;
            height: 120px;
        }
       #content_title>h2{
            margin-left: 30px;
            color: rgba(36, 49, 121, 0.9);
            font-size: 40px;
            margin: 0px;
            padding-left: 30px;
            padding-top: 15px;
            padding-bottom: 15px;
        }
        #content_title>hr{
            width: 800px;
            padding: 0px;
            margin: 0px;
            margin-left: 25px;
        }
        #order_detail{
             width: 750px;
             height: 130px;
             margin: auto;
             position: relative;
            border: 5px double rgba(73, 71, 71, 0.5);
        }
        #order_img{
            width: 120px;
            float: left;
            height: 120px;
            
        }
        #order_img img{
            width: 120px;
        }
        #order_table{
            width: 430px;
            float: left;
            height: 120px;
        }
        #order_table>div{
            height: 29px;
        }
        #order_table p{
            margin: 0px;
            padding: 0px;
            font-size: 12px;
        }
        #order_right{
            height: 120px;
            width: 190px;
            float: right;
        }
        #order_right1{height: 28px;}
        #order_right1>p{
            float: right;
            margin: 0px;
            padding: 0px;
            font-size: 12px;
        }
        #order_right2{height: 90px;}

        #order_btn{
            height: 30px;
            margin-left: 725px;
        }

        #order_btn>button{
            background-color: rgba(138, 164, 223, 0.6);
            color: white;
            width: 60px;
            height: 20px;
            font-size: 10px;
            border-radius: 10px;
            padding: 0px;
            cursor: pointer;
            border: 0px;
            margin-left: 10px;
        }

        #order_detail2{
            width: 860px;
            height: 30px;
        }
        #order_detail2>p{
            display: inline;
            margin-left: 490px;
            color: gray;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 12px;
        }
        #order_detail2>button{
            font-family: 'Noto Sans KR', sans-serif;
            background-color: rgba(36, 49, 121, 0.9);
            color: white;
            width: 60px;
            height: 20px;
            font-size: 10px;
            border-radius: 10px;
            padding: 0px;
            cursor: pointer;
            border: 0px;
            margin-left: 10px;
        }
        #order_detail3{
            width: 845px;
            height: 570px;
        }
        #order_detail3>p{
            margin-left: 30px;
            color: rgba(36, 49, 121, 0.9);
            font-size: 20px;
            margin: 0px;
            margin-left: 30px;
            padding: 0px;
            margin-top: 20px;
            margin : auto;
        }
        #order_detail3>div{
            width: 750px;
        }
        #pro_price, #delivery_price, #total_price, #pay_method, #order_name, #phone, #address, #delivery_detail{
            width: 800px;
            height: 50px;
            font-size: 20px;
            margin-left: 30px;
        }
    </style>
</head>
<%@ include file="../common/header.jsp" %>
       <div class="content">
           <!--왼쪽 사이드메뉴바 정렬-->
           <br>
           <div id="content_header">
                <div id="content_body1" style="margin : auto;">
                  
                    <div id="content_title" style="margin-left : 60px;">
                        <h2>구매 상세내역</h2>
                        <hr>
                    </div>
                </div>
                <div id="content_body2">
                    <div id="order_btn" style="margin-left : 800px;"><button>배송조회</button></div>

                    <div id="order_detail">
                        <div id="order_img">
                            <img src="<%=p.getImgPath()%>">
                        </div>
                        <div id="order_table">
                            <div>
                                <p style="font-weight:bolder; font-size: 13px; margin-top: 5px;"> 
                                    	제품명 : <%=p.getProName() %>
                            </div>
                            <hr style="width: 620px; margin: 0px; padding: 0px;">
                            <div>
                                <p>제품효능 : <%=p.getProEffi() %></p>
                            </div>
                            <div>
                                <p style="display: inline; ">상품 금액 : <%=p.getPrice() %></p>
                                <p style="display: inline;">&nbsp;| <%=p.getCartAmount() %>개 </p>
                            </div>
                            <div>
                                <p> 보내는 사람: <%=sendName%></p>
                            </div>
                        </div>
                        
                        <div id="order_right">
                            <div id="order_right1">
                                
                            </div>
                            <div id="order_right2" style="text-align:center;">
                               
                            </div>
                        </div>
                    </div>
                    <div id="order_detail2">
                        <p style="margin-left : 550px;">주문취소는 배송준비중 상태에서만 가능합니다</p>
                        <button style="margin-left : 0px;">주문취소</button>
                    </div>
                    <br><br>
                 <div id="order_detail3" style="margin : auto;">
                    <p style="margin-left : 30px; margin-top : 20px">주문 결제정보</p>
                    <hr style="width: 800px; margin: 0px; margin-left: 25px; margin-top: 10px; margin-bottom: 20px;">
                    <div id="pro_price">
                        <p style="display: inline;">상품금액 :&nbsp</p>
                        <p style="display: inline;"><%=p.getPrice() %>원</p>
                    </div>
                    <div id="delivery_price">
                        <p style="display: inline;">배송비 :&nbsp;</p>
                        <p style="display: inline;">2,500원</p>
                    </div>
                    <div id="total_price">
                        <p style="display: inline;">결제금액 :&nbsp;</p>
                        <p style="display: inline;"><%=p.getTotprice()%>원</p>
                    </div>
                    <div id="pay_method">
                        <p style="display: inline;">결제방법 :&nbsp;</p>
                        <p style="display: inline;">카카오페이</p>
                    </div>


                    <p style="margin-left : 30px; margin-top : 20px; margin-bottom : 20px;">배송지 정보</p>
                    <hr style="width: 800px; margin: 0px; margin-left: 25px; margin-top: 10px; margin-bottom: 20px;">
                    <div id="order_name">
                        <p style="display: inline;">주문자 :&nbsp;</p>
                        <p style="display: inline;"><%=sendName%></p>
                    </div>
                    <div id="phone">
                        <p style="display: inline;">핸드폰 : &nbsp;</p>
                        <p style="display: inline;"><%=phone %></p>
                    </div>
                    <div id="address">
                        <p style="display: inline;">주소 :&nbsp; </p>
                        <p style="display: inline;"><%=address %></p>
                    </div>
                    <div id="delivery_detail">
                        <p style="display: inline; ">배송요청사항 :&nbsp; </p>
                        <p style="display: inline;"><%=arrival %></p>
                    </div>
                 </div>
             </div>
       </div>
       	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>