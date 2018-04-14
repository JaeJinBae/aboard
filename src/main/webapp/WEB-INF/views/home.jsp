<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width:70%;
		margin:0 auto;
		margin-top:100px;
	}
	#container #btnRegister{
		width:100px;
		float:right;
		margin-bottom:20px;
	}
	#bList{ 
		width:100%;
		clear:both;
	}
	#tbl{
		width:100%;
		border-collapse: collapse;
		border:1px solid black;
		margin-top:20px;
	}
	#tbl tr th{
		border:1px solid black;
		font-size: 1.2em;
		background: #AB8212;
	}
	#tbl tr td{
		text-align: center;
		border:1px solid black;
	}
	#container #tbl tr #bno{
		width:60px;
	}
	#container #tbl tr #title{
		width:70%;
	}
	a{
		color:black;
		text-decoration: none;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="btnRegister">
			<a href="register"><input type="button" value="글쓰기"></a>
		</div>
		<div id="bList">
			<table id="tbl">
				<tr>
					<th id="bno">번호</th>
					<th id="title">제목</th>
					<th id="reg">등록일</th>
					<th id="cnt">조회수</th>
				</tr>
				<c:forEach var="item" items="${list}">
					<tr>
						<td><a href="#">${item.bno}</a></td>
						<td><a href="read/${item.bno}">${item.btitle}</a></td>
						<td><fmt:formatDate type="date" value="${item.regdate}"/></td>
						<td>${item.bcount }</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
</body>
</html>