<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/List.css" rel="stylesheet" >
	
	<script type="text/javascript">
	 function No(){    	
	    	alert("관리자 권한입니다.");
	    	return
		}
	</script>
</head>

 <body>
	<ul class="ulli02" style="margin:0px 70px 0px 0px;">
		<c:if test ="${UserVO.admin == 'Y'}">
		<li class="ulli"><a href="${path}/Write" ><b>WRITE</b></a></li>
		</c:if>
		
		<c:if test ="${empty UserVO or UserVO.admin == 'N'}">
		<li class="ulli"><button onclick="No()" class="Write01">WRITE</button></li>
		</c:if>
		
		<li class="ulli"><input type="text" placeholder="검색어 입력" class="serch"><button class="LiBu01">검색</button></li>
	</ul>
</body>
</html>
