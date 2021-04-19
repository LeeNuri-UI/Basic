<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/View.css" rel="stylesheet" >
	
	<script type="text/javascript">
	 function cmt(){ 
		 if(${UserVO.uname == null}){
			alert("로그인시 이용가능합니다.");
	    	return;
		 }else if(document.Comments.cocontent.value == ""){
    		alert("내용을 입력하세요");
    		document.Comments.cocontent.focus();
    		return;
    	}else{
    		alert("작성하시겠습니까?");
    		document.Comments.action ="<%=request.getContextPath()%>/CommentsAction";
    		document.Comments.method = "post";			
    	}
	}
	</script>
</head>

<body>
	<div class="rap">
	<jsp:include page="MainHeader.jsp" flush="true"/>
		
	<div class="rap2">	
			
		<content>  
			<table class="Vitable01">
				<tr>
					<td width="100px;">${BoardVO.cate01}</td>
					<td>${BoardVO.cate02}</td>
					<td colspan="4">
						<a href="${path}/Before?bnum=${BoardVO.bnum}"><b>&nbsp;PRE</b></a>
						<a href="${path}/List"><b>&nbsp;LIST</b></a>
						<a href="${path}/After?bnum=${BoardVO.bnum}"><b>&nbsp;NEXT&nbsp;</b></a></td>
				</tr>
				<tr>
					<td colspan="6"><h2>${BoardVO.sub}</h2></td>
				</tr>
				<tr>
					<td>작  성  자</td>
					<td>${BoardVO.uname}</td>
					<td colspan="3"></td>
					<td width="120px;" rowspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoardVO.writedate}"/></td>
					<td colspan="2"></td>
					<td colspan="2">${BoardVO.viewcount}&nbsp;읽음</td>
				</tr>
			</table>	
			<div>
				<div class="Vi02">
				${BoardVO.content}
				</div>
				
				<div>
				<c:if test="${UserVO.unum eq BoardVO.unum }">
					<a href="${path}/BoardModi?bnum=${BoardVO.bnum}"><button class="ViBu02">MODIFY</button></a>
					<a href="${path}/delete?bnum=${BoardVO.bnum}"><button class="ViBu02">DELETE</button></a>
				</c:if>
				</div>				
			</div>
					
			<div class="Vi03"><b>COMMENTS</b></div>
			
			<!-- 댓글 작성구간 -->
			<form name="Comments">
				<div style="width:100%;height:47px;border:1px solid #BDBDBD; border-radius: 7px;">
					<input type="hidden" name="bnum" id="bnum" value="${BoardVO.bnum}">
					<input type="hidden" name="uname" id="uname" value="${UserVO.uname}">
					
					<textarea name="cocontent" id="cocontent" class="ViRe01" placeholder="댓글을 남겨보세요"></textarea>		
					<button class="ViBu02" onclick="cmt()">등록</button>						
				</div>
			</form>
			
			<!-- 댓글 View 구간 -->
			<div style="margin:20px 0px 120px 0px;">
			<!-- 반복 -->
				<c:forEach items="${BoCommentVO}" var="BoCommentVO">
				<div style="margin-top:30px;">
					<span style="margin:0px 10px 0px 10px;">${BoCommentVO.uname}</span>
					<span style="margin:0px 10px 0px 20px;"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoCommentVO.codate}"/></span>
				</div>
				<c:if test="${UserVO.uname == BoCommentVO.uname}">
                  <span style="float:right; margin:-22px 80px 0px 0px;"><a href="${path}/CommentAction?bnum=${BoardVO.bnum}"><b>MODIFY</b></a></span>
                  <span style="float:right; margin:-22px 10px 0px 0px;"><a href="${path}/CommentAction?bnum=${BoardVO.bnum}"><b>DELETE</b></a></span>
               </c:if>
				<div style="margin:10px 0px 10px 0px; padding:0px 0px 10px 10px; border-bottom:1px solid #F2F2F2;">
					${BoCommentVO.cocontent}
				</div>	
				</c:forEach>
			<!-- 반복 -->	
			</div>
			<!-- 댓글 구간 -->			
         </content>	
	</div>				
	<footer>
		<jsp:include page="Footer.jsp" flush="false"/>
	</footer>
	</div>
</body>
</html>