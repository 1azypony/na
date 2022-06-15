<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.info.model.vo.Qna" %>    
<%
	Qna q = (Qna)request.getAttribute("q");
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
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <title>1대1문의추가</title>
    <style>
     div{
          box-sizing: border-box;
          /* border: 1px solid red;  */
      }
      .wrap{
          width: 1000px;
          height: 1000px;
          margin: auto; /*가운데정렬*/
      }
      
      body{
        font-family: "Sofia", sans-serif;
       }
       /* content영역 */
       .content{
           width: 1000px;
           height : 500px;
           margin-top : 50px;
           padding-right: 50px;
       }
       .content_title{
           float:right;
           width:85%;
           height: 100px;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;
          /* padding-left:50px; */
          padding-right: 50px;
           /* border-color: blue; */
       }
        .content_detail{
            width:800px;
            height: 160px;
            float:right;
            /* border-color: blue; */
        }
        .cd_table{
            border : 1px solid gainsboro;
            height:130px;
        }
        .cd_table>table{
            font-size: 16px;
            border-collapse: collapse;
        }
        .cd_table>table th{
            background-color: gainsboro;
            color:rgb(51,51,51);

        }
        .cd_table>table td{
            padding-left: 10px;
            font-weight: 700;
        }
        .cd_content_title{
            /*border:1px solid blue;*/
            font-size: 20px;
            font-weight: 700;
            height:30px;
        }
        .cd_content_view{
            border:1px solid black;
            height:200px;
            text-align: center;
            line-height: 200px;
            font-size: 15px;
            font-weight: 700;
            margin-top: 20px;
        }
        .cd_text1{
            height:50px;
            font-size: 20px;
            font-weight: 700;
        }
        .cd_text2{
            resize:none;
            font-size: 15px;
        }
        .cd_text3>input{
            height:50px;
            width:100px;
            background-color: rgba(24,189,234, 0.5);
            border:none;
            color:white;
            font-weight: 700;
            font-size: 18px;
            border-radius: 5px;
        }
        .cd_text3{ text-align: right; margin-top: 20px; width:825px;}

       
    </style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>
    <div class="wrap" style="margin-bottom:100px;">
       <div class="content">
           <div class="content_title">
                <div id="title" style="color:rgba(36, 49, 121, 0.9);">
                    1:1문의글 추가
                    <br>
                </div>
                
           </div>     
      
    <form action="<%=contextPath%>/inqueryupdate.in" method="post">   
    <input type="hidden" name="inqueryNo" value="<%=q.getInqNo()%>">      
            <div class="content_detail">
                <div class="cd_table">
                    <table>
                        <tr>
                            <th width="200" style="padding-left:20px;">글번호</th>
                            <td width="700" style="padding-left:20px;"><%=q.getInqNo() %></td>
                        </tr>
                        <tr>
                            <th style="padding-left:20px;">제목</th>
                            <td style="padding-left:20px;"><%=q.getInqTitle() %></td>
                        </tr>
                        <tr>
                            <th style="padding-left:20px;">작성자</th>
                            <td style="padding-left:20px;"><%=q.getUserNo() %></td>
                        </tr>
                        <tr>
                            <th style="padding-left:20px;">작성일</th>
                            <td style="padding-left:20px;"><%=q.getInqDate() %></td>
                        </tr>
                        <tr>
                            <th style="padding-left:20px;">답변여부</th>
                            <td style="padding-left:20px;">답변완료</td>
                        </tr>
                    </table>
                </div>
                <div class="cd_content">
                    <div class="cd_content_title" style="margin-top:50px;">내용</div>
                    <div class="cd_content_view"><%=q.getInqQuery() %></div>                  
                    <br>
                    <div class="cd_text">
                        <div class="cd_text1" style="margin-top:50px;">문의글 내용</div>
                        <textarea name="answer" class="cd_text2" cols="110" rows="10" placeholder="내용을 입력해주세요."></textarea>
                    </div>
                        <div class="cd_text3" style="margin-top:150px;">
                        <button type="submit" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white; width:70px;"> 저장 </button>
                       	<button type="button" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white; width:70px;"
                        onclick="javascript:history.back();"> 뒤로 </button>
                   	</div>
                </div>
            </div>
        </div>
    </form>
    </div>
    <!--푸터-->
    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>