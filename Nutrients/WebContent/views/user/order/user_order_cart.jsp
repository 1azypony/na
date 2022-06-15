<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.order.model.vo.MyCart, java.util.*, java.text.*" %>
<% 
	DecimalFormat formatter = new DecimalFormat("###,###");
	ArrayList<MyCart> cart_list = (ArrayList<MyCart>)(request.getAttribute("cart_list"));
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
        /***********content ***********/
        div{
            /* border: 1px solid red; */
        }
        #content{
            /* border:1px solid red; */
            width:1000px;
            height:100%;
            margin:auto;
            /* position: relative; */

        }
        
        
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
        .cp_check{padding-top: 70px;}
        .cp_check>input{
        	margin-top : 150px;
        	line-height : 150px;
            width:30px;
            height:30px;
        }
        .cp_pNameDetail{
            color:gray;
            font-size: 15px;
            /* font-weight: 700; */
            padding-top: 50px;
        }
        .cp_pName{
            font-size:20px;
            /* font-weight: 700; */
        }
        .cp_count{padding-top: 70px;}
        .cp_count>input{
            width:100px;
            text-align: center;
        }
        .cp_delivery{
            color:red;
            font-size: 14px;
            /* font-weight: 700; */
            padding-top: 50px;
        }
        .cp_price{
        	line-height : 160px;
        	text-align : center;
            font-size:22px;
            /* font-weight: 700; */
        }
        .cp_img{
            width:150px;
            
        }
        /* 하단의 전체선택, 선택삭제버튼 */
        #cart_check>div{
            display: inline-block;
        }
        #cart_check>div>button{
            opacity: 0.7; 
        }
        #btn1{
            background-color: white;
            color: black;
        }
        #btn2{
            background-color: black;
            color: white;
        }

        /* 결제정보창 */
        #cart_result{
            font-size: 20px;
            width:1000px;
            height:100px;
            border:3px solid gray;
            margin-top: 50px;
            line-height: 80px;
        }
       /* 구매하기 버튼 */
                #btn{
            margin-top: 50px;
            background-color:rgba(24,189,234, 0.5);
            border-radius: 5px;
            color: white;
            font-size: 20px;
            font-weight: 700;
            width: 200px;
            height: 50px;
        }


        
        /* 부트스트랩 테이블 */
        .table>thead>th{
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
        <div id="cart_title">
            <div id="cart_title1"><img src="resources/image/장바구니.png" alt="" width="70px" height="70px" style="margin : 0px;"></div>
            <div id="cart_title2">
            	<h2 style="display : inline-block; float : left">장바구니</h2>
            	<button type="button" onclick="history.go(-2)" style="float : right; margin-left : 800px; margin-bottom : 10px" class="btn btn-light btn-sm">다른제품추가</button>
            </div>
        </div>
        <br><br>
        <br clear="both">
        <div id="cart_product">
            <table class="table table-hover" id="table">
                <thead>
                    <tr>
                        <th width="120px">제품이미지</th>
                        <th width="300px">제품명</th>
                        <th width="200px">수량</th>
                        <th width="140px">가격</th>
                        <th width="70px"><input type="checkbox" id="ck_all"></th>
                    </tr>
                </thead>
                <tbody id="bo1">
                <% int tot = 0; 
                   int cartNo = 0;
                   String delevery = "배송비 : 2500원";
                %>
                <%for(MyCart cart : cart_list){ %>
                    <tr align="center">
                        <td><img src="<%=cart.getProImgPath() %>" alt="" class="cp_img"></td>
                        <td class="cp_pNameAll">
                            <div class="cp_pNameDetail"><%=cart.getProEffi()%></div>
                            <div class="cp_pName"><%=cart.getProName() %></div>
                        </td>
                        <td>
                            <div class="cp_count"><%=cart.getCartAmount()%></div>
                        </td>
                        <td>
                            <div class="cp_price"><%=formatter.format(Integer.parseInt(cart.getTotalPrice())) %></div>
                        </td>
                        <td>
                            <div>
                                <input type="checkbox" name="cp_check" value="<%=cart.getCartNo()%>">
                            </div>
                        </td>
                    </tr>
       					<% tot += Integer.parseInt(cart.getTotalPrice()); %>
                    <%} %>
                </tbody>
            </table>
            <div id="cart_check" align="right">
               	<button type="button" class="btn btn-light btn-sm" id="btn2" onclick="delete_checked();">선택삭제</button>
            </div>
        </div>
       
        <div id="cart_result" align="center">
            <table style="text-align: center">
                <tr>
                    <th width="100px" style="font-size:17px; color:black; opacity:0.4; padding-top: 10px;">총 상품금액</th>
                    <td width="200px" style="font-size:30px"><%=formatter.format(tot)%></td>
                    <td width="50px">+</td>
                    <th width="100px" style="font-size:17px; color:black; opacity:0.4; padding-top: 10px;">배송비</th>
                     <%if(tot==0){%>
                    	<td width="120px" style="font-size:30px">0원</td>
                    <%}else{ %>
                    	<td width="120px" style="font-size:30px">2,500원</td>
                    <%} %>
                    <td width="50px">=</td>
                    <th width="150px" style="font-size:17px; color:black; opacity:0.4; padding-top: 10px;">결제예정금액</th>
                    <% if(tot==0){ %>
                    	<td width="180px" style="font-size:30px; color:red" id="orderPrice"><%=formatter.format(tot+0) %></td>
                	<%}else{ %>
                		 <td width="180px" style="font-size:30px; color:red" id="orderPrice"><%=formatter.format(tot+2500) %></td>
                	<%} %>
                </tr>
            </table>
        </div>
        <div id="content_button" align="center">
            <button type="button" class="btn btn-light btn-sm" id="btn" onclick="pur();">구매하기</button>
        </div>
    </div>
	<%@ include file="../common/footer.jsp" %>
	
	<script type="text/javascript">
	 $(document).ready(function() {
	        $("#ck_all").click(function() {
	            if($("#ck_all").is(":checked")) $("input[name=cp_check]").prop("checked", true);
	            else $("input[name=cp_check]").prop("checked", false);
	        });
	        
	        $("input[name=cp_check]").click(function() {
	            var total = $("input[name=cp_check]").length;
	            var checked = $("input[name=cp_check]:checked").length;
	            
	            if(total != checked) $("#ck_all").prop("checked", false);
	            else $("#ck_all").prop("checked", true); 
	        });
	 });
		function delete_checked() { 
        	var chkObj = document.getElementsByName("cp_check");
            var chkDelStr = {}; 
            var list = {};
            
             for(var i=0; i<chkObj.length; i++) {  
            
                var chkObjElement = chkObj[i]; 
                
                 if(chkObjElement.checked) { 
                	 
                       chkDelStr[i] = chkObjElement.value + "/";  
                       list += chkDelStr[i];
                    } 
                }

                 if(chkDelStr == "") {  
                    alert("선택된 제품이 없습니다.");  
                    return false; 
                }

                list = list.substring(15, list.length-1);
                
             
	             if(!confirm("제품 삭제를 클릭하셨습니다. \r\n\n 정말로 삭제하시겠습니까?")) return false;       
	                	
	                location.href="<%=contextPath%>/mycartDel.ca?cartNo="+list;
				}
                var chkOnOffFlag = 0;
                
           		function chkOnOff() { 
                	if(chkOnOffFlag == 0) chkOnOffFlag++; 
                	else chkOnOffFlag--;   
                	var chkObj = document.getElementsByName("cp_check"); 
                	
                	for(var i=0; i<chkObj.length; i++) {  
                		var chkObjElement = chkObj[i];  
                		chkObjElement.checked = chkOnOffFlag; 
                	}
                }

           		
           	function pur(){ 
           		var chkObj = document.getElementsByName("cp_check");
                var chkDelStr = {}; 
                var list = {};
                
                 for(var i=0; i<chkObj.length; i++) {  
                
                    var chkObjElement = chkObj[i]; 
                    
                     if(chkObjElement.checked) { 
                    	 
                           chkDelStr[i] = chkObjElement.value + "/";  
                           list += chkDelStr[i];
                    }else{
                    	alert("선택된 제품이 없습니다.");  
	                    return false; 
                    }
                    /* if(chkDelStr=="") {  
	                    alert("선택된 제품이 없습니다.");  
	                    return false; 
	               	} */
                }
                    list = list.substring(15, list.length-1);
           		
           	 		location.href="<%=contextPath%>/purbefor.pu?cartNo="+list;
           	 		
            } 
  </script>
</body>
</html>