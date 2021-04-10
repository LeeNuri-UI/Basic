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
	<div class="rap">
		<jsp:include page="MainHeader.jsp" flush="true"/>
		
		<div class="rap2">
			<jsp:include page="Nav.jsp" flush="true"/>
			
			<content> 
				<div class="main" style="text-align:left; margin-left:220px;">
					<!--float position 등은 위치가 겹치거나 따로놀 수 있음 그래서 margin-left로 강제 위치고정-->	
				 
					<input id="tab1" type="radio" name="tabs" checked> 
					<label for="tab1">tab1</label>
				 
					<input id="tab2" type="radio" name="tabs">
					<label for="tab2">tab2</label>
				 
				 
					<section id="content1" style="margin-bottom:20px;">
						탭하면 넣어보고 싶어서 만들었어요
					</section>
				 
					<section id="content2" style="margin-bottom:20px;">
						탭하면 넣어보고 싶어서 만들었어요22
					</section>
				</div>	
			</content>	
		</div>
		
		<footer>
		</footer>
	</div>
</body>
</html>
