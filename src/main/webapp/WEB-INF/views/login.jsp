<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginForm{
		width:20%;
		margin:0 auto;
		margin-top:300px;
		border:1px solid black;
		padding:15px;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div id="loginForm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="아이디를 입력하세요."></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td><button id="btnLogin">로그인</button></td>
			</tr>
		</table>
	</div>
	<script>
		$(function(){
			
			$("#btnLogin").click(function(){
				var id=$("input[name='id']").val();
				var pw=$("input[name='pw']").val();
				
				if(id=='admin'&& pw=='1234'){
					location.href="manager2";
				}else{
					alert("아이디와 비밀번호를 다시 확인하세요!");
				}
			});
		});
	</script>
</body>
</html>