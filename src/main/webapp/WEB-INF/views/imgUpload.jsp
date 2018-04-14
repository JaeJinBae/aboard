<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type='text/javascript'>	
	window.parent.CKEDITOR.tools.callFunction('1',"${fileUrl}","이미지가 업로드되었습니다.");
	
</script>