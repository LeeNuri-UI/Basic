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
</body>
</html>
