<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
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
	    		document.Write.enctype = "multipart/form-data";
	    		document.Write.method = "post";	
	    	}
		}
	 
	 function goBack() {
		    window.history.back();
		}
		
  </script>
</head>

<body>
	<div class="rap">
	<jsp:include page="Background.jsp" flush="true"/>
	<jsp:include page="MainHeader.jsp" flush="true"/>
		
	<div class="rap2">
		<content> 
			<form name="Write">
            <table class="Table01">
               <tr>
                  <td width="100px"><b>WRITER : </b></td>
                  <th width="100px">${UserVO.uname}</th>
                  <th width="100px">CATEGORY : </th>
                  <td width="200px">
                  		<select style="width:170px; height:26px; border:none;"name="cate01" id="cate01">
                        <option value="BasicBoard">BasicDiary</option>
                        </select>
                  </td>
                  <td width="270px">
                  		<select style="width:130px; height:26px; border:none;" name="cate02" id="cate02">
                        <option value="TestBoard">Daily</option>
                     	</select>
                  </td>
               </tr>
               
               <tr>
                  <td><b>T I T L E : </b></td>
                  <td colspan="4"><input type="text" maxlength="70" name="sub" id="sub" class="text01" placeholder="제목을 입력하세요"></td>
               </tr>
            </table>
            
            <div class="Wi01">   
                <textarea class="textarea" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
				
				<input type="file" name="uploadFile" id="uploadFile" accept="image/gif, image/jpeg, image/png" onchange="setThumbnail(event);"class="File01"/>
				
				<div id="image_container"></div>
				<!-- 이미지 미리보기 -->
				<script> 
					function setThumbnail(event) { 
						var reader = new FileReader(); 
						reader.onload = function(event) { 
							var img = document.createElement("img"); 
							img.setAttribute("src", event.target.result); 
							document.querySelector("div#image_container").appendChild(img); 
						}; 
						reader.readAsDataURL(event.target.files[0]); 
					} 
				</script>
				
                <button class="WiBu01" onclick="WriteBT()">WRITE</button>
                <input type="button" class="WiBu02" value="CANCEl" onclick="goBack()">
            </div>  
            </form> 
         </content>  	
	</div>				
	
	<footer>
		
	</footer>
	</div>
</body>
</html>