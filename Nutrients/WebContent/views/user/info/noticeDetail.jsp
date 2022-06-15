<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.info.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>제품보기</title>
    <style>
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }

     div{
          box-sizing: border-box;
          /*border: 1px solid red; /*가이드라인*/
          /* height : 100%; */
      }



      .content{
          width:1000px;
          height : 852px;
          /* border: 1px solid black; */
          margin:auto;
      }


 
        .content div{
            height: 0%;
        }
        .content{
            position: relative;
        }
        #side_menubar{
            width: 150px;
            height: 852px;
            display: inline-block;
            float: left;
            position: absolute;
        }
        #content_header{
            width: 85%;
            height: 100%;
            float: right;
        }
        #content_body1{
            width: 100%;
            height: 70px;
        }
        #content_body2{
            width: 100%;
            height: 780px;
            margin: 0px;
            /* border:1px solid black; */
        }
        #side_menubar_1{width: 100%; height: 50px;}
        #side_menubar_2{width: 100%; height: 170px;}
        #side_menubar_3{width: 100%; height: 500px;}

        #side_menubar_1>p{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 25px;
            color: rgba(36, 49, 121, 0.6);
            margin-top: 70px;
            margin-left: 30px;
            margin-bottom: 0px;
            font-weight: bolder;
        }
        #side_menubar_2>button{
            display: block;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            width: 100%;
            height: 50px;
            background-color: rgba(24,189,234, 0.5);
            color: white;
            border: rgba(73, 71, 71, 0.5) 0px solid;
            border-radius: 5px;
            margin:2px;
        }
        #side_menubar_2>button:hover{
            background-color: white;
            color: black;
            border: 1px solid rgb(192, 192, 192);
        }

        #content_body1>h2{
            margin-left: 30px;
            color: rgba(36, 49, 121, 0.9);
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 30px;
            margin-top: 50px;
            margin-bottom: 0px;
        }

        #content_body1>hr{
            width: 800px;
        }



        .content_detail{
            /* float:right; */
            width: 700px;
            height: 600px;
            /* border:1px solid red; */
            margin-top:15px;
            margin-left: 80px;
        }


        
        #notice_paging{
			width:100px;
			margin:auto;
			margin-top:50px;
        }
        
        #tbody_paging>tr:hover{
        cursor:pointer;
        }

        



    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
       <div class="content">
           <!--왼쪽 사이드메뉴바 정렬-->
           <br>
           <div id="side_menubar">
               <div id="side_menubar_1">
                   <p>고객센터</p>
               </div>
               <div id="side_menubar_2">
                   <button onclick="location.href='<%=contextPath%>/noticeList.no?currentPage=1'">공지사항</button>
                   <button onclick="location.href='<%=contextPath%>/faqList.fa'">FAQ</button>
                   <button onclick="location.href='<%=contextPath%>/qnalist.in?currentPage=1'">1:1문의</button>
                   <button onclick="location.href='<%=contextPath%>/contract.in'">약관및방침</button>
               </div>
               <div id="side_menubar_3"></div>
           </div>
           <div id="content_header">
                <div id="content_body1">
                    <h2>공지사항</h2>
                    <hr>
                </div>
                <div id="content_body2">
                         
                    <div class="content_detail">
                        <table class="cd_table table" align="center" style="text-align:center;">
                        <thead>
                            <tr>
                                <th width="80"><%=n.getNotiNo() %></th>
                                <th width="600"><%=n.getNotiTitle() %></th>
                                <th width="100"><%=n.getNotiDate() %>
                            </tr>
                        </thead>
                        <tbody id="tbody_paging">

                            <tr>
                                <td colspan="3"><%=n.getNotiDes() %></td>
                            </tr>

                        </tbody>
                        </table>


                    </div>




                </div>
           </div>
       </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>