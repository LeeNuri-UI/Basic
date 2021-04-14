<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Join.css" rel="stylesheet" >
	<link href="${path}/resources/css/View.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	
	<script type="text/javascript">
	
	 function Joint(){    	
	    	if(document.Join.uid.value == ""){
	    		alert("아이디를 입력하세요");
	    		document.Join.uid.focus();
	    		return;
	    	}else if(document.Join.upass.value == ""){
	    		alert("비밀번호를 입력하세요");
	    		document.Join.upass.focus();
	    		return;
	    	}else if(document.Join.uname.value == ""){
	    		alert("닉네임을 입력하세요");
	    		document.Join.uname.focus();
	    		return;
	    	}else if(document.Join.umail01.value == ""){
	    		alert("이메일을 입력하세요");
	    		document.Join.umail01.focus();
	    		return;
	    	}else if(document.Join.umail02.value == ""){
	    		alert("이메일을 입력하세요");
	    		document.Join.umail02.focus();
	    		return;
	    	}else{
	    		alert("가입하시겠습니까?");
	    		document.Join.action ="<%=request.getContextPath()%>/JoinAction";
	    		document.Join.method = "post";		
	    		document.Join.submit();	
	    	}
	    	return
		}
  </script>
</head>

<body>
	<div class="rap">
	<header>
		<div style="position: relative;">
			<a href="${path}/Main"><img src="${path}/resources/img/MainLine.PNG" class="divH01" alt="Mainheader"></a>	
				<c:if test ="${empty UserVO}">
					<a href="${path}/Login"><button class="divH02">로그인&nbsp;&nbsp;&nbsp;&nbsp;/</button></a>
					<a href="${path}/Join"><button class="divH03">회원가입</button></a>
				</c:if>
				
				<c:if test ="${!empty UserVO}">
					<p class="wellcom">${UserVO.uname}님 환영합니다.</p>
					<a href="${path}/LoginoutAction"><button class="divH03">로그아웃</button></a>
				</c:if>
			
			<div class="divH04">
				<a href="${path}/Main"><h2><b>BasicBoard</b></h2></a>
			</div>	
		</div>	
	</header>
		
	<div class="rap2">
		<nav>	
		<div class="divN02">
			<img src="${path}/resources/img/MainLine.PNG" class="divN01" alt="Mainheader">
			<div class="divN03">
				 그냥 블로그처럼 <br> 만들고 싶었어요 <br> 기본 게시판이니까 <br>
				<button class="divNB01">마이페이지</button> <!--로그인시 마이페이지 로그인안되있음 회원가입-->
				<div class="divN04">
					<ul><b>BasicBoard</b>
						<li><a href="${path}/List">TestBoard</a></li>
					</ul>		
				</div>		
			</div>		
		</div>
		</nav>		
			
		<content> 
            <a href="" style="margin-left:660px;"><button class="ViBu01">이전</button></a>
			<a href="${path}/List"><button class="ViBu01">목록</button></a>
			<a href=""><button class="ViBu01">다음</button></a>
			 
				<table class="Vitable01">
					<tr>
						<td width="100px;">${BoardVO.cate01}</td>
						<td colspan="5">${BoardVO.cate02}</td>
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
						<td>작성일자:</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${BoardVO.writedate}"/></td>
						<td>조회수:"${BoardVO.viewcount}"</td>
						<td colspan="3">댓글수 : ""</td>
					</tr>
				</table>	
				<div class="Vi01">
					<div class="Vi02">
					${BoardVO.content}
					</div>
					<c:if test="${UserVO.unum eq BoardVO.unum }">
						<a href="${path}/BoardModi?bnum=${BoardVO.bnum}"><button class="ViBu02">수정하기</button></a>
						<a href="${path}/delete?bnum=${BoardVO.bnum}"><button class="ViBu02">삭제하기</button></a>
					</c:if>				
				</div>
					
				<div class="Vi03">댓&nbsp;&nbsp;&nbsp;글</div>
				
				<div>
					<textarea name="content" class="ViRe01">
					</textarea>
					<button class="ViBu03">작성완료</button>
				</div>				
         </content>	
	</div>				
		<footer>
		</footer>
	</div>
</body>
</html>