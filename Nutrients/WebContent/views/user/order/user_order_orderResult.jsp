<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.na.user.order.model.vo.Purchase, java.text.*" %>
<%
	DecimalFormat formatter = new DecimalFormat("###,###");
	ArrayList<Purchase> list = (ArrayList<Purchase>)request.getAttribute("purlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
        /* content  */
        div{
            /* border: 1px solid red; */
        }
       #content{
           width:1000px;
           height:100%;
           margin:auto;
       }
       #complete_img{
           /* border:2px solid blue; */
           width:1000px;
           height:300px;
           margin : 0px;
       }
       #c_img1{
       	   padding-top : 30px;
           width:80%;
           height: 80%;
           margin : auto;
       }
       #c_img1>img{
           box-sizing: border-box;
           display: block;
           margin : auto;
       }
       #c_img2{
           box-sizing: border-box;
           width:80%;
           height: 20%;
           font-size:20px;
           font-weight:700;
           text-align : center;
           margin : auto;
           padding-top : 50px;
       }
       #complete_table{
           width:1000px;
           
       }
       #complete_table>div{
           float:left;
       }
       #ct_list{
           border-collapse: collapse;
       }
       #ct_title{
           width:30%;
           height:5%;
           font-size: 30px;
           font-weight: 700;
           padding-top:30px;
       }
       #ct_annotation{
           width:100%;
           height:5%;
           font-size:12px;
           font-weight: 700;
           color:red;
           text-align: right;
           margin-right:5px;
       }
       .ct_list_content{
           font-size: 20px;
           font-weight: 700;
       }
       .ct_list_content_img>img{
           width:120px;
           height:120px;
       }
       .ct_list_content_info1{
           font-size: 15px;
           font-weight: 700;
           color:gray;
           text-align: center;
           padding-top: 40px;

       }
       .ct_list_content_info2{
           font-size: 18px;
           text-align: center;
       }
       .ct_list_content_date{ 
           padding-top: 60px;
        }
        .ct_list_content_price{ 
           padding-top: 60px;
        }
        .ct_list_content_status{ 
           padding-top: 60px;
        }
       #ct_list_priceAll{
           font-size: 20px;
           font-weight: 700;
       }
       #ct_list_priceAll_title{
           text-align: right;
       }
       #ct_list_priceAll_price{
           text-align: right;
       }

       /* 부트스트랩 테이블 */
       .table>thead>tr>th{
            text-align: center;
        }
        .table>tbody>td{
            border :1px solid white;
            text-align: left;
        }
        .table>tbody>tr:hover{
            background-color: lightgrey;
            cursor: pointer;
        }
        


</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

        <div id="content">
             <div id="complete_img">
                 <div id="c_img1"><img src="/na/resources/image/주문완료.png" alt="" style="width : 200px; height : 200px; margin-top : 30px; margin-bottom : 0px;"></div>
                 <div id="c_img2" style="margin-top : 0px;">주문이 정상 접수되었습니다.</div>
             </div>
             <div id="ct_title">결제내역</div>
             <div id="ct_annotation" align="right" style="font-size: 15px">※배송현황은'마이페이지-구매내역'에서 확인 가능합니다.</div>
             <div id="complete_table">
                 <table class="table table-hover" id="table">
                    <thead>
                        <tr>
                            <th width="150px">상품이미지</th>
                            <th width="400px">상품정보</th>
                            <th width="150px">주문일자</th>
                            <th width="140px">주문금액</th>
                            <th width="110px">주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% String total = ""; %>
                    <%for(Purchase p : list){ %>
                        <tr class="ct_list_content" align="center" 
                        		id="order_list">
                            <td class="ct_list_content_img"><img src="<%=p.getImgPath()%>" alt=""></td>
                            <td class="ct_list_content_info">
                                <div class="ct_list_content_info1"><%=p.getProEffi() %></div>
                                <div class="ct_list_content_info2"><%=p.getProName() %></div>
                            </td>
                            <td>
                                <div class="ct_list_content_date"><%=p.getPdate() %></div>
                            </td>
                            <td >
                                <div class="ct_list_content_price"> <%=formatter.format(Integer.parseInt(p.getTotprice())) %></div>
                            </td>
                            <td>
                                <div class="ct_list_content_status"><%=p.getStatus() %></div>
                            </td>
                        </tr>
                        <% total = p.getTotprice(); %>
                        <%} %>
                    </tbody>
                </table>
                <table>
                    <tr id="ct_list_priceAll">
                        <td width="150px"></td>
                        <td width="500px"></td><%-- 
                        <td width="350px" colspan="2" id="ct_list_priceAll_title">결제완료금액 : </td>
                        <td width="130px" id="ct_list_priceAll_price"><%=total%></td> --%>
                    </tr>
                </table>
             </div>
        </div>
        <br clear="both">
    <div id="footer-div">
		<%@ include file="../common/footer.jsp" %>    
    </div>    
    
    <%--  <script>
		$(function(){	
			$("#order_list").click(function(){
			location.href = '<%=contextPath%>/detail.pur';
		});
	});
	</script>  --%>  
</body>
</html>