<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.product.model.vo.Product" %>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NUTRIENTS ALMIGHTY</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">

    <style>

        *{
                font-family: 'Noto Sans KR', sans-serif;
            }

      div{
          box-sizing: border-box;
          /* border: 1px solid red; */
          /*가이드라인 */
      }





      /* content영역 */
      .content{

           width: 1000px;
           height : 1100px;
           margin : auto;
           margin-top : 50px;
       }
       .content_title{
           margin: auto;
           width:80%;
           height:100px;
           font-size: 40px;
           font-weight: 700;
           padding-top:10px;

           /* border:1px solid red; */
       }


        .content_detail{
            float:right;
            width: 1000px;
            height: 600px;
            /* border:1px solid red; */
            margin:auto;
            margin-top:50px;

        }

                
        #mem_paging{
        	width:200px;
            margin: auto;
            margin-top: 50px;
        	margin-bottom: 50px;
        }



      #search_area{
          font-weight: 700;
          width: 60%;
          margin:auto;
      }
      .suj{
        width:45px;
        height:32px;
        margin-right:5px;
      }
              #enrollPro {

            margin-left: 880px;
            

        }
                #inputFile {
            padding: 3px 10px;
            background-color:rgb(44, 185, 228);
            border-radius: 4px;
            color: white;
            cursor: pointer;
            }




    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../common/header_admin.jsp" %>
       <div class="content">
        <div class="content_title">
             <div style="color:rgba(36, 49, 121, 0.9)">
                 제품추가
                 <hr>
             </div>
        </div>
        <div class="content_category_title"></div>

         
         <div class="content_detail">
         
			<form id="enroll-form" action="<%=contextPath%>/proInsert.pr" method="post" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <th height="50px;" style="text-align: center;">제품명 </th>
                            <td colspan="3"><input type="text" name="title" style="width : 850px;" required> 
                        </tr>
                        <tr>
                            <th width="100" height="50px" style="text-align: center;">제품이미지</th>
                            <td colspan="3">
                                <input type="file" name="proImg" id="inputFile" required>
                            </td>
                        </tr>
                        <tr>
                            <th height="50px;" style="text-align: center;">가격</th>
                            <td><input type="number" name="price" min="10" max="999999"
                                    step="10" style="width : 150px;" required>
                            <th height="50px;" style="text-align: center;">효능</th>
                            <td colspan="3">
                                <select name="effect">
                                <option value="혈액개선">혈액개선</option>
                                <option value="시력개선">시력개선</option>
                                <option value="면역력증진">면역력증진</option>
                                <option value="에너지충전">에너지충전</option>
                                <option value="간기능개선">간기능개선</option>
                                <option value="배변활동">배변활동</option>
                                <option value="피부건강">피부건강</option>
                                </select>
                            </td> 
                        </tr>
                            <tr>
                            <th style="vertical-align:top; text-align: center;"><br>내용</th>
                                <td colspan="3">
                                    <textarea name="content" rows="20" style="width : 850px; resize:none;" required></textarea>
                                </td>

                            </tr>
                            <tr>
                                <th height="50px" width="80px;" style="text-align: center;">재고상태</th>
                                <td width="300"><input type="number" id="stock" name="stock"
                                    min="0" max="300" step="1" value="0" style="width : 100px;"></td>
                                <th height="50px" width="120px;"  style="text-align: center;">진열상태</th>
                                        <td>  <select name="display">
                                            <option value="Y">진열중</option>
                                            <option value="N">숨김</option>
                                            <!-- selected로 지정해주지 않을 경우 상단의 값이 자동 선택됨-->
                                        </select></td>                                        
                            </tr>    
                    </table> <br>
            
                        <!-- 상품 추가 버튼 -->
                        
                        <div id="contnent_3" align="right">
                            <button type="submit" class="btn btn-light btn-sm" style="opacity: 0.7; background-color: gray; color: white;">추가</button>
                            <button type="button" onclick="location.href='/na/proManageList.pr?currentPage=1'"  class="btn btn-dark btn-sm" >취소</button>
                        </div>
                </form>




                    


         </div>
    </div>
    
<%@ include file="../common/footer_admin.jsp" %>
</body>
</html>