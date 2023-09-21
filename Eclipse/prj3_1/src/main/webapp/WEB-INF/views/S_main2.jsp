<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		//alert("dkfdkdfk");
		let resno = document.frm.resno;

		if (resno.value == "") {
			alert("예약번호를 입력하세요");
			resno.focus();
			return false;
		} else {
			return true;
		}

	}
</script>

<style>
* {
	padding: 0px;
	margin: 0px
}

section {
	height: 590px;
	padding-top: 60px;
}

.wrap {
	background-color: white;
	width: 1000px;
	margin: 0px auto;
	display: flex;
	height: 500px;
	flex-wrap: wrap;
	border-radius: 30px;
}

.sp {
	background-color: #B8E9FF;
	border-radius: 30px 0px 0px 0px;
	height: 100px;
	width: 50%;
	box-sizing: border-box;
	text-align: center;
	line-height: 95px;
	font-size: 25px;
	color: black;
}

.pp {
	background-color: #B8E9FF;
	border-radius: 0px 30px 0px 0px;
	height: 100px;
	width: 50%;
	box-sizing: border-box;
	text-align: center;
	line-height: 95px;
	font-size: 25px;
}

a {
	color: black;
}

.ppinpo {
	padding-top: 20px;
	width: 1000px;
	height: 400px;
}

.disp {
	margin: 0 auto;
	width: 500px;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	border-radius: 30px;
}

.bg {
	background-image: url("./img/back.png");
	background-size: 100% 100%;
}

.disp input {
	height: 25px;
	width: 400px;
	margin-bottom: 7px;
	border-radius: 20px;
	border: 1px solid black;
	padding-left: 10px;
	text-align: center;
}

.sbtn {
	background-color: #B8E9FF;
	height: 30px;
	width: 100px;
	border-radius: 20px;
	border: none;
	margin-top: 10px;
	font-weight: bolder;
	background-color: #B8E6E1;
	color: black;
	border: 1px solid gray; /* 테두리 색상 추가 */
}

.sbtn:active {
	background-color: rgb(172, 237, 244);
	border: none;
}

form {
	margin-top: 70px;
}

form input, .sbtn {
	margin-top: 30px;
}
</style>
</head>
<body>
	<main>
		<header>
			<div class="headerimg">
				<a href="/prj3_1/index.do"><img alt="이미지"
					src="<%=request.getContextPath()%>/img/acornairport.png"></a>
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

						환영합니다 [<%=id%>]님 ฅʕ•o•ʔฅ
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



			<div class="wrap">
				<div class="sp">
					<a href="<%=request.getContextPath()%>/smain">예 약 조 회</a>
				</div>
				<div class="pp">
					<a href="<%=request.getContextPath()%>/UUA.do">개인정보 수정</a>
				</div>
				<div class="ppinpo">

					<div class="disp">

						<form name="frm" action="<%=request.getContextPath()%>/scheck"
							method="get" onsubmit="return check();">
							<label for="resno"> 예약번호를 입력해주세요:</label><br> <input
								type="text" name="resno"><br>
							<button class="sbtn">검색</button>
						</form>

					</div>
				</div>
			</div>
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