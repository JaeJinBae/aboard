<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
	}
	#wrapper{
		width:50%;
		margin:0 auto;
		margin-top:200px;
	}
	#wrapper table{
		border-collapse: collapse;
	}
	#wrapper table tr, th, td{
		border:1px solid black;
	}
	#wrapper talbe th, td{
		width:120px;
		text-align: center;
	}
	.title{
		width:300px;
		text-align: left;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="btnAdd">
			<a href="${pageContext.request.contextPath}/popupAdd"><button>팝업 등록</button></a>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>위치(상단/왼쪽)</th>
				<th>크기(가로/세로)</th>
				<th>@</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.pno}</td>
					<td class="title">${item.title}</td>
					<td><fmt:formatDate type="date" value="${item.startdate}"/></td>
					<td><fmt:formatDate type="date" value="${item.enddate}"/></td>
					<td>${item.positiontop}px/${item.positionleft}px</td>
					<td>${item.width}px/${item.height}px</td>
					
					<td><a class="" href="updatePopup/${item.pno}"><button>수정</button></a><a href="deletePopup/${item.pno}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>