<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${path}/resources/css/Total.css" rel="stylesheet" >
	<link href="${path}/resources/css/Join.css" rel="stylesheet" >
	<link href="${path}/resources/css/nav.css" rel="stylesheet" >
	<link href="${path}/resources/css/Tab.css" rel="stylesheet" >
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- 중복체크 -->
	<script type="text/javascript">
	$(document).ready(function(){ 
		$("#pck").click(function(){ 
			var upass = $("#upass").val();
			if (upass ==""){
				alert("기존 비밀번호를 입력하세요");
				return;
			}
			
			$.ajax({ 
				url : "/Board/PWUdate",
	            type : "post",
	            dataType : "json",
	            data : {"upass" : $("#upass").val(),"uid" : $("#uid").val()},
				success: function(data) {			
								
					if(data == 1) {
						alert("새로운 비밀번호를 입력해주세요.");
						$("#pckd").val("1");
					}else{
						alert("비밀번호를 다시 확인해주세요");
						$("#pckd").val("");				
					}			
				},
			}); 
	    });
	});
	
	$(document).ready(function(){ 
		$("#nickCk").click(function(){ 
			var uname = $("#uname").val();
			if (uname ==""){
				alert("닉네임을 입력하세요");
				return;
			}
			
			$.ajax({ 
				url : "/Board/unameChk",
	            type : "post",
	            dataType : "json",
	            data : {"uname" : $("#uname").val()},
				success: function(data) {			
								
					if(data == 1) {
						alert("중복된 닉네임이 존재합니다.");
						$("#nickCkd").val("");
					}else{
						alert("사용가능한 닉네임입니다.");
						$("#nickCkd").val("1");				
					}			
				},
			}); 
	    });
	});
	</script>
	
	<!-- 빈칸확인 및 보내기 -->
	<script type="text/javascript">
	function Pup(){
    	if(document.pwupdate.upass.value == ""){
    		alert("새로운 비밀번호를 입력하세요");
    		document.pwupdate.upass.focus();
    		return;
    	}
    	if(confirm("비밀번호를 변경하시겠습니까?")){
	        if(document.pwupdate.pckd.value == 0){
	            alert('기존 비밀번호를 확인해주세요');
	            return false;
            }else{
	        	document.pwupdate.action ="/Board/PWUdateGo";
	    		document.pwupdate.method = "post";		
	    		document.pwupdate.submit();	
	        }
	    }	
	return;
	}
	
	function NickFormBT(){
    	if(document.NickForm.uname.value == ""){
    		alert("새로운 닉네임을 입력하세요");
    		document.NickForm.uname.focus();
    		return;
    	}
    	if(confirm("닉네임을 변경하시겠습니까?")){
	        if(document.NickForm.nickCkd.value == 0){
	            alert('닉네임 중복확인해주세요');
	            return false;
            }else{
	        	document.NickForm.action ="/Board/NickUpdateGo";
	    		document.NickForm.method = "post";		
	    		document.NickForm.submit();	
	        }
	    }	
	return;
	}
  </script>
</head>

<body>
	<div class="rap">
	<jsp:include page="MainHeader.jsp" flush="true"/>
		
	<div class="rap2">			
		<content> 
				<div class="main" style="text-align:left;">
					<!--float position 등은 위치가 겹치거나 따로놀 수 있음 그래서 margin-left로 강제 위치고정-->	
				 
					<input id="tab1" type="radio" name="tabs" style="display: none;" checked> 
					<label for="tab1">비밀번호 변경</label>
				 
					<input id="tab2" type="radio" name="tabs" style="display: none;">
					<label for="tab2">닉네임 변경</label>
					
					<input id="tab3" type="radio" name="tabs" style="display: none;">
					<label for="tab3">내가 삭제한 글</label>
				 
				 	<!-- 비밀번호 변경 -->
					<section id="content1" style="margin-bottom:20px;">
						<div class="Lo01">
							<form name="pwck" >
							
							<input type="hidden" name="uid" id="uid" value="${UserVO.uid}">
								<table border:"0">
									<tr>
										<td colspan="2">
											<h1 style="margin: 30px 0px 30px 0px; text-align:center;"> 비밀번호 변경</h1>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div style="font-size:1.7em; margin:20px 0px 0px 20px;" >ID : ${UserVO.uid}</div>
										</td>
									</tr>
									<tr>
										<td>	
											<input type="password" placeholder="기존 비밀번호를 입력하세요" maxlength="20" class="Lo02" name="upass" id="upass">								
										</td>
										<td>			
											<button class="Lo03" type="button" id="pck" name="pck"><b>PW확인</b></button>	
										</td>
									</tr>	
								</table>	
							</form>	
							
							<form name="pwupdate">
								<input type="hidden" name="pckd" id="pckd" value="0">
								<input type="hidden" name="uid" id="uid" value="${UserVO.uid}">	
								
								<table border="0">		
									<tr>
										<td>	
											<input type="password" placeholder="새로운 비밀번호를 입력하세요" maxlength="20" class="Lo02" name="upass" id="upass">
										</td>
										<td>			
											<button class="Lo03" onclick="Pup()"><b>PW변경</b></button>	
										</td>
									</tr>
								</table>
							</form>	
						</div>
					</section>
				 
					<!-- 닉네임 변경 -->				 
					<section id="content2" style="margin-bottom:20px;">
						<div class="Lo01">
						<form name="NickForm" >
							<input type="hidden" name="nickCkd" id="nickCkd" value="0">
							<input type="hidden" name="uid" id="uid" value="${UserVO.uid}">	
							
							<table border:"0">
								<tr>
									<td colspan="2">
										<h1 style="margin: 30px 0px 30px 0px; text-align:center;"> 닉네임 변경</h1>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div style="font-size:1.7em; margin:20px 0px 0px 20px;">ID : ${UserVO.uid}</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">	
										<div style="font-size:1.7em; margin:20px 0px 0px 20px;">NICK : ${UserVO.uname}</div>
									</td>
								</tr>
								<tr>
									<td>	
										<input type="text" placeholder="새로운 닉네임을 입력하세요" maxlength="20" class="Lo02" name="uname" id="uname">
									</td>
									<td>			
										<button class="Lo03" type="button" id="nickCk" name="nickCk"><b>중복확인</b></button>	
									</td>
								</tr>
								<tr>
									<td colspan="2">	
										<button class="Lo04" onclick="NickFormBT()"><b>닉네임 변경하기</b></button>
									</td>
								</tr>	
							</table>	
						</form>	
						</div>	
					</section>
					
					<section id="content3" style="margin-bottom:20px;">
						<div class="Lo01">
						
						</div>	
					</section>
				</div>	
			</content>	
	</div>				
		<footer>
			<jsp:include page="Footer.jsp" flush="false"/>
		</footer>
	</div>
</body>
</html>