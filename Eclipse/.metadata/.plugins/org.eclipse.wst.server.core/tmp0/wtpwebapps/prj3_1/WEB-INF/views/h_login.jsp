<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<link href="./css/Login.css" rel="stylesheet" type="text/css">
</head>

<style>
.bg{
   background-image: url("./img/back.png");
    background-size: 100% 100%;
   }
</style>



<body>

	<main>
	<header>
			<div class="headerimg">
					   <a href="/prj3_1/index.do"><img alt="이미지" src="<%=request.getContextPath()%>/img/acornairport.png"></a>
			</div>

			<%
			String id = (String) session.getAttribute("id");
			%>

			<div class="headerAtag">
				<%
				if (id == null) {
				%>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/h_login">로그인</a>
				</div>
				<%

				%>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/l_join">회원가입</a>
				</div>
				<%
				} else {
				%>
				<div class="idview">
					<p>
						
						환영합니다 [<%=id%>]님  ฅʕ•o•ʔฅ
					</p>
				</div>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/h_logOut">로그아웃</a>
				</div>
				<div class="a_box">
					<a href="<%=request.getContextPath()%>/smain">마이페이지</a>
				</div>

				<%
				}
				%>
			</div>

		</header>

		<section class="bg">
		<div class="box">
			<div class="loginBox">
				<div class="loginHead">LOGIN</div>

				<form action="<%=request.getContextPath()%>/h_login" method="post">
					<div class="inputBox">
						<div class="inputName">
							ID <br>
							<br> <input type="text" name="id">
						</div>
						<br>
						<div class="inputName">
							PASSWORD <br>
							<br> <input type="password" name="pw"> <br>
						</div>
						<div class="inputName">
							<button>로그인</button>
						</div>
						</div>
				</form>
			</div>
			</div>



			<%
			String failMessage = (String) request.getAttribute("failMessage");
			%>
			<%
			if (failMessage != null) {
			%>
			<script>
            alert("<%=failMessage%>");
			</script>
			<%
			}
			%>
			
		</section>



		<footer>
			<div class="footer_info">
				<br>(주) 에이콘항공 <br> <br> 주소)서울 마포구 양화로 122 3층, 4층 <br>
				<br> 조장) 표준태 / 부조장) 이윤정 / 조원) 문나정 서예진 허재혁 <br> <br>
				통신판매업신고) 마포 제 17-3587 / 개인정보보호책임자) 이윤정 에이콘항공 부조장
			</div>
			<div class="footer_img">
				<img alt="이미지"
					src="<%=request.getContextPath()%>/img/acornairport.png">
			</div>
		</footer>
	</main>


</body>
</html>