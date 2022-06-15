<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ추가</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


    <style>
      div{
          box-sizing: border-box;
         /* border: 1px solid red; */
          /*가이드라인 */
      }
      .wrap{
          width: 1000px;
          height: 800px;
          margin: auto; /*가운데정렬*/
      }
    
       body{
        font-family: "Sofia", sans-serif;
       }
      /* content영역 */
      .content{
           /* border : 1px solid red; */
           width: 1000px;
           height :300px;
           margin-top : 50px;
           padding-right: 50px;
       }
       .content_title{
           float:right;
           width:85%;
           height:21%;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;
           /* padding-left:50px; */
           padding-right: 50px;
           /* border:1px solid red; */
       }
       
        .content_detail{
            float:right;
            width: 800px;
            height: 700px;
            /* border:1px solid red; */
            margin-top:15px;
        }
     
      #form_table{
          border-left: 1px solid rgb(170, 170, 170);
          border-right: 1px solid rgb(170, 170, 170);
      }

      #form_table th{
          text-align: center;
          background-color: gainsboro;
      }
      #form_table td{
          padding-left: 15px;
      }
      #form_table tr{
          border-top: 1px solid rgb(170, 170, 170);
      }

      #text_outer{
          border: 1px solid rgb(170, 170, 170);
          width:750px;
          height:405px;
          margin: 10px;
          margin-left: 25px;
      }

      #text_insert {
          resize: none;
          margin: 20px;
          padding: 10px;
      }

      #sub_btn{ width:100px; height:40px; margin-right:10px; }
      #text_insert { resize:none;}


    </style>

</head>
<body>
<!--헤더-->
 <%@ include file="../common/header_admin.jsp" %>
  <br><br><br>
    <div class="wrap">
      
       <div class="content">
        <div class="content_title">
             <div style="color:rgba(36, 49, 121, 0.9);">
                 FAQ 추가
                 <hr style="border:rgba(73, 71, 71, 0.5) 1px solid;">
             </div>
        </div>
      
         
         <div class="content_detail">
            <br><br>
            <form action="<%=contextPath %>/insert.fa" method="post">

            <table id="form_table" align="center">
               
                <tr>
                    <th width="150" height="35">제목</th>
                    <td width="600"><input type="text" name="titlef" style="width:500px;" placeholder="제목을 입력하세요" required> </td>
                </tr>
                <tr style="border-bottom:1px solid black;">
                    <th height="35">작성자</th>
                    <td>admin</td>
                </tr>
              
            </table>
            <div id="text_outer"  style="resize:none;">
            <textarea id="text_insert" name="desf" rows="14" cols="91" placeholder="내용을 입력하세요"  style="resize:none;" required></textarea>
            </div>
            
            <div align="right" style="margin:30px;">
                <button type="submit" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">
                                저장
               </button>
               <button type="button" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: black; color: white;" onclick="history.back();">뒤로가기</button>
            </div>

            </form>
         </div>
    </div>
    </div>
    <!--푸터-->
    <%@ include file="../common/footer_admin.jsp" %>
</body>
</html>