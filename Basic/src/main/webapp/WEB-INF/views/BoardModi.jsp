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
	
	 function UpdateBT(){    	
	    	if(document.Update.cate01.value == ""){
	    		alert("카테고리를 입력하세요");
	    		document.Update.cate01.focus();
	    		return;
	    	}else if(document.Update.cate02.value == ""){
	    		alert("카테고리를 입력하세요");
	    		document.Update.cate02.focus();
	    		return;
	    	}else if(document.Update.sub.value == ""){
	    		alert("제목을 입력하세요");
	    		document.Update.sub.focus();
	    		return;
	    	}else if(document.Update.content.value == ""){
	    		alert("내용을 입력하세요");
	    		document.Update.content.focus();
	    		return;
	    	}else{
	    		alert("작성하시겠습니까?");
	    		document.Update.action ="<%=request.getContextPath()%>/UpdateAction";
	    		document.Update.method = "post";		
	    		document.Update.submit();	
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
	<jsp:include page="MainHeader.jsp" flush="true"/>
		
	<div class="rap2">
		<jsp:include page="Nav.jsp" flush="true"/>	
				
		<content> 
			<form name="Update">
			<input type="hidden" name="bnum" value="${BoardVO.bnum}">
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
                        <option value="${BoardVO.cate02}">${BoardVO.cate02}</option>
                        <option value="TestBoard">TestBoard</option>
                     	</select>
                  </td>
               </tr>
               
               <tr>
                  <td><b>글 제 목:</b></td>
                  <td colspan="4"><input type="text" maxlength="100" name="sub" id="sub" class="text01" value="${BoardVO.sub}"></td>
               </tr>
            </table>
            
            <div class="Wi01">   
                <textarea class="textarea" name="content" id="content">${BoardVO.content}</textarea>
				<input type="file" name="file" id="file" accept="image/*,gif/* " class="File01">   
                <button class="WiBu01" onclick="UpdateBT()">작성완료</button>
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