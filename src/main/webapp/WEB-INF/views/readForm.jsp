<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#btn{
		width:100px;
		position:fixed;
		top:150px;
		right:90px;
	}
	#btnBack{
		width:95px;
		margin-bottom:10px;
	}
	#btnManager{
		width:95px;
	}
	#container{
		width:80%;
		margin:0 auto;
		margin-top:100px;
		border:1px solid black;
	}
	#container #content{
		width:100%;
		clear:both;
		border:1px solid red;
	}
</style>
</head>
<body>
	<div id="btn">
		<div id="btnBack">
			<a href="${pageContext.request.contextPath}"><button>목록 보기</button></a>
		</div>
		<div id="btnManager">
			<a href="${pageContext.request.contextPath}/update/${item.bno}"><button>수정</button></a>
			<a href="${pageContext.request.contextPath}/delete/${item.bno}"><button>삭제</button></a>
		</div>
	</div>
	<div id="container">
		<div id="content">
			${item.bcontent}
		</div>
		
	</div>
</body>
</html>