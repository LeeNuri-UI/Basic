<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/Tab.css" rel="stylesheet" >

</head>

 <body>
	<header>
		<div style="position: relative;">
			<a href="${path}/Main"><img src="${path}/resources/img/MainLine.PNG" class="divH01" alt="Mainheader"></a>	
				<c:if test ="${empty UserVO}">
					<a href="${path}/Login"><button class="divH02">로그인&nbsp;&nbsp;&nbsp;&nbsp;/</button></a>
					<a href="${path}/Join"><button class="divH03">회원가입</button></a>
				</c:if>
				
				<c:if test ="${!empty UserVO}">
					<p class="wellcom">${UserVO.uname}님 환영합니다.</p>
					<a href="${path}/LoginoutAction"><button class="divH03">로그아웃</button></a>
				</c:if>
			
			<div class="divH04">
				<a href="${path}/Main"><h2><b>BasicBoard</b></h2></a>
			</div>	
		</div>	
	</header>	
</body>
</html>
