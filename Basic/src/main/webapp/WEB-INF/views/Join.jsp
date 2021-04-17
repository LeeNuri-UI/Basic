<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Join.css" rel="stylesheet" >
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- 중복체크 -->
	<script type="text/javascript">
	$(document).ready(function(){ 
		$("#idChk").click(function(){ 
			var uid = $("#uid").val();
			if (uid ==""){
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({ 
				url : "/Board/idChk",
	            type : "post",
	            dataType : "json",
	            data : {"uid" : $("#uid").val()},
				success: function(data) {			
								
					if(data == 1) {
						alert("중복된 아이디가 존재합니다.");
						$("#idck").val("");
					}else{
						alert("사용가능한 아이디입니다.");
						$("#idck").val("1");				
					}			
				},
			}); 
	    });
	});
	
	$(document).ready(function(){ 
		$("#unameChk").click(function(){ 
			var uname = $("#uname").val();
			if (uname ==""){
				alert("닉네임을 입력하세요");
				return;
			}
			
			$.ajax({ 
				url : "/Board/unameChk",
	            type : "post",
	            dataType : "json",
	            data : {"uname" : $("#uname").val()},
				success: function(data) {			
								
					if(data == 1) {
						alert("중복된 닉네임이 존재합니다.");
						$("#unameck").val("");
					}else{
						alert("사용가능한 닉네임입니다.");
						$("#unameck").val("1");				
					}			
				},
			}); 
	    });
	});
	</script>
	
	<!-- 빈칸확인 및 보내기 -->
	<script type="text/javascript">
	function Joint(){
    	if(document.Join.uid.value == ""){
    		alert("아이디를 입력하세요");
    		document.Join.uid.focus();
    		return;
    	}else if(document.Join.upass.value == ""){
    		alert("비밀번호를 입력하세요");
    		document.Join.upass.focus();
    		return;
    	}else if(document.Join.uname.value == ""){
    		alert("닉네임을 입력하세요");
    		document.Join.uname.focus();
    		return;
    	}else if(document.Join.umail01.value == ""){
    		alert("이메일을 입력하세요");
    		document.Join.umail01.focus();
    		return;
    	}else if(document.Join.umail02.value == ""){
    		alert("이메일을 입력하세요22");
    		document.Join.umail02.focus();
    		return;
    	}
    	if(confirm("회원가입을 하시겠습니까?")){
    		
	        if(document.Join.idck.value ==0){
	            alert('아이디 중복체크를 해주세요');
	            return false;
            }else if(document.Join.unameck.value ==0){
            	alert('닉네임 중복체크를 해주세요');
	            return false;  
	        }else{
	        	document.Join.action ="/Board/JoinAction";
	    		document.Join.method = "post";		
	    		document.Join.submit();	
	        }
	    }	
	return;
	}
  </script>
</head>

<body>
	<div class="rap">
	<jsp:include page="MainHeader.jsp" flush="true"/>
		
	<div class="rap2">			
		<content> 
			<div class="Jo01">
				<form name="Join" >
				<input type="hidden" name="idck" id="idck" value="0">
				<input type="hidden" name="unameck" id="unameck" value="0">
					<table>
					<tr>
						<td><h1 style="margin:0px 0px 40px 130px;">JOIN</h1><td>
					</tr>	
					<tr>
						<th>아 이 디</th>
					</tr>   
					<tr>
						<td>
						<input type="text" name="uid" id="uid" class="Jo02">
						<button class="JoBu01" type="button" id="idChk" name="idChk">중복확인</button>
						</td>
					</tr>   
					 
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>   
						<td><input type="text" name="upass" id="upass" class="Jo02"></td>
					</tr>
					 
					<tr>
						<th>닉 네 임</th>
					</tr>   
					<tr>
						<td>
						<input type="text" name="uname" id="uname" class="Jo02">
						<button class="JoBu01" type="button" id="unameChk" name="unameChk">중복확인</button>
						</td>
					</tr>
						 
					<tr>
					<th>이메일</th>
					</tr>   
						<tr>
							<td>
								<input type="text" name="umail01" id="umail01" class="Jo03"> @
								<select name="umail02" id="umail02" class="Jo04">
									<option selected>naver.com</option>
									<option value=daum.net>daum.net</option>
									<option value=google.com>google.com</option>
								</select>
							</td>
						</tr>
					
						<tr>
							<th><button class="JoBu02" onclick="Joint()">가 입 완 료</button></th>
						</tr> 
					</table>
				</form>					
			</div>				
		</content>	
	</div>				
		<footer>
		</footer>
	</div>
</body>
</html>