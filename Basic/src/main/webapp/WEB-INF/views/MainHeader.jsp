<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	
</head>

<body>
	<div class="backg" style="background:url(${path}/resources/img/MainLine.PNG)no-repeat;background-attachment:fixed;background-size:100% 400px;">
		<div class="divH04" style="background-attachment:fixed;">
			<a href="${path}/Main"><b style="background-attachment:fixed;">DailyDiary</b></a>
		</div>
	</div>
	<div class="ullidiv">
		<ul class="ulli01" style="margin:0px 70px 0px 0px;">
			<c:if test ="${empty UserVO}">		
				<li class="ulli"><a href="${path}/Join"><b>JOIN</b></a></li>
				<li class="ulli"><a href="${path}/Login"><b>LOGIN</b></a></li>
				<li class="ulli"><a href="${path}/Main"><b>HOME</b></a></li>
			</c:if>
			<c:if test ="${UserVO.admin == 'Y'}">
				<li class="ulli"><a href="${path}/Main"><b>HOME</b></a></li>
				<li class="ulli"><a href="${path}/LoginoutAction"><b>LOGOUT</b></a></li>
				<li class="ulli"><b>${UserVO.uname}님 환영합니다.관리자입니다.</b></li>
			</c:if>
			<c:if test ="${UserVO.admin == 'N'}">
				<li class="ulli"><a href="${path}/Main"><b>HOME</b></a></li>
				<li class="ulli"><a href="${path}/LoginoutAction"><b>LOGOUT</b></a></li>
				<li class="ulli"><b>${UserVO.uname}님 환영합니다.</b></li>
			</c:if>
		</ul>
	</div>		
</body>
</html>
