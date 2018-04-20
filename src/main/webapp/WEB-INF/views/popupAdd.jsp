<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
	#popupAddForm{
		width:1024px; 
		margin:0 auto;
		margin-top:150px;
	}
	#popupAddForm table{
		border-collapse: collapse;
	}
	#popupAddForm table tr th{
		width:170px;
	}
	#popupAddForm table tr th,td{
		border:1px solid black;
		padding:10px;
	}
</style>
<script>
	$(function(){
		$("#f1").submit(function(e){
			var startDay=$("#startYear").val()+"-"+$("#startMonth").val()+"-"+$("#startDate").val();
			var endDay=$("#endYear").val()+"-"+$("#endMonth").val()+"-"+$("#endDate").val();
			
			$("input[name='startDay']").val(startDay);
			$("input[name='endDay']").val(endDay);
			
			
			//e.preventDefault();
		});
	});
</script>
</head>
<body>
	<form id="f1" method="post" action="popupAdd">
		<div id="popupAddForm">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="editor1" name="content">
			    
						</textarea>
						<script>
							CKEDITOR.replace('content',{filebrowserUploadUrl:"${pageContext.request.contextPath}/imgUpload"});
						</script>
					</td>
				</tr>
				<tr>
					<th>시작일/종료일</th>
					<td>
						<p>시작일: <input type="text" id="startYear" placeholder="2018">년 <input type="text" id="startMonth" placeholder="05">월 <input type="text" id="startDate" placeholder="05">일 </p>
						<input type="hidden" name="startDay" value="">
						<p>종료일: <input type="text" id="endYear" placeholder="2018">년 <input type="text" id="endMonth" placeholder="05">월 <input type="text" id="endDate" placeholder="05">일</p>
						<input type="hidden" name="endDay" value="">
					</td>
				</tr>
				<tr>
					<th>크기</th>
					<td>가로:<input type="text" name="width">px / 세로:<input type="text" name="height">px</td>
				</tr>
				<tr>
					<th>위치</th> 
					<td>상단: <input type="text" name="positiontop">px / 왼쪽: <input type="text" name="positionleft">px</td>
				</tr>
			</table>
			<input type="submit" value="저장">
		</div>
	</form>
</body>
</html>