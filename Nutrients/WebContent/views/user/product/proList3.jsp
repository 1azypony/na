<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.product.model.vo.Product, com.na.template.model.vo.PageInfo" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>제품보기</title>
    <style>
     div{
          box-sizing: border-box;
          /*border: 1px solid red; /*가이드라인*/
          height : 100%;
      }
      body{
        font-family: 'Noto Sans KR', sans-serif;
      }

      .content{
          height : 1144px;
          width : 1000px;
          margin: auto;
          margin-top:50px;
      }



        /*content영역 정렬*/
        h2{
            text-align: center;
            color: rgba(48, 48, 49, 0.6);
            font-size: 25px;
        }
        /*검색영역*/
        .content{
            position: relative;
            height: 90%;
        }
        .content>div{height: 0;}
        #search{height: 450px;}
        #search_1{height: 110px;}
        #search_2{height: 40px;}
        #search_3{height: 270px;}
        #pro_orderby{height : 30px; }
        #pro_list1, #pro_list2{ height : 410px;}
        #pro_paging{ height : 30px;}

        #search_1>h2{
            font-family: 'Noto Sans KR', sans-serif;
            color: rgba(7, 7, 7, 0.5);
            font-size: 30px;
            font-weight: 700;
        }

        hr{color: rgba(73, 71, 71, 0.5);}
        #search_2>div{ float: left;}
        #search_2_1{ width: 220px;}
        #search_2_2{ width: 530px;}
        #search_2_3{ width: 120px;}

        #pro_orderby>div{
            float: right;
            width: 200px;
        }
        #pro_orderby>div>a{
            text-decoration: none;
            font-size: 12px;
            line-height: 30px;
            color : rgba(73, 71, 71, 0.5);
        }
        #pro_list1>div{float: left;}
        #pro_list1_1, #pro_list1_7{width: 80px;}
        #pro_list1_3, #pro_list1_5{width: 30px;} 
        #pro_list1_2, #pro_list1_4, #pro_list1_6{width: 258px;}


        #pro_list2>div{float: left;}
        #pro_list2_1, #pro_list2_7{width: 80px;}
        #pro_list2_3, #pro_list2_5{width: 30px;} 
        #pro_list2_2, #pro_list2_4, #pro_list2_6{width: 258px;}

        #search_2_2>input{
            width: 500px;
            height: 20px;
            margin-left: 10px;
            margin-top: 5px;
        }
        #search_2_3>input{
            width: 100px;
            margin-top : 5px;
        }
        #search_3>#cat_t{
            width: 900px;
            height: 100px;
            border: 5px double rgba(209, 206, 206, 0.5);
            margin: auto;
            margin-top: 50px;
        }
        #cat_t>tr{
            text-align: right;
            height: 50px;
            width: 40px;
            border: 5px double rgba(209, 206, 206, 0.5);
            font-size: 15px;
        }
        #cat_t th{
            height: 50px;
            width: 40px;
            font-size: 15px;
            text-align: center;
        }
        #cat_t td{
            text-align: right;
            height: 50px;
            width: 40px;
            font-size: 15px;
        }
        #cat_t a{
            color: black;
            text-decoration: none;
        }

        #pro_list1_2>div, #pro_list1_4>div, #pro_list1_6>div{height: 0px;}
        #pro_list2_2>div, #pro_list2_4>div, #pro_list2_6>div{height: 0px;}
        
        #pro_list1_2>#pro_list1_2_img, #pro_list1_4>#pro_list1_4_img, #pro_list1_6>#pro_list1_6_img{ 
            height: 330px;
           /* border: 1px solid rgba(209, 206, 206, 0.5); */
        }

        #pro_list1_2_img>img, #pro_list1_4_img>img, #pro_list1_6_img>img{ 
            width: 100%;
            height: 100%;
        }

        #pro_list2_2_img>img, #pro_list2_4_img>img, #pro_list2_6_img>img{ 
            height: 100%;
            width: 100%;
        }

        #pro_list2_2>#pro_list2_2_img, #pro_list2_4>#pro_list2_4_img, #pro_list2_6>#pro_list2_6_img{ 
            height: 330px;
           /* border: 1px solid rgba(209, 206, 206, 0.5); */
        }

        #pro_list1_2>#pro_list1_2_detail, #pro_list1_4>#pro_list1_4_detail, #pro_list1_6>#pro_list1_6_detail{ 
            height: 80px;
            /*border: 1px solid rgba(209, 206, 206, 0.5); */
            text-align:right;
        }
        #pro_list2_2>#pro_list2_2_detail, #pro_list2_4>#pro_list2_4_detail, #pro_list2_6>#pro_list2_6_detail{ 
            height: 80px;
           /* border: 1px solid rgba(209, 206, 206, 0.5); */
            text-align:right;
        }

        #pro_paging{
        	width:350px;
            margin: auto;
            margin-top: 50px;
        	margin-bottom: 50px;
        }
		#pro_list1_2:hover, #pro_list1_4:hover, #pro_list1_6:hover, #pro_list2_2:hover, #pro_list2_4:hover, #pro_list2_6:hover{
			opacity:0.5;
			cursor:pointer;
		}
	
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

      <!--content의 body영역-->
       <div class="content">
            <!--검색정렬-->
            <div id="search">
               <form id="search_form" action="proSearch.pr" method="get">
                <div id="search_1">
                    <h2 style="color:rgba(36, 49, 121, 0.9);">상품검색</h2>
                    <hr>
                </div>
                <div id="search_2">
                    <div id="search_2_1"></div>
                    <div id="search_2_2">
                        <input type="text" name="keyword" placeholder="검색할 키워드를 입력해주세요." style="height: 36px;" maxlength="20">
                        <input type="hidden" name="currentPage" value="1">
                    </div>
                    <div id="search_2_3">
                        <input type="submit" class="btn btn-light" value="검색" style="color:white; background-color:rgba(24,189,234, 0.5)">
                    </div>
                    <div id="search_2_4"></div>
                </div>
                </form>
                <!-- 상품 카테고리 선택 테이블 -->
                <form action="proSearch2.pr" method="get">
                <input type="hidden" name="currentPage" value="1">                
                <div id="search_3">
                    <table id="cat_t" style="border:2px solid rgba(209, 206, 206, 0.5)">
                        <tr>
                            <th style="background-color:rgba(24,189,234, 0.5)">효능</th>
                            <td><input type="radio" name="s1" value="혈액개선" checked> 혈액개선</td>
                            <td><input type="radio" name="s1" value="시력개선"> 시력개선</td>
                            <td><input type="radio" name="s1" value="면역력증진"> 면역력증진</td>
                            <td><input type="radio" name="s1" value="에너지충전"> 에너지충전</td>
                            <td><input type="radio" name="s1" value="간기능개선"> 간기능개선</td>
                            <td></td>
                        </tr>
                        <tr style="border-bottom:2px solid rgba(209, 206, 206, 0.5);">
                            <th style="background-color:rgba(24,189,234, 0.5)"></th>
                            <td><input type="radio" name="s1" value="배변활동"> 배변활동</td>
                            <td><input type="radio" name="s1" value="피부건강"> 피부건강</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th style="background-color:rgba(24,189,234, 0.5)">가격</th>
                            <td><input type="radio" name="s2" style="width:17px;" value="1" checked> 1~3만원</td>
                            <td><input type="radio" name="s2" style="width:20px;" value="2"> 3~5만원</td>
                            <td><input type="radio" name="s2" style="width:45px;" value="3"> 5~7만원</td>
                            <td><input type="radio" name="s2" style="width:30px;" value="4"> 7~10만원</td>
                            <td colspan="2" style="padding-left:1px; width:00px;"> </td>

                        </tr>
                        <!-- 조회버튼 추가와 가격앞에 라디오박스, hr 둘중 하나 제거하고 페이징바 추가, 제품명 효능 가격 보더 색 옅게(hr색으로)
                              -->
                    </table>
                    <div style="margin-left:750px; margin-top:25px;">
                        <input type="submit" class="btn btn-light" value="조회"
                        style="color:white; width:100px; 
                        background-color:rgba(24,189,234, 0.5);"></div>
                </div>
                
                </form>
            </div>
            <hr>
            <!--상품리스트정렬(orderby)-->
            <div id="pro_orderby">
                <div>
                <a href="<%=contextPath%>/proList.pr?currentPage=1">신상품순  |  </a>
                <a href="<%=contextPath%>/proList2.pr?currentPage=1">높은가격순  |  </a>
                <a href="<%=contextPath%>/proList3.pr?currentPage=1">낮은가격순 </a>
                </div>
            </div>

            <br>
            <!--상품리스트view1-->
            <div id="pro_list1">
                <div id="pro_list1_1"></div>
                <div id="pro_list1_2"<%if(list.size()>0){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(0).getProNo()%><%}%>'">
                    <div id="pro_list1_2_img">
                        <img src="<%if(list.size()>0){ %><%=list.get(0).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list1_2_detail" style="padding-right:15px;"><%if(list.size()>0){ %><%=list.get(0).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>0){ %><%=list.get(0).getProEff() %><%}%></span><br>
                    <%if(list.size()>0){ %><%=list.get(0).getPrice()+" 원" %><%}else{%><%}%>
                    </div>
                </div>
                <div id="pro_list1_3"></div>
                <div id="pro_list1_4"<%if(list.size()>1){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(1).getProNo()%><%}%>'">
                    <div id="pro_list1_4_img">
                        <img src="<%if(list.size()>1){ %><%=list.get(1).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list1_4_detail" style="padding-right:15px;"><%if(list.size()>1){ %><%=list.get(1).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>1){ %><%=list.get(1).getProEff() %><%}%></span><br>
                    <%if(list.size()>1){ %><%=list.get(1).getPrice()+" 원" %><%}else{%><%}%></div>
                </div>
                <div id="pro_list1_5"></div>
                <div id="pro_list1_6"<%if(list.size()>2){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(2).getProNo()%><%}%>'">
                    <div id="pro_list1_6_img">
                        <img src="<%if(list.size()>2){ %><%=list.get(2).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list1_6_detail" style="padding-right:15px;"><%if(list.size()>2){ %><%=list.get(2).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>2){ %><%=list.get(2).getProEff() %><%}%></span><br>
                    <%if(list.size()>2){ %><%=list.get(2).getPrice()+" 원" %><%}else{%><%}%></div>
                </div>
                <div id="pro_list1_7"></div>
            </div>

            <br>
            <!--상품리스트view2-->
            <div id="pro_list2">
                <div id="pro_list2_1"></div>
                <div id="pro_list2_2"<%if(list.size()>3){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(3).getProNo()%><%}%>'">
                    <div id="pro_list2_2_img">
                        <img src="<%if(list.size()>3){ %><%=list.get(3).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list2_2_detail" style="padding-right:15px;"><%if(list.size()>3){ %><%=list.get(3).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>3){ %><%=list.get(3).getProEff() %><%}%></span><br>
                    <%if(list.size()>3){ %><%=list.get(3).getPrice()+" 원" %><%}else{%><%}%></div>
                </div>
                <div id="pro_list2_3"></div>
                <div id="pro_list2_4"<%if(list.size()>4){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(4).getProNo()%><%}%>'">
                    <div id="pro_list2_4_img">
                        <img src="<%if(list.size()>4){ %><%=list.get(4).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list2_4_detail" style="padding-right:15px;"><%if(list.size()>4){ %><%=list.get(4).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>4){ %><%=list.get(4).getProEff() %><%}%></span><br>
                    <%if(list.size()>4){ %><%=list.get(4).getPrice()+" 원" %><%}else{%><%}%></div>
                </div>
                <div id="pro_list2_5"></div>
                <div id="pro_list2_6"<%if(list.size()>5){ %> onclick="location.href='/na/proDetail.pr?pno=<%=list.get(5).getProNo()%><%}%>'">
                    <div id="pro_list2_6_img">
                        <img src="<%if(list.size()>5){ %><%=list.get(5).getProImgPath()%><%}%>" onerror="this.style.display='none';" />
                    </div>
                    <div id="pro_list2_6_detail" style="padding-right:15px;"><%if(list.size()>5){ %><%=list.get(5).getProName() %><%}%><br>
                    <span style="color:gray;"><%if(list.size()>5){ %><%=list.get(5).getProEff() %><%}%></span><br>
                    <%if(list.size()>5){ %><%=list.get(5).getPrice()+" 원" %><%}else{%><%}%></div>
                </div>
                <div id="pro_list2_7"></div>
            </div>
            
            <br clear="both">
            <!--페이징 영역-->
            
            <div id="pro_paging" class="page_nation">
            <%if(list.size()!=0){ %> 
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proList3.pr?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>            
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proList3.pr?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>     
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}} %>      
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			               
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/proList3.pr?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>                    
                    </ul>
            <%} %>
            </div>
     </div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>