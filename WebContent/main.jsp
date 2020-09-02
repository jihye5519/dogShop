<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"  href="css/bootstrap.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<link rel="stylesheet"  href="css/custom.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>	

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"><img src="images/logo.png" width="160px" height="60px" style="margin-top:-10px;"></a> <!-- 로고 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- ul은 하나의 리스트를 보여주는  -->
				<li><a href="main.jsp"><h4><strong>메인</strong></h4></a></li>
				<li><a href="#"><h4><strong>제품목록</strong></h4></a></li>
				<li><a href="#"><h4><strong>Q&A</strong></h4></a></li>
			</ul> 
			<c:if test="${userIdSession ==null }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">로그인<span class="caret"></span></a>   <!-- <span class="caret"> -> 아이콘 같은 것  -->
						<ul class="dropdown-menu">
							<li><a href="user/login.jsp">로그인</a></li> <!-- active 현재 선택이 되었다는 뜻 class="active" 이건 하나밖에 못씀. 현재 화면에 선택된 것을 의미  -->
							<li><a href="user/join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</c:if>
			<c:if test="${userIdSession !=null }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">회원관리<span class="caret"></span></a>   <!-- <span class="caret"> -> 아이콘 같은 것  -->
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li> <!-- active 현재 선택이 되었다는 뜻 class="active" 이건 하나밖에 못씀. 현재 화면에 선택된 것을 의미  -->					
						</ul>
					</li>
				</ul>
			</c:if>
		</div>
	</nav> <!-- 하나의 웹 사이트의 전반적인 구성을 보여줌  -->	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
				<li data-target="#myCarousel" data-slide-to="3" ></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img width="100%" src="images/1.JPG" >
				</div>
				<div class="item">
					<img  width="100%" src="images/2.JPG" >
				</div>
				<div class="item">
					<img width="100%" src="images/3.JPG" >
				</div>
				<div class="item">
					<img width="100%" src="images/4.JPG" >
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel"  data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel"  data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>도그샵 소개</h1>
				<p>강아지 목줄부터 사료, 간식, 의류, 영양제 등 애견용품 할인판매 쇼핑몰. 하루팔이 파격가 이벤트. 무료체험</p>
				<!-- <p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p> -->
			</div>
		</div>
	</div>
	<footer style="background-color: #343a40 !important; height: 50px; margin-top: 160px;">
		<h6 class="font-weight-light text-uppercase py-3" style="color: #fff !important; text-align: center;">Copyright &copy; 2020 도그샵 All Rights Reserved.</h6>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 애니메이션 담당 jquery 추가 -->
	<script src="js/bootstrap.js"></script>
</body>
</html>