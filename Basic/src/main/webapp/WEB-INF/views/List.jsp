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
      <header>
		<div style="position: relative;">
			<a href="${path}/Main"><img src="${path}/resources/img/MainLine.PNG" class="divH01" alt="Mainheader"></a>	
				<c:if test ="${empty UserVO}">
					<a href="${path}/Login"><button class="divH02">로그인&nbsp;&nbsp;&nbsp;&nbsp;/</button></a>
				</c:if>
				
				<c:if test ="${!empty UserVO}">
					<p class="wellcom">${UserVO.uname}님 환영합니다.</p>
					<a href="${path}/LoginoutAction"><button class="divH02">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;/</button></a>
				</c:if>
			<a href="${path}/Join"><button class="divH03">회원가입</button></a>
			
			<div class="divH04">
				<a href="${path}/Main"><h2><b>BasicBoard</b></h2></a>
			</div>	
		</div>	
	</header>	
      
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
