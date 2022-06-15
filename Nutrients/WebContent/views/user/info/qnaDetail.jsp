<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.na.user.info.model.vo.*" %>
<%
	Qna q = (Qna)request.getAttribute("q");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
            height: 1600px;
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
       /* content영역 */
       .content2{
           /* border : 1px solid red; */
           width: 1000px;
           height : 500px;
           margin : auto;
       }
       .content_title{
           width:85%;
           height:21%;
           font-size: 45px;
           font-weight: 700;
           padding-top:10px;
           padding-left:50px;
           /* border:1px solid red; */
       }

        .content_detail{
            width:800px;
            height:2000px;
            /* border:1px solid red; */

        }
        .cd_table_title{
            font-size: 25px;
            font-weight: 700;
            text-align: left;
        }
        .cd_table_title>td>input{
            width:700px;
            height:45px;
            font-size: 20px;
            border:1px solid gray;
        }
        .cd_table_content1>td>textarea{
     
            font-size: 15px;
        
        }
        .cd_table_content2>td>textarea{
   
            font-size: 15px;
        
        }
        .cd_table_content_title{
            font-size: 20px;
            font-weight: 700;
            height:40px;
        }
        .cd_button{
            width:100px;
            height:40px;
            border-radius: 5px;
            background-color:rgba(24,189,234, 0.5);
            border:none;
            color:white;
            font-size: 18px;
            font-weight: 700;
            margin-top: 30px;
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
               <script>
          		$(function(){
           			$("#inquery").css({backgroundColor:"white",color:"black", border:"1px solid rgb(192, 192, 192)"});
           			$("#inquery").click(function(){
           				location.href="<%=contextPath%>/qnalist.in?currentPage=1";
           			});
           		});
               </script>
               
               <div id="side_menubar_3"></div>
           </div>
           <div id="content_header">
                <div id="content_body1">
                    <h2>1:1문의 - 상세보기</h2>
                    <hr>
                </div>
                <div id="content_body2">
         <div class="content2" style="margin-left:30px;">
           	 <div class="content_detail" align="center">
                <table class="cd_table"  align="center">
                    <tr class="cd_table_title">
                        <td width="70px;">제목 : </td>
                        <td width="700px" height="150px"><input type="text" disabled value="<%=q.getInqTitle()%>"></td>
                    </tr>
                    <tr class="cd_table_content1">
                        <td colspan="2">
                            <div class="cd_table_content_title">문의내용</div>
                            <textarea name="" cols="110" rows="10" style="resize:none" disabled><%=q.getInqQuery() %></textarea>
                        </td>
                    </tr>
                    <tr class="cd_table_content1">
                        <td colspan="2">
                        	<hr>
                            <div class="cd_table_content_title">답변내용</div>
                            <textarea name="" cols="110" rows="10" style="resize:none" disabled><%=q.getInqAnswer() %></textarea>
                        </td>
                    </tr>
                </table>
                <%if(q.getStatus().equals("N")){ %>
	                <button type="button" class="cd_button btn btn-dark btn-sm" style="width:60px; height:30px; text-align: center;"
	                onclick="location.href='<%=contextPath%>/qnaupdateform.in?ino=<%=q.getInqNo()%>';">수정</button>
                <%} %>
                <button type="button" class="cd_button btn btn-dark btn-sm" style="width:60px; height:30px; text-align: center;"
                id="qnadelete">삭제</button>
                <button type="button" class="cd_button btn btn-dark btn-sm" style="width:60px; height:30px; text-align: center;"
                onclick="javascript:history.back();">뒤로</button>
            </div>
            <script>
            	$("#qnadelete").click(function(){
            			
            			if (window.confirm("정말 삭제하시겠습니까??")) {
            				
            				location.href="<%=contextPath%>/qnadelete.in?ino=<%=q.getInqNo()%>";
            			}
            		});
            </script>
       </div>    
	
                </div>
           </div>
       </div>
  
			   <div id="footer-div" style="margin-top:1000px;">
					<%@ include file="../common/footer.jsp" %>
			   </div>    
</body>
</html>