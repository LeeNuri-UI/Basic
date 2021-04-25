<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/List.css" rel="stylesheet" >
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	
	
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
		
		<li class="ulli">
		<div class="search">
    		<select name="searchType" style="width:90px; height:26px; border:none;">
				<option value="sub"<c:out value="${scri.searchType eq 'sub' ? 'selected' : ''}"/>>제&nbsp;&nbsp;목</option>
				<option value="content"<c:out value="${scri.searchType eq 'content' ? 'selected' : ''}"/>>내&nbsp;&nbsp;용</option>
				<option value="uname"<c:out value="${scri.searchType eq 'uname' ? 'selected' : ''}"/>>작&nbsp;성&nbsp;자</option>
				<option value="subcontent"<c:out value="${scri.searchType eq 'subcontent' ? 'selected' : ''}"/>>제목+내용</option>
    		</select>

			<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력" class="serch" value="${scri.keyword}"/>
    		<button id="searchBtn" type="button" class="LiBu01">검색</button>
		   
		    <!-- 제이쿼리 적용시킴 -->
		    <script>
		      $(function(){
		        $('#searchBtn').click(function() {
		          self.location = "Main" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });   
		    </script>
  		</div>
  		</li>
	</ul>
</body>
</html>
