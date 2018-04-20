<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick-theme.css?ver=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mainsection.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script type="text/javascript">
	$.noConflict();
	alert(document.referrer);
	var j=jQuery;
	j(function(){
		j(".single-item").slick({
			autoplay:true,
			autoplaySpeed:2000,
			arrows:false,
			dots:true
		});
		j(".multi-item").slick({
			slidesToShow:3,
			slidesToScroll:1,
			autoplay:true,
			autoplaySpeed:2000,
			arrows:true
		});
		j(document).on("click",".btnClose",function(){
			j(this).parent().remove();
		});
	});
</script> 
</head>
<body> 
	<jsp:include page="include/header.jsp"></jsp:include>
	<div id="mainWrapper">
		<c:if test="${popupList != null}">
			<c:forEach var="item" items="${popupList}">
				<div style="width:${item.width}px; height:${item.height}px; margin-top:100px; position:absolute; top:${item.positiontop}px; left:${item.positionleft}px; z-index:20; background:white;">
					${item.content}
					<p class="btnClose" style="background:gray; margin:0; padding:0;"><button>[닫기]</button></p>
				</div>
			</c:forEach>
		</c:if>
		<div id="mainSlider" class="slider single-item">
			<h3><img src="${pageContext.request.contextPath}/resources/images/mainslide1.png"></h3>
			<h3><img src="${pageContext.request.contextPath}/resources/images/mainslide2.png"></h3>
			<h3><img src="${pageContext.request.contextPath}/resources/images/mainslide3.png"></h3>
			<h3><img src="${pageContext.request.contextPath}/resources/images/mainslide4.png"></h3>  
			<h3><img src="${pageContext.request.contextPath}/resources/images/mainslide5.png"></h3>
		</div>
	</div>
	<div id="mainsection1">
		<div id="mainsection1_title">
			<h2>고 객 I N T E R V I E W</h2>
		</div>
		<div id="mainsection1_smalltitle">
			<p>스마트치과를 이용하신 고객님들의 진솔한 이야기</p>
		</div>
	
		<div id="mainsection1slider" class="slider multi-item">
			<div class="mainsection1Content">
				<h3>
					<a href="#">
						<img src="${pageContext.request.contextPath}/resources/images/mainsection1img1.png">
						<p class="mainsection1ContentTitle">네비게이션 임플란트 고객 인터뷰 영상</p>
						<p class="mainsection1ContentContent">
							제일 첫 번째로 음식 먹는 것도 편해졌어요.
							그리고 남들 앞에서 마음대로 편하게 웃을 수 있어서 마음이 편하고 행복합니다.
						</p>
					</a>
				</h3>
			</div>
			<div class="mainsection1Content">
				<h3>
					<a href="#">
						<img src="${pageContext.request.contextPath}/resources/images/mainsection1img2.png">
						<p class="mainsection1ContentTitle">(1) 노영은 고객님 인터뷰 영상[부분 치아 교정]</p>
						<p class="mainsection1ContentContent">
							다른 병원에서 '전체 치열 교정'권유 받았지만<br>
							스마트치과에서 부분 치아 교정으로 빠르게 교정 받았습니다.<br>
							보이지 않게 안쪽으로 교정 받아서 더 좋았습니다.
						</p>
					</a>
				</h3>
			</div>
			<div class="mainsection1Content">
				<h3>
					<a href="#">
						<img src="${pageContext.request.contextPath}/resources/images/mainsection1img3.png">
						<p class="mainsection1ContentTitle">(2) 김원순 고객님 인터뷰 영상[임플란트]</p>
						<p class="mainsection1ContentContent">
							시설도 시스템도 스마트치과가 더 좋은데 가격은 더 저렴했습니다.<br>
							친절하게 치료도 꼼꼼하게 해주셔서 친구들에게 적극 추천했습니다.
						</p>
					</a>
				</h3>
			</div>
			<div class="mainsection1Content">
				<h3>
					<a href="#">
						<img src="${pageContext.request.contextPath}/resources/images/mainsection1img4.png">
						<p class="mainsection1ContentTitle">(3) 김부식 고객님 인터뷰 영상[임플란트]</p>
						<p class="mainsection1ContentContent">
							다른 병원에서 '틀니'를 권유 받았지만 <br>
							스마트치과에서 11개 치아를 임플란트로 수술 받았습니다.<br>
							치료 결과, 1인 진료실, 친절함 다 만족스럽습니다.
						</p>
					</a>
				</h3>
			</div>
			<div class="mainsection1Content">
				<h3>
					<a href="#">
						<img src="${pageContext.request.contextPath}/resources/images/mainsection1img5.png">
						<p class="mainsection1ContentTitle">(4) 이필선 고객님 인터뷰 영상[수면/무통증 임플란트]</p>
						<p class="mainsection1ContentContent">
							치과가 너무 무서웠는데 아프지 않게 치료 받아서 좋았습니다.<br>
							심지어 붓지도 않았습니다.<br>
							차분하게 수술해 주시는 모습에 믿음이 갔습니다.
						</p>
					</a>
				</h3>
			</div>
		</div>
	</div>
	
	<div id="mainsection2">
		<img src="${pageContext.request.contextPath}/resources/images/section2.PNG">
	</div>
	
	<div id="mainsection3">
		<iframe style="width:80%;" src="https://www.youtube.com/embed/6gFOs7rCJXU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>
	
	<div id="mainsection4">
		<img src="${pageContext.request.contextPath}/resources/images/section4.png">
	</div>
</body>
</html>