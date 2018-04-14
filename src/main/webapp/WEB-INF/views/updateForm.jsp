<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
	#container{
		width:70%;
		margin:0 auto;
	}
	#header{
		width:100%;
		margin-bottom:30px;
	}
	#title{
		width:50%;
		line-height: 20px;
	}
	.btn{
		width:100px;
		height:40px;
		font-size: 1.2em;
		float:right;
		display:block;
		margin-left:10px;
	}
</style>
</head>
<body>
	<h1>업데이트 입니다.</h1>
	<form id="form1" method="post" action="${pageContext.request.contextPath}/update">
		<div id="container">
			<h2>글쓰기</h2>
			<div id="header">
				<input type="hidden" name="bno" value="${obj.bno}">
				<span>제목:</span>
				<input id="title" type="text" name="btitle" value="${obj.btitle}">
				<input class="btn" type="submit" value="수정">
				<a href="${pageContext.request.contextPath}"><button type="button" class="btn">뒤로가기</button></a>
			</div>
			<textarea id="editor1" name="bcontent">
			    ${obj.bcontent}
			</textarea>
			<script>
				CKEDITOR.replace('bcontent',{filebrowserUploadUrl:"${pageContext.request.contextPath}/imgUpload"});
			</script>
		</div>
		
	</form>
	
</body>
</html>