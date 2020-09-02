<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"  href="../css/bootstrap.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<link rel="stylesheet"  href="../css/bootstrap-select.min.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<link rel="stylesheet"  href="../css/custom.css">  <!-- 반응형 웹사이트 스타일 시트  -->
<title>도그샵</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$('.selectpicker').selectpicker({
	      style: 'btn-info',
	      size: 2
	  });
	 
	 function registerCheckFunction(){
		var userId = $('#userId').val();
		$.ajax({
			type: 'POST',
			url : '../userRegisterCheck',		
			data : {userId : userId},
			success : function(result){
				if(result == 1){
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');
				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	 }
	 
	 function passwordCheckFunction(){
		 var userPwd1 = $('#userPwd1').val();
		 var userPwd2 = $('#userPwd2').val();
		 if(userPwd1 == "" && userPwd1 == ""){
			 $('#passwordCheckMessage').html('');
		 }
		 if(userPwd1 != userPwd2){
			 $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		 }else{
			 $('#passwordCheckMessage').html('일치합니다.');
		 } 
	 }
</script>
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
		<a class="navbar-brand" href="../main.jsp"><img src="../images/logo.png" width="160px" height="60px" style="margin-top:-10px;"></a> <!-- 로고 -->
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav"> <!-- ul은 하나의 리스트를 보여주는  -->
				<li><a href="../main.jsp"><h4><strong>메인</strong></h4></a></li>
				<li><a href="#"><h4><strong>제품목록</strong></h4></a></li>
				<li><a href="#"><h4><strong>Q&A</strong></h4></a></li>
			</ul> 
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">로그인<span class="caret"></span></a>   <!-- <span class="caret"> -> 아이콘 같은 것  -->
					<ul class="dropdown-menu">
						<li ><a href="login.jsp">로그인</a></li> <!-- active 현재 선택이 되었다는 뜻 class="active" 이건 하나밖에 못씀. 현재 화면에 선택된 것을 의미  -->
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav> <!-- 하나의 웹 사이트의 전반적인 구성을 보여줌  -->
	<div class="container">
		<!-- container은 어떠한 내용을 닮을 수 있는 작은 그릇 개념 -->
			<div style="padding-top: 20px;" >
				<form method="post" action="join">
					<div>
						<table class="table table-bordered">
							<h3 style="text-align: left;">회원 구분</h3>
							<tbody>
								<tr>
									<th style="width:12%;">회원구분 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" 	alt="필수"></th>
									<td class="col-sm-5">
										<!-- <input type="radio" ><label>관리자</label> -->&nbsp;&nbsp; <!-- 관리자 "0" -->
										<input type="radio" name="userType" value="1" checked="checked" ><label>개인회원</label> &nbsp;&nbsp; <!-- 개인회원 "1" -->
										<input type="radio" name="userType" value="2"><label>법인</label>   <!-- 법인 "2" -->
									</td>
								</tr>							
								<div>
									<table class="table table-bordered">
										<h3 style="text-align: left;">회원 기본 정보</h3>
										<colgroup>
											<col style="width: 200px;">
											<col style="width: 500px;">
										</colgroup>
										<tbody>
											<tr>
												<th style="width:22%;">사용자번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>												
												<td>
													<div class="form-group">
														<input  type="text" class="form-control"  style="width:50%;"placeholder="사용자번호" name="userNo" maxlength="20">														
													</div>												
												</td>
											</tr>
											<tr>
												<th style="width:22%;">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>												
												<td>
												<div class="form-group">
													<input  type="text" class="form-control"  style="width:50%;"placeholder="아이디"  id="userId" name="userId" maxlength="20">
													<button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복체크</button>
												</div>
													<span>(영문소문자/숫자, 4~16자)</span> 
												</td>
											</tr> 
											<tr>
												<th style="width:12%;">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
													<div class="form-group">
														<input type="password" class="form-control" style="width:50%;" placeholder="비밀번호"  onkeyup="passwordCheckFunction();" id="userPwd1" name="userPwd1" maxlength="20">
														<span>※ 비밀번호 입력 조건 (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span>
													</div>
												</td>
											</tr>
											<tr>
												<th style="width:12%;">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
													<div class="form-group">
														<input type="password" class="form-control" style="width:50%;" onkeyup="passwordCheckFunction();" id="userPwd2" name="userPwd2" maxlength="20">
														<h5 style="color:red;" id="passwordCheckMessage"></h5>														
													</div>
												</td>
											</tr>

											<tr>
												<th style="width:12%;"  id="nameTitle">이름 <img
													src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
													<div class="form-group">
														<input type="text" class="form-control" style="width:50%;" placeholder="이름" name="userNm" maxlength="20">
													</div>
												</td>
											</tr>
											<tr>
												<th style="width:12%;">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
												<div>
														<select class="selectpicker"  id="sbox1" name="contact1" >
															<option selected>010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select> 
														<input type="text" class="form-control" style="width:50%;" placeholder="나머지8자" name="contact" maxlength="40">
													</div>
												</td>
											</tr>
											<tr>
												<th style="width:12%;">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
													<div class="form-group">
														<input type="email" class="form-control" placeholder="이메일" style="width:50%;"	name="email" maxlength="20">
													</div>
												</td>
											</tr>
											<tr>
												<th style="width:12%;">성별 <img 	src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
												<td>
													<div style="text-align: center;">
															<div class="input-group" data-toggle="buttons">
																<label class="btn btn-primary active"> 
																	<input type="radio" name="gender" autocomplete="off"  value="남자" checked> 남자</label> 
																<label class="btn btn-primary"> 
																	<input type="radio" name="gender" autocomplete="off"  value="여자" > 여자</label>
															</div>
														</div>
												</td>
										</tr>
									<tr>
									<th style="width:12%;">생년월일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"  alt="필수"></th>
									<td>
										<div class="form-group">
											<input type="text" class="form-control"  style="width:50%;"placeholder="생년월일 8자" name="birthDt" maxlength="20">
										</div>
										<span>예시) 20200101</span> 
									</td>									
								</tr>
										</tbody>
									</table>
								</div>
							</tbody>
						</table>
					</div>
					<div class="form-group" style="text-align: center;">						
						<input type="submit" class="btn btn-primary form-control" value="회원가입" style="width:30%;">
					</div>
					</form>					
				</div>
		</div>
		
		<!-- ---------------------------------ajax 모달------------------------------------------------------------- -->
		<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id ="checkType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								확인 메시지
							</h4>
						</div>
						<div class="modal-body" id="checkMessage">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>		
		</div>
		
		
		
	<footer style="background-color: #343a40 !important; height: 50px; margin-top: 160px;">
		<h6 class="font-weight-light text-uppercase py-3" style="color: #fff !important; text-align: center;">Copyright &copy; 2020 도그샵 All Rights Reserved.</h6>
	</footer>
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 애니메이션 담당 jquery 추가 -->
	<script src="../js/bootstrap.js"></script>
	<script src="../js/bootstrap-select.min.js"></script>
</body>
</html>