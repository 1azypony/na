<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.order.model.vo.MyCart, java.util.*, java.text.*" %>
<%
	DecimalFormat formatter = new DecimalFormat("###,###");
	ArrayList<MyCart> order_list = (ArrayList<MyCart>)request.getAttribute("orderList");
	String list = (String)request.getAttribute("list");
	
	System.out.println(list);
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
       /* content */
        div{
            /* border:1px solid red; */
        }
        #content{
            /* border:1px solid red; */
            width:1000px;
            height:100%;
            margin: auto;
        }
        #content_orderAddress_title{
            /* border:1px solid red; */
            height:50px;
            margin:auto;
            margin-top: 20px;
        }
        #content_orderAddress_title>div{
            /* border : 1px solid red; */
            display: inline-block;
            font-size: 30px;
        }
        #cot_title1{width:120px; height:30px; font-weight: 700;}
        #cot_title2{width:40px; height:30px; text-align: center;}
        #cot_title3{width:220px; height:30px; font-weight: 700;}
        
        #co_title{
            /* border:1px solid red; */
            height:50px;
            /* font-weight: 700; */
        }
        .img{
            width:80px;
            height:80px;
        }
        .table{
            font-size: 15px;
        }


        #content_order_table{
            font-size: 18px;
            text-align: center;
        }
        #cot_table{
            border-collapse: collapse;
        }

        /* 주문자 정보 */
        #cc_table th{
            text-align: left;
        }
        #cc_table_annotation{
            font-size: 12px;
            font-weight: 700;
            color:red;
        }

        /* 배송지 정보 */ 
        #ca_table th{
            text-align: left;
        }
        /* 결제 정보 */
        #cp_table th{
            text-align: left;
        }
        #cp_table input{
            background-color: yellow;
            border: none;
            height:50px;
            font-weight: 700;
            cursor:pointer;
            border-radius: 5px;
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
        <div id="content_orderAddress_title">
            <div id="cot_title1">주문내역</div>
            <div id="cot_title2">및</div>
            <div id="cot_title3">배송지 정보</div>
        </div>
        <div id="content_order">
            <div id="co_title" style="font-size:20px; font-weight:700; margin-top:20px;">
              	  상품정보
            </div>
            <div id="content_order_table">
                <table class="table table-hover" class="table">
                    <thead>
                        <tr>
                            <th width="120px">상품이미지</th>
                            <th width="700px">상품제목</th>
                            <th width="150px">수량</th>
                            <th width="150px">가격</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% int tot = 0;
                       String email = "";
                       int cartNo = 0;%>
                    <%for(MyCart m : order_list){ %>
                        <tr>
                            <td><img class="img" src="<%=m.getProImgPath() %>" alt=""></td>
                            <td style="text-align:center; padding-top:30px;">
                                <div><%=m.getProEffi() %></div>
                                <div><%=m.getProName() %></div>
                            </td>
                            <td>
                                <div style="text-align:center; padding-top:30px;"><%=m.getCartAmount() %>개</div>
                            </td>
                            <td>
                                <div style="text-align:center; padding-top:30px;"><%= formatter.format(Integer.parseInt(m.getProPrice()))%></div>
                            </td>
                        </tr>
                        
                        <% tot += Integer.parseInt(m.getProPrice()); %>
                        <% email = m.getUserEmail(); %>
                   		<%} %>
            		</tbody>
            		</table>
                   	<div style="text-align:center;  float : right; color : navy;"> 
                   		* 상품 총 가격 : <%=formatter.format(tot)%> + 
                   		배송비 : 2,500원 = <b style="color :red;">총 결제금액 <%=formatter.format(tot+2500)%>원</b>
                   	</div>
            </div> 
        </div>
        <br><br>
        <div id="content_customer">
            <div id="cc_title" style="font-size:20px; font-weight:700;">
            	주문자 정보
            	</div>
            <hr>
            <div id="cc_table">
                <table>
                <% MyCart m = order_list.get(0); %>
                    <tr>
                        <th width="120px">보내는분</th>
                        <td width="700px" style="padding-left:30px"><%=m.getUserName()%></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td style="padding-left:30px"><%=m.getUserEmail() %></td>
                    </tr>
         			
                    <tr class="cc_table_annotation">
                        <th></th>
                        <td style="padding-left:30px; color : navy;" > 이메일을 통해 주문처리과정을 보내드립니다.  </td>
                    </tr>
                    <tr class="cc_table_annotation">
                        <th></th>
                        <td style="padding-left:30px; color : red;"> 정보변경은 마이페이지 > 개인정보수정 메뉴에서 가능합니다.</td>
                    </tr>
                </table>
            </div>
        </div>
        <br><br>
        
        <div id="content_address">
            <div id="ca_title" style="font-size:20px; font-weight:700;">
            	배송 정보
            </div>
            <hr>
            <form action="<%=contextPath %>/purcahse.pu" method="post"> 
            <div id="ca_table">
                <table>
                     <tr>
                        <th width="120px">배송지</th>
                        <td width="700px" style="padding-left:30px">
                            <input type="text" style="width:350px; margin-bottom: 5px; border-radius: 5px" name="delivery_add" required placeholder="반드시 입력해주세요">
                        </td>
                    </tr>
                    <tr>
                        <th>받으실 분</th>
                        <td style="padding-left:30px">
                            <input type="text" style="width:200px; margin-bottom: 5px; border-radius: 5px" name="sendName" required placeholder="받으실분">
                        </td>
                    </tr>
                    <tr>
                        <th>휴대폰</th>
                        <td style="padding-left:30px">
                            <input type="text" style="width:200px; margin-bottom: 5px; border-radius: 5px" name="phone" required placeholder="(-)빼고 입력">
                        </td>
                    </tr>
                    <tr>
                        <th>배송장소</th>
                        <td style="padding-left:30px">
                            <select name="arrival">
                                <option value="문앞">문앞</option>
                                <option value="경비실">경비실</option>
                                <option value="택배함">택배함</option>
                                <option value="기타장소">기타장소</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        
        <br><br>
        <div id="content_payment">
            <div id="cp_title" style="font-size:20px; font-weight:700;">
            	결제 정보
            </div>
            <hr>
            <div id="cp_table">
                <table>
                    <tr>
                        <th width="120px">결제수단 선택</th>
                        <td width="700px" style="padding-left:30px">
                            <input type="submit" style="width:150px" value="KaKao결제">
                        </td>
                    </tr>
                </table>    
            </div>
        </div>
        <br><br>
        <input type="hidden" name="cartNo" value="<%=list%>">
        <input type="hidden" name="email" value="<%=email%>">
        <input type="hidden" name="totalPrice" value="<%=tot%>">
       <!--  <div id="content_button" align="center">
            <button type="button" class="btn btn-light btn-sm" id="btn" onclick="">구매하기</button>
        </div> -->
        </form>
    </div>  
</div>
<%@ include file="../common/footer.jsp" %>  

</body>
</html>