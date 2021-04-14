<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Join.css" rel="stylesheet" >
	<link href="${path}/resources/css/Nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/Write.css" rel="stylesheet" >
	
	<script type="text/javascript">
	
	 function WriteBT(){    	
	    	if(document.Write.cate01.value == ""){
	    		alert("카테고리를 입력하세요");
	    		document.Write.cate01.focus();
	    		return;
	    	}else if(document.Write.cate02.value == ""){
	    		alert("카테고리를 입력하세요");
	    		document.Write.cate02.focus();
	    		return;
	    	}else if(document.Write.sub.value == ""){
	    		alert("제목을 입력하세요");
	    		document.Write.sub.focus();
	    		return;
	    	}else if(document.Write.content.value == ""){
	    		alert("내용을 입력하세요");
	    		document.Write.content.focus();
	    		return;
	    	}else{
	    		alert("작성하시겠습니까?");
	    		document.Write.action ="<%=request.getContextPath()%>/WriteAction";
	    		document.Write.method = "post";		
	    		document.Write.submit();	
	    	}
	    	return
		}
	 
	 
	 function goBack() {
	        window.history.back();
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
			<form name="Write">
            <table class="Table01">
               <tr>
                  <td width="100px"><b>작 성 자 : </b></td>
                  <th width="100px">${UserVO.uname}</th>
                  <th width="100px">카 테 고 리 : </th>
                  <td width="200px">
                  		<select style="width:200px; height:26px;" name="cate01" id="cate01">
                        <option value="BasicBoard">BasicBoard</option>
                        </select>
                  </td>
                  <td width="270px">
                  		<select style="width:170px; height:26px;" name="cate02" id="cate02">
                        <option value="TestBoard">TestBoard</option>
                     	</select>
                  </td>
               </tr>
               
               <tr>
                  <td><b>글 제 목 : </b></td>
                  <td colspan="4"><input type="text" maxlength="100" name="sub" id="sub" class="text01"></td>
               </tr>
            </table>
            
            <div class="Wi01">   
                <textarea class="textarea" name="content" id="content"></textarea>
				<input type="file" name="file" id="file" accept="image/*,gif/* " class="File01">   
                <button class="WiBu01" onclick="WriteBT()">작성완료</button>
                <button class="WiBu02" onclick="goBack()">취소하기</button>
            </div>  
            </form> 
         </content>  	
	</div>				
	
	<footer>
	</footer>
	
	</div>
</body>
</html>