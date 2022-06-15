<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.na.user.review.model.vo.Review, com.na.template.model.vo.PageInfo" %>       
<%
ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
ArrayList<Review> list2 = (ArrayList<Review>)request.getAttribute("list2");
PageInfo pi = (PageInfo)request.getAttribute("pi");

// 페이징바 관련 변수
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
    <title>고객후기전체조회</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet"> 
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
      div{
          box-sizing: border-box;
         /*border: 1px solid red; /*가이드라인*/
        
      }
      .wrap{
          width: 1000px;
          height: 1600px;
          margin: auto; /*가운데정렬*/
      }
 

       
      body{
        font-family: "Sofia", sans-serif;
       }


       #content1_title {height: 150px;}
       #content2_title {height: 100px;}
       #content3_title{height: 30px}

       #content1{ height: 400px;}
       #content3{ height: 610px;}
      
       /* 각각의 상세 영역 */
      
       #content1 >div  {
           height: 100%;
           float: left;
       }

        #content3>div{
           height: 100%;
           float: left;
       } 
       
       #content1_1{ width: 5%;}
       #content1_2{ width: 90%;}
       #content1_5{ width: 5%;} 

       #content3_1{ width: 10%;}
       #content3_2{ width: 80%;}
       #content3_3{ width: 10%;}

       #content1_2_pic{height: 100%;}


       #content1_3_pic{height: 100%;}


       #content1_4_pic{height: 100%;}

    /*리스트 */
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


/*고객 전체 리뷰 보더 라인*/
.list-area{

 box-sizing: border-box;
    border: 4px solid rgba(24,189,234, 0.5); 
}
/*best3 사진 */
#content1 img:hover{
cursor: pointer;
opacity: 0.7;
}

#page {margin-left: 300px; }

#content1 img{
    box-shadow: 2px 2px 10px 5px lightgray;
    border-radius: 5px;
}

/*영역 사이에 줄 긋기*/
#content1{
    border-bottom: 2px solid rgba(73, 71, 71, 0.5);
}


    </style>
</head>
<body>
<!--헤더-->
 <%@ include file="../common/header.jsp" %>
    <div class="wrap">

       
    <div id="content1_title" align="center">
        <p style="margin-top: 30px; font-size: 50px; color:rgba(36, 49, 121, 0.9);">
            Best Review Top3
        </p>
    </div>
    <div id="content1" style="margin-right:100">
      
       
     
        <%if(list.isEmpty()) { %>
          등록된 게시글이 없습니다.
       <% } else { %>
          <% for(Review r : list2)  {%>
                 <div class="thumbnail" align="center" style="margin-left:50px;">
              <input type="hidden" value="<%= r.getRevNo() %>">
            
             <img  src="<%= r.getRevPath() %>" style=" display: block; "width="250" height="250" margin-right="100">
              
              <p style="margin-top: 20px;">
              [  <%= r.getRevTitle() %>  ] <br>
                          조회수 :  <%= r.getCount() %>
              </p>
       		</div>
       		 <% } %> 
       <% } %>  
       
       
    </div>
    <script>
    $(function(){
    	
    	$(".thumbnail").click(function(){
    		
    		var rno = $(this).children().eq(0).val();
    		
    		location.href="<%= contextPath %>/reviewDetail.re?rno="+ rno;
    	});
    	
    });
  
  </script>
  
    <div id="content2_title"  align="center">
        <p style="margin-top: 30px; font-size: 50px; color:rgba(36, 49, 121, 0.9);">
        고객 전체 리뷰
        </p>
    </div> 
    <div id="content3_title" align="center">
        <div align="right" style="margin-right:100px;" > <!--최신순, 조회순 하려면 페이지 두개 만듬  -->
            <a href="<%= contextPath %>/reviewlist.re?currentPage=1" style="color:black">최신순  | </a>
            <a href="<%= contextPath %>/reviewlist2.re?currentPage=1" style="color:black">조회순   </a>
            
            <br>
        </div>  
    </div>    
    <div id="content3" >
      <div id="content3_1"></div>
      <div id="content3_2">
        <table align="center" class="table table-hover">
            <thead align="center">
              <tr>
                <th width="80" >글번호</th>
                <th width="300">제목</th>
                <th width="90">작성자</th>
                <th width="110">작성일</th>
                <th width="110">조회순</th>
              </tr>
            </thead>
            <tbody align="center">
            <% if(list.isEmpty()) { %>
              <tr>
                <td colspan="6">조회된 리스트가 없습니다.</td>
              </tr>
             <% } else { %>
              <% for(Review r : list) {  %>
                 <tr>
                     <td><%= r.getRevNo() %></td>
                     <td><%= r.getRevTitle() %></td>
                     <td><%= r.getUserId() %></td>
                     <td><%= r.getRevDate() %></td>
                     <td><%= r.getCount() %></td>                  
                 </tr>
                <%}} %> 

            </tbody>
         </table>
         
           <script>
         $(function(){
             $(".table>tbody>tr").click(function(){
                  location.href = "<%= contextPath %>/reviewDetail.re?rno="+ $(this).children().eq(0).text();  
             });
         });   
      </script>    
         

      </div>
      <div id="content3_3"> </div>
    </div>
    <br>
             <!-- 최신순페이지 -->
             <div id="page">
            <div id="pro_paging" class="page_nation" style="width:100%; margin:left; ">
                <ul class="pagination">
            <%if(currentPage==1){ %>
            <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewlist.re?currentPage=<%=currentPage - 1%>" style="color: black"><</a></li>
            <%} %>
			<%for(int p = startPage; p<=endPage; p++){ %>
				<%if(p!=currentPage){ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewlist.re?currentPage=<%=p%>" style="color: black"><%=p %></a></li>
			<%} else {%>
                    <li class="page-item"><a class="page-link" href="" style="color: black"><%=p %></a></li>
				<%}}%>
            <%if(currentPage==maxPage || maxPage==0){ %>
            <%}else{ %>				              			              
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/reviewlist.re?currentPage=<%=currentPage + 1%>" style="color: black">></a></li>
            <%} %>
            
                        
           
                    </ul>
            </div>
           
           </div>
       
    </div>
    <!--푸터-->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>