<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	#btn{
		width:20%;
		float:right;
		text-align: right;
		margin-top:200px;
	}
	#btnBack{
		width:95px;
		margin-bottom:10px;
	}
	#btnManager{
		width:95px;
	}
	#container{
		width:70%;
		margin:0 auto;
		margin-top:100px;
		/* border:1px solid black; */
		clear:both;
	}
	#container #content{
		width:100%;
		border:1px solid red;
		padding:10px;
	}
	#reply{
		width:70%;
		margin:0 auto;
		margin-top:100px;
		/* border:1px solid black; */
		padding:10px;
	}
	#replyInsertDiv{
		width:70%;
		margin:0 auto;
		margin-bottom:50px;
		padding:10px;
		border:1px solid gray;
		border-radius: 14px;
	}
	#replyContent{
		width:60%;
		margin:0 auto;
	}
	#replyList{
		width:90%;
		margin:0 auto;
	}
	#replyList #replyListUl{
		width:70%;
		margin:0 auto;
		list-style: none;
		/* border:1px solid blue; */
	}
	#replyList #replyListUl li{
		width:70%;
		border:1px solid black;
		border-radius:15px;
		padding:10px;
		margin-bottom:10px;
	}
	#page{
		width:60%;
		margin:0 auto;
	}
	#page #pagination{
		width:90%;
		margin:0 auto;
		text-align:center;
		list-style: none;
	}
	#page #pagination li{
		display:inline-block;
		width:30px;
		height:30px;
		border:1px solid black;
	}
</style>
<script>
	$(function(){
		var bno=$("input[type='hidden']").val();
		
		$("#btnReplySave").click(function(){
			var replyer=$("#replyer").val();
			var replyContent=$("#replyContent").val();
			
			var sendData={bno:bno, replyer:replyer, replytext:replyContent};
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/",
				type:"post",
				headers:{"Content-Type":"application/json"},
				dataType:"text",
				data:JSON.stringify(sendData),//json객체를 json string 으로 변경해줌
				success:function(result){
					$("#replyer").val("");
					$("#replyContent").val("");
					getPage(1);
				}
			})
		});
	})
	function getPage(page){
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/"+bno+"/"+page,
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);					
					$("#replyListUl").empty();
					var str="";
					for(var i=0;i<json.list.length;i++){
						str+="<li><p>"+json.list[i].replyer+"</p><p>"+json.list[i].replytext+"</p></li>"
					}
					$("#replyListUl").append(str);
					
					printPaging(json.pageMaker);
					console.log(json.pageMaker);
				}
			});				
		}
		
		function printPaging(pageMaker){
			var str="";
			if(pageMaker.prev){
				str+="<li><a href=''"+(pageMaker.startPage-1)+"> << </a></li>"
			}
			
			for(var i=pageMaker.startPage;i<=pageMaker.endPage;i++){
				if(pageMaker.cri.page==i){
					str+="<li class='active'><a href='"+i+"'>"+i+"</a></li>";
				}else{
					str+="<li><a href='"+i+"'>"+i+"</a></li>";
				}
			}
			
			if(pageMaker.next){
				str+="<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>"
			}
			$("#pagination").html(str);
		}
</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<input type="hidden" value="${item.bno}">
	<div id="btn">
		<div id="btnBack">
			<a href="${pageContext.request.contextPath}/board"><button>목록 보기</button></a>
		</div>
		<div id="btnManager">
			<c:if test="${item.pwtype=='o'}">
				<a href="${pageContext.request.contextPath}/update/${item.bno}"><button>수정</button></a>
				<a href="${pageContext.request.contextPath}/delete/${item.bno}"><button>삭제</button></a>
			</c:if>
			
		</div>
	</div>
	<div id="container">
		<div id="content">
			<p>작성자: ${item.bwriter}</p><br>
			${item.bcontent}
		</div>
	</div>
	
	<!-- 댓글 -->
	<div id="reply">
		<!-- 댓글 입력 -->
		<div id="replyInsertDiv">
			<p>댓글</p>
			<button id="btnReplySave">저장</button><br>
			<input id="replyer" type="text" placeholder="작성자 이름을 입력하세요." name="replyer"><br>
			<input id="replyContent" type="text" placeholder="댓글 내용을 입력하세요." name="replyContent">
		</div>
		
		<!-- 댓글 리스트 -->
		<div id="replyList">
			<ul id="replyListUl">
				<c:forEach var="replies" items="${list}"> 
					<li>
						<p>작성자: ${replies.replyer}</p>
						<p>내 용: ${replies.replytext}</p>
					</li>
				</c:forEach>
			</ul>
			
		</div>
		<!-- 댓글 페이지 -->
		<div id="page">
			<ul id="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage-1}">%laquo;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li><a href="${idx}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li><a href="listPage${pageMaker.endPage+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<script>
		var bno=$("input[type='hidden']").val();
		//getPage($());
	</script>
</body>
</html>