<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/List.css" rel="stylesheet" >
	
	<script type="text/javascript">
	 function No(){    	
	    	alert("로그인시 이용가능합니다.");
	    	return
		}
	</script>
</head>

 <body>
   <div class="rap">
      <jsp:include page="MainHeader.jsp" flush="true"/>	
      
      <div class="rap2">   
         <jsp:include page="Nav.jsp" flush="true"/>
         
         <content> 
			<div>
				<input type="text" placeholder="검색어 입력" class="serch"><button class="LiBu01">검색</button>
				
				<table>
					<tr>
						<th width="10%">No.</th>
						<th width="10%">분류</th>
						<th width="47%">제목</th>
						<th width="10%">작성자</th>
						<th width="13%">작성일</th>
						<th width="10%">조회수</th>
					</tr>	
					<c:forEach items="${BoardList}" var="BoardVO">
					<tr>
						<td width="10%">${BoardVO.bnum}</td>
						<td width="10%">${BoardVO.cate02}</td>
						<td width="47%"><a href="${path}/View?bnum=${BoardVO.bnum}">${BoardVO.sub}</a></td>
						<td width="10%">${BoardVO.uname}</td>
						<td width="13%"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoardVO.writedate}"/></td>
						<td width="10%">${BoardVO.viewcount}</td>
					</tr>
					</c:forEach>
				</table>
				
				<c:if test ="${empty UserVO}">
					<button class="Write01" onclick="No()">글쓰기</button>
				</c:if>
				<c:if test ="${!empty UserVO}">
					<a href="${path}/Write"><button class="Write01">글쓰기</button></a>
				</c:if>
				<p style="float:right; margin:12px 310px 0px 0px;"> | 1 | 2 | 3 | 4 | 5 | </p>

			</div>
         </content>   
      </div>
      <footer>
      </footer>
   </div>
   
</body>
</html>
