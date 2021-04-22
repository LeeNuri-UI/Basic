<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/List.css" rel="stylesheet" >
	
</head>

 <body>
	<div class="rap">
		<jsp:include page="Background.jsp" flush="true"/>
		<jsp:include page="MainHeader.jsp" flush="true"/>
		
		<div class="rap2">
			<div class="Introdiv01"><b style="margin-left:20px;">소개글</b></div>
			<div class="Introdiv02" style="overflow:hidden;color:#848484;">작성은 관리자만 가능합니다. 관리자:admin 0000 일반회원:aaa aaa</div>
			<div class="Introdiv03"></div>
			
			<content> 
				<c:forEach items="${BoardList}" var="BoardVO">
				<table border="0;" style="width:800px; border-bottom:1px solid #BDBDBD; margin:0px 0px 0px 0px;">
					<tr>
						<td colspan="3"style="color:#848484;">
							&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoardVO.writedate}"/>
							&nbsp;&nbsp;&nbsp;CATEGORY : <b>${BoardVO.cate02}</b>
						</td>
						<td class="td01">
							${BoardVO.viewcount}&nbsp;읽음
						</td>
						
						<c:if test ="${!empty BoardVO.file}">
						<td rowspan="4" style="width:133px;">
							<span>
								<img src="${path}/images/${BoardVO.file}" style="width:127px; height:127px;"/>
							</span>
						</td>
						</c:if>
					</tr>
					
					<tr>
						<td colspan="4">
							<a href="${path}/View?bnum=${BoardVO.bnum}">&nbsp;&nbsp;<b style="font-size: 1.7em;">${BoardVO.sub}</b></a>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" style="color:#848484;">
							<div style="height:24px; overflow:hidden;">
								&nbsp;&nbsp;${BoardVO.content}
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="4" style="color:#848484;">
							<div class="divCmt">
								&nbsp;&nbsp;COMMENTS : ${BoardVO.bcocount}&nbsp;
							</div>
						</td>
					</tr>
				</table>
				</c:forEach>			
				
					<!--  기존 리스트 방식
					<div class="Mdiv01">
						<span style="margin:0px 10px 0px 10px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoardVO.writedate}"/></span>
						<span style="margin:0px 10px 0px 10px;">카테고리</span>
						<span style="margin:0px 10px 0px 10px;">${BoardVO.cate02}</span>
						<span style="margin:0px 10px 0px 10px; float:right;">${BoardVO.viewcount}&nbsp;읽음</span>
					</div>
					
					<div class="Mdiv02" style="padding:10px 0px 0px 20px;">
						<b style="font-size: 1.7em;"><a href="${path}/View?bnum=${BoardVO.bnum}">${BoardVO.sub}</a></b>
					</div>	
					
					<div class="Mdiv03" style="overflow:hidden;">
						${BoardVO.content}
					</div>
					
					<div class="Mdiv04">
						댓글 &nbsp;
					</div>	-->
			</content>	
			
			<!-- 페이징 -->
			<div>
				<ul class="ulclass">
					<c:if test="${pageMaker.prev}">
						<li class="liclass"><a href="List${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if> 
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="liclass"><a href="List${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="liclass"><a href="List${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if> 
				</ul>
			</div>
		</div>
			
		<footer>
			<jsp:include page="Footer.jsp" flush="true"/>		
		</footer>
	</div>
</body>
</html>
