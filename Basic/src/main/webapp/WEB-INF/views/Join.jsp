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
	    		alert("이메일을 입력하세요");
	    		document.Join.umail02.focus();
	    		return;
	    	}else{
	    		alert("가입하시겠습니까?");
	    		document.Join.action ="<%=request.getContextPath()%>/JoinAction";
	    		document.Join.method = "post";		
	    		document.Join.submit();	
	    	}
	    	return
		}
  </script>
</head>

<body>
	<div class="rap">
	<header>
		<div style="position: relative;">
			<a href="${path}/Main"><img src="${path}/resources/img/MainLine.PNG" class="divH01" alt="Mainheader"></a>	
			<a href="${path}/Login"><button class="divH02">로그인&nbsp;&nbsp;&nbsp;&nbsp;/</button></a>
			<a href="${path}/Join"><button class="divH03">회원가입</button></a>
			<div class="divH04">
				<h2><b>BasicBoard</b></h2>
			</div>	
		</div>	
	</header>
		
	<div class="rap2">			
		<content> 
			<div class="Jo01">
				<form name="Join" >
					<table>
					<tr>
						<td><h1 style="margin:0px 0px 40px 130px;">JOIN</h1><td>
					</tr>	
					<tr>
						<th>아 이 디</th>
					</tr>   
					<tr>
						<td><input type="text" name="uid" id="uid" class="Jo02"><button class="JoBu01">중복확인</button></td>
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
						<td><input type="text" name="uname" id="uname" class="Jo02"><button class="JoBu01">중복확인</button></td>
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