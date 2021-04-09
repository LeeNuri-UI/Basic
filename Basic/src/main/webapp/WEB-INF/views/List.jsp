<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/List.css" rel="stylesheet" >
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
					
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>	
						<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>	
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>
					<tr>
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
						<td>f</td>	
					</tr>	
				</table>
				
				<a href="http://www.naver.com"><button class="Write01">글쓰기</button></a>
				<p style="float:right; margin:12px 310px 0px 0px;"> | 1 | 2 | 3 | 4 | 5 | </p>

			</div>
         </content>   
      </div>
      <footer>
      </footer>
   </div>
   
</body>
</html>
