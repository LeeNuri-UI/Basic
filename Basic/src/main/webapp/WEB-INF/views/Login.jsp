<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Login.css" rel="stylesheet" >
</head>

 <body>
	<div class="rap">
		<jsp:include page="MainHeader.jsp" flush="true"/>
		
		<div class="rap2">			
			<content> 
				<div class="Lo01">
					<h1 style="margin: 20px 0px 20px 0px; text-align:center;"> Login</h1>
					<textarea placeholder="ID" maxlength="20" class="Lo02"></textarea>
					<textarea placeholder="FW" maxlength="20" class="Lo02"></textarea>
					
					<a href="file:///C:/Users/apfhd/Desktop/%EA%B0%9C%EC%9D%B8%EC%9A%A9/html/Main%20.html"><button class="Lo03">Login</button></a>				
					<a href="file:///C:/Users/apfhd/Desktop/%EA%B0%9C%EC%9D%B8%EC%9A%A9/html/Join.html"><button class="Lo03">Join Us</button></a>
					
				</div>
			</content>	
		</div>
		
		<footer>
		</footer>
	</div>
</body>
</html>
