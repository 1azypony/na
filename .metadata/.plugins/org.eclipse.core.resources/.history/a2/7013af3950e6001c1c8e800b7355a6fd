<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" com.na.user.magazine.model.vo.*" %>    
<%
	// 매거진 상세조회 
	Magazine m = (Magazine)request.getAttribute("m");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <title>NUTRIENTS ALMIGHTY</title>
    <style>

       /* content영역 */
       .content{
          /* border: 1px solid black;*/
           width: 100%;
           height:100%;
           margin:auto;
       }
       .content_title{
        color: rgba(36, 49, 121, 0.9);
            font-size: 40px;
            float:center;
            width:55%;
            height: 120px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            font-weight: 700;
            padding-left: 30px;
            padding-top: 15px;
       }

        #content_1 {
          /*  border : 1px solid red; */
            width: 850px;
            height: 100%; 
            margin:auto;
        }

    
        #magazine_title{
            height: 60px;
            margin:auto;
        }

        #magazine_title>input{
            width: 100%;
            height: 35px;
            margin:auto;
        }

        #magazine_content{
            height:100%;
            margin:auto;
        }
        
        #magazine_content>textarea{
            margin-top: 20px;
            margin-left: 30px;
            width: 100%;
            height: 600px;
            margin:auto;
            resize: none;
        }

        #mag_photo {
            width: 100%;
            height: 40px;
            margin: auto;
        }
        

        #inputFile {
            padding: 3px 10px;
            background-color:rgb(44, 185, 228);
            border-radius: 4px;
            color: white;
            cursor: pointer;
            }

        #enrollMag {
           /* border: 1px solid blue; */
            float:right;
            width: 80px;
        }

    </style>
</head>
<body>
	<%@ include file="../common/header_admin.jsp" %>
       <!-- 컨텐츠 영역 -->
       <div class="content">
           <div class="content_title">
                <div> 매거진 수정<hr></div>    
           </div>

                <div id="content_1">
                 <!-- 파일을 서블릿으로 전달하려면 반드시 enctype="multipart/form-data" 속성을 작성해주어야 함-->
                    <form id="update-form" action="/na/update.mg" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="mno" value="<%=m.getMagNo()%>">
				
                        <div id="magazine_title">
                            <input type="text" name="title" value="<%=m.getMagTitle() %>" required>
                        </div>

                        <div id="magazine_content">
                            <textarea name="content" required><%=m.getMagDes() %></textarea>
                        </div>

                        <div id="mag_photo">
                            <input type="file" name="file" id="inputFile"> *수정이 필요한 경우에만 업로드하세요
            
                        </div>
                        
                         <!-- 매거진 등록 버튼 -->
                        <div id="enrollMag" align="right">
                            <button type="submit" class="btn btn-light " style="opacity: 0.7; background-color: gray; color: white;">등록</button>
                        </div>
                    </form>
                </div>   <br><br>
                </div>
            
     
    <%@ include file="../common/footer_admin.jsp" %>

</body>
</html>