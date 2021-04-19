<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Login.css" rel="stylesheet" >
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<script type="text/javascript">
	 function LoginBT(){    	
	    	if(document.Login.uid.value == ""){
	    		alert("아이디를 입력하세요");
	    		document.Login.uid.focus();
	    		return;
	    	}else if(document.Login.upass.value == ""){
	    		alert("비밀번호를 입력하세요");
	    		document.Login.upass.focus();
	    		return;
	    	}else{
	    		document.Login.action ="<%=request.getContextPath()%>/LoginAction";
	    		document.Login.method = "post";		
	    		document.Login.submit();	
	    	}
	    	return
		}
  	</script>
</head>

 <body>
	<div class="rap">
		<jsp:include page="MainHeader.jsp" flush="true"/>
		
		<div class="rap2">			
			<content> 
				<div class="Lo01">
					<form name="Login" >
						<h1 style="margin: 20px 0px 20px 0px; text-align:center;"> Login</h1>
						<input type="text" placeholder="ID" maxlength="20" class="Lo02" name="uid" id="uid">
						<input type="password" placeholder="FW" maxlength="20" class="Lo02" name="upass" id="upass">
						
						<button class="Lo03" onclick="LoginBT()">Login</button>				
						<a href="${path}/Join"><button class="Lo03">Join Us</button></a>
					</form>				
				</div>
			</content>	
		</div>
		
		<footer>
			<jsp:include page="Footer.jsp" flush="false"/>
		</footer>
	</div>
</body>
</html>
