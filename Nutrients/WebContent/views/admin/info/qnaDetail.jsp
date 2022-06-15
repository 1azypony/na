<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    <title>1대1문의상세</title>
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
            
            height:150px;
        }
        .cd_table>table{
            margin-top: 20px;
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
            font-size: 30px;
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
            font-size: 20px;
        }
        
    </style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>
  <br><br><br>
    <div class="wrap">
       <div class="content">
           <div class="content_title">
                <div id="title" style="color:rgba(36, 49, 121, 0.9);">
                    1:1문의글 상세
                    <br>
                    <hr style="border:rgba(73, 71, 71, 0.5) 1px solid";>
                </div>
                
           </div>         
            <div class="content_detail">
                <div class="cd_table">
                    <table border>
                        <tr>
                            <th width="200">글번호</th>
                            <td width="700">50</td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>신난다</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>user01</td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td>2022-04-26</td>
                        </tr>
                        <tr>
                            <th>답변여부</th>
                            <td>답변완료</td>
                        </tr>
                    </table>
                </div>
                <div class="cd_content">
                    <div class="cd_content_title">내용</div>
                    <div class="cd_content_view">내용 미리보기</div>                  
                    <br>
                    <hr style="border:rgba(73, 71, 71, 0.5) 1px solid";>
                    <div class="cd_text">
                        <div class="cd_text1">문의글 내용</div>
                        <textarea name="" class="cd_text2" cols="80" rows="10" ></textarea>
        
                    </div>
                </div>
            </div>
        </div>
    
    </div>
    <!--푸터-->
    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>