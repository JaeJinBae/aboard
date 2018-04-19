<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	#pwcheck{
		width:70%;
		margin:0 auto;
		margin-top:200px;
	}
</style>
<script>
	$(function(){
		$("#btnPwCheck").click(function(){
			var pw=$("#pw").val();
			var realPw=$("#realPw").val();
			var bno=$("#bno").val();
			
			if(realPw==pw){
				location.href="/aboard/read/"+bno+"/"+1;
			}else{
				alert("비밀번호가 다릅니다. 다시 확인하세요.");
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div id="pwcheck">
		<h1>비밀번호 확인</h1>
		<input id="realPw" type="hidden" value="${vo.pw}">
		<input id="bno" type="hidden" value="${vo.bno}">
		<span>비밀번호: </span><input type="password" id="pw" name="pw">
		<button id="btnPwCheck">확인</button>
	</div>
</body>
</html>