<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/Tab.css" rel="stylesheet" >
</head>

 <body>
	<nav>	
		<div class="divN02">
			<img src="${path}/resources/img/MainLine.PNG" class="divN01" alt="Mainheader">
			<div class="divN03">
				 그냥 블로그처럼 <br> 만들고 싶었어요 <br> 기본 게시판이니까 <br>
				<button class="divNB01">마이페이지</button> <!--로그인시 마이페이지 로그인안되있음 회원가입-->
				<div class="divN04">
					<ul><b>BasicBoard</b>
						<li><a href="${path}/board/List">TestBoard</a></li>
					</ul>		
				</div>		
			</div>		
		</div>
	</nav>
</body>
</html>
