<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"  href="../css/bootstrap.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<link rel="stylesheet"  href="../css/custom.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<title>도그샵</title>
</head>
<body>	

</script>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		<a class="navbar-brand" href="../main.jsp"><img src="../images/logo.png" width="160px" height="60px" style="margin-top:-10px;"></a> <!-- 로고 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- ul은 하나의 리스트를 보여주는  -->
				<li><a href="main.jsp"><h4><strong>메인</strong></h4></a></li>
				<li><a href="#"><h4><strong>제품목록</strong></h4></a></li>
				<li><a href="#"><h4><strong>Q&A</strong></h4></a></li>
			</ul> 
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">로그인<span class="caret"></span></a>   <!-- <span class="caret"> -> 아이콘 같은 것  -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li> <!-- active 현재 선택이 되었다는 뜻 class="active" 이건 하나밖에 못씀. 현재 화면에 선택된 것을 의미  -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav> <!-- 하나의 웹 사이트의 전반적인 구성을 보여줌  -->
	<div class="container"> <!-- container은 어떠한 내용을 닮을 수 있는 작은 그릇 개념 -->
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px; margin-top: 50px;">
				<form method="post" action="login">
					<h3 style="text-align : center;" >회원 로그인</h3>
						<div class="form-group" >
							<input type="text" class="form-control" placeholder="아이디" name="userId" maxlength="20"> <!-- placeholder 아무것도 입력되지 않았을 때 보여주는 -->
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPwd" maxlength="20"> <!-- placeholder 아무것도 입력되지 않았을 때 보여주는 -->
						</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>  <!-- post 정보를 숨기면서 보낼 때 쓰는 방식 -->
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<footer style="background-color: #343a40 !important; height: 50px; margin-top: 160px;">
		<h6 class="font-weight-light text-uppercase py-3" style="color: #fff !important; text-align: center;">Copyright &copy; 2020 도그샵 All Rights Reserved.</h6>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 애니메이션 담당 jquery 추가 -->
	<script src="../js/bootstrap.js"></script>
</body>
</html>