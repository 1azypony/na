<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    
    #login12{
        margin-top:100px;
        margin-bottom:200px;
    }
    #finder{
        font-size:small;
        color:dimgray;
    }
    #idF, #pwdF{
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
<script>
	function emailCheck(){
				
		// 아이디를 입력받을 수 있는 input 요소 객체
		var $userEmail = $("#email1");
		var $checkEmail = $("#checkEmail1");
		// $userId 요소객체의 value 속성값인 이메일값을 가지고 중복확인
		$.ajax({
			
			url : "emailCheck.me",
			data : {checkEmail : $userEmail.val()},
		//	type : 생략하면 get
			success : function(result){
				
				if(result=="NNNNY"){
					alert("가입되지 않은 이메일입니다.");
					$userEmail.val("");
					$userEmail.focus();
					
				}else{
					
					if(confirm("인증번호를 전송하겠습니다.")){
						

						$userEmail.attr("readonly", true);
						
						/////////////////////////////////// 중복체크 끝 인증번호 전송부분
						
						
						$.ajax({
								
								url : "emailSend.me",
								data : {userEmail : $userEmail.val()},
							//	type : 생략하면 get
								success : function(result){
									alert("인증번호가 전송되었습니다.")
									$checkEmail.focus();
									$("#hiddenCheck1").val(result);
									$("#777").removeAttr('disabled');
								},
								error : function(){
									console.log("이메일 보내기 ajax 통신 실패!");
								}
								
							});
						
			/////////////////////////////////////////////////////////
						
					}else{
						$userEmail.val("");
						$userEmail.focus();
					}
					
				}
			},
			error : function(){
				console.log("이메일 체크용 ajax 통신 실패!");
			}
			
		});
		
	}
	
	function resNumCheck(){
	     
	     var aaaaa = document.getElementById("checkEmail1");
		 var bbbbb = document.getElementById("email1");
		
       if(aaaaa.value != $("#hiddenCheck1").val()) {
           alert("인증번호가 다릅니다. 다시 확인해 주세요.");
           aaaaa.value = "";
           aaaaa.focus();
           return false;
       } else{
    	   alert("이메일로 아이디가 전송되었습니다.");
    	   location.href = "/na/idSend.me?email="+ bbbbb.value;
       }
		

		
	}
	
	function emailCheck2(){
		
		// 아이디를 입력받을 수 있는 input 요소 객체
		var $userId = $("#id2");
		var $userEmail = $("#email2");
		var $checkEmail = $("#checkEmail2");
		// $userId 요소객체의 value 속성값인 이메일값을 가지고 중복확인
		$.ajax({
			
			url : "emailCheck2.me",
			data : {checkEmail : $userEmail.val()
				  , checkId : $userId.val()
					},
		//	type : 생략하면 get
			success : function(result){
				
				if(result=="NNNNY"){
					alert("해당 정보의 계정이 없습니다.");
					$userEmail.val("");
					$userEmail.focus();
					
				}else{
					
					if(confirm("인증번호를 전송하겠습니다.")){
						
						$userId.attr("readonly", true);
						$userEmail.attr("readonly", true);
						
						/////////////////////////////////// 중복체크 끝 인증번호 전송부분
						
						
						$.ajax({
								
								url : "emailSend.me",
								data : {userEmail : $userEmail.val()},
							//	type : 생략하면 get
								success : function(result){
									alert("인증번호가 전송되었습니다.")
									$checkEmail.focus();
									$("#hiddenCheck2").val(result);
									$("#888").removeAttr('disabled');
								},
								error : function(){
									console.log("이메일 보내기 ajax 통신 실패!");
								}
								
							});
						
			/////////////////////////////////////////////////////////
						
					}else{
						$userEmail.val("");
						$userEmail.focus();
					}
					
				}
			},
			error : function(){
				console.log("이메일 체크용 ajax 통신 실패!");
			}
			
		});
		
	}
	
	function resNumCheck2(){
	     
	     var aaaaa = document.getElementById("checkEmail2");
		 var bbbbb = document.getElementById("email2");
		
       if(aaaaa.value != $("#hiddenCheck2").val()) {
           alert("인증번호가 다릅니다. 다시 확인해 주세요.");
           aaaaa.value = "";
           aaaaa.focus();
           return false;
       } else{
    	   alert("이메일로 비밀번호가 전송되었습니다.");
    	   location.href = "/na/pwdSend.me?email="+ bbbbb.value;
       }
		

		
	}
	
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
    <div class="wrap">
 

    <div id="login12" align="center">
        <h2 style="margin-bottom:60px; color:rgba(36, 49, 121, 0.9);">로그인</h2>
        <form action="<%=contextPath%>/login.me" method="post">

            <input type="text" name="id" style="text-align:left; width:350px; height:50px; padding-left: 10px;" placeholder="아이디를 입력해주세요"><br>
            <input type="password" name="pwd" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="비밀번호를 입력해주세요"><br>
            <span id="finder"><span id="idF" data-toggle="modal" data-target="#idFind">아이디찾기</span> | <span id="pwdF" data-toggle="modal" data-target="#pwdFind">비밀번호찾기</span></span><br>
            <button type="submit" class="btn btn-info" style="width:350px; height:50px; margin-top:40px;">로그인</button><br>
            <button type="button" onclick="location.href='<%=contextPath%>/enroll.me'" class="btn btn-info" style="width:350px; height:50px; margin-top:15px;">회원가입</button><br>
        </form>

            <!-- The Modal -->
  <div class="modal" id="idFind">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header" style="margin:50px;">
          <h4 class="modal-title" align="left">아이디 찾기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body" align="center" style="margin-bottom:50px;">
            
            <input type="hidden" id="hiddenCheck1">
                <table style="margin:30px;">
                    <tr>
                        <td style="font-size:20px;">이메일 &nbsp;&nbsp;</td>
                        <td><input type="text" name="email1" id="email1" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="가입시 기입한 이메일을 입력해주세요" required>&nbsp;&nbsp;</td>
                        <td align="center"><button onclick="return emailCheck();" class="btn btn-info" type="submit"style="width:120px; height:50px;">인증번호 발송</button></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" id="checkEmail1" name="emailC" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="이메일로 전송받은 인증번호를 입력해주세요" required>&nbsp;&nbsp;</td>
                        <td align="center"><button id="777" onclick="return resNumCheck();" class="btn btn-info" type="submit" style="width:120px; height:50px;" disabled>아이디 찾기</button></td>
                    </tr>
                </table>
            
                <br>

        </div>
      </div>
    </div>
  </div>

              <!-- The Modal -->
  <div class="modal" id="pwdFind">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header" style="margin:30px;">
          <h4 class="modal-title" align="left">비밀번호 찾기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body" align="center" style="margin-bottom:50px;">
		        <input type="hidden" id="hiddenCheck2">
                <table style="margin:30px;">
                    <tr>
                        <td style="font-size:20px;">아이디 &nbsp;&nbsp;</td>
                        <td><input type="text" id="id2" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="아이디를 입력해주세요" required>&nbsp;&nbsp;</td>
                        <td align="center"></td>
                    </tr>
                    <tr>
                        <td style="font-size:20px;">이메일 &nbsp;&nbsp;</td>
                        <td><input type="text" id="email2" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="가입시 기입한 이메일을 입력해주세요" required>&nbsp;&nbsp;</td>
                        <td align="center"><button onclick="return emailCheck2();" class="btn btn-info" type="submit" style="width:120px; height:50px;">인증번호 발송</button></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="text" id="checkEmail2" style="text-align:left; width:350px; height:50px; padding-left: 10px; margin: 15px;" placeholder="이메일로 전송받은 인증번호를 입력해주세요" required>&nbsp;&nbsp;</td>
                        <td align="center"><button id="888" onclick="return resNumCheck2();" class="btn btn-info" type="submit" style="width:120px; height:50px;" disabled>비밀번호 찾기</button></td>
                    </tr>

                </table>
                <br>

        </div>
      </div>
    </div>
  </div>

    </div>

    

    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>