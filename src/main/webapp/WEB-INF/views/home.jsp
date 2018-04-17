<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<script type="text/javascript">
	/* $.noConflict();
	
	var j=jQuery; */
	$(function(){
		$("#searchBtn").click(function(){
			var searchType=$("select[name='searchType']").val();
			var keyword=$("input[name='keyword']").val();
			location.href="?${pageMaker.makeQuery(1)}&searchType="+searchType+"&keyword="+keyword;
		});
	});


</script>
</head>
<body>
	<div id="container">
		<div class="box-body">
			<select name="searchType">
				<option value="n">선택해주세요.</option>
				<option value="b" ${cri.searchType=='t'?'selected':''}>번호</option>
				<option value="t" ${cri.searchType=='c'?'selected':''}>제목</option>
				<option value="r" ${cri.searchType=='w'?'selected':''}>등록일</option>
			</select> 
			<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
			<button id="searchBtn">Search</button>
		</div>
		<div id="btnRegister">
			<%-- <c:if test="${ }"> --%>
			<a href="#"><img style="width:80px;" src="${pageContext.request.contextPath}/resources/images/person.png" alt="로그인"><br>로그인</a><br>
			<a href="register"><input type="button" value="글쓰기"></a>
		</div>
		<div id="bList">
			<div id="insertPW">
				<table>
					<tr>
						<th>비밀번호 입력:</th>
					</tr>
				</table>		
			</div>
			<table id="tbl">
				<tr>
					<th id="bno">번호</th>
					<th id="title">제목</th>
					<th id="writer">작성자</th>
					<th id="reg">등록일</th>
					<th id="cnt">조회수</th>
				</tr>
				<c:forEach var="item" items="${list}">
					<tr>	
						<td><a href="#">${item.bno}</a></td>
						<td>
							<input type="hidden" class="pwtype" value="${item.pwtype}">
							<input type="hidden" class="pw" value="${item.pw}">
							<a href="read/${item.bno}/1">${item.btitle}</a>
							&nbsp;<b>[${item.replycnt}]</b>&nbsp;
							<c:if test="${item.pwtype =='o'}"><img width='18' src="${pageContext.request.contextPath}/resources/images/pw.png"></c:if>
						</td>
						<td>${item.bwriter}</td>
						<td><fmt:formatDate type="date" value="${item.regdate}"/></td>
						<td>${item.bcount }</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		<div id="pageDiv">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="?${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li ${pageMaker.cri.page == idx? 'class=active':''}><a href="${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li><a href="?${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>