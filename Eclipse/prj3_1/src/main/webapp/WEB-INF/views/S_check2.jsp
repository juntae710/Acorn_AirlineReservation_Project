<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="prj3_1.Flight2"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<style>
.stable0, .stable3, .stable4 {
	border-collapse: collapse;
}

.stable0 {
	width: 1000px;
	height: 450px;
	margin: 0px auto;
}

.stable3, .stable4 {
	height: 50px;
	background-color: #B8E9FF;
	font-size: 25px;
}

.stable3 {
	border-radius: 20px 0px 0px 0px;
}

.stable4 {
	border-radius: 0px 20px 0px 0px;
}

.check {
	color: black;
	text-decoration: none;
}

.stable:hover {
	background-color: skyblue;
}

label {
	font-size: 13px;
}

.sbtn {
	background-color: #d7ecf9;
	border-color: #d7ecf9;
	border-radius: 5px;
	font-size: 10px;
	margin-top: 30px;
	width: 300px;
}

input {
	margin-top: 10px;
	width: 300px;
}

.stable1, th, td {
	width: 800px;
	height: 100px;
	margin: 0px auto;
	border-collapse: collapse;
	text-align: center;
}

.schart th {
	background-color: #B8E9FF;
	border-collapse: collapse;
	padding: 0px;
	margin: 0px;
	height: 80px;
}

.swrap {
	width: 200px;
	padding: 0px;
	padding-bottom: 5px;
	text-align: left;
	
}

.s_check {
	
	width: 800px;
	height: 300px;
	position: absolute;
	top: 30px;
	left: 100px;
}

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
	position: relative;
}

.disp {
	margin: 0 auto;
	width: 500px;
	text-align: center;
	font-size: 15px;
	font-weight: bolder;
	border-radius: 30px;
	position: absolute;
	left: 104px;
	top: 40px;
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

.sbtn2 {
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
	position: absolute;
	bottom: 20px;
	left: 350px;
}

.sbtn2:active {
	background-color: rgb(172, 237, 244);
	border: none;
}

form {
	margin-top: 70px;
}

form input, .sbtn {
	margin-top: 30px;
}

.th1 {
	border-radius: 20px 0px 0px 0px;
}

.th2 {
	border-radius: 0px 20px 0px 0px;
}

.newth {
	border-bottom: 1px solid gray;
}

.stable0 tr {
	height: 100px;
}

#aaa {
	background-color: white;
	border-radius: 0px 0px 20px 20px;
	HEIGHT: 400PX;
	position: relative;
	 
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
			<div>

				<table class="stable0">
					<tr>
						<td class="stable3"><a
							href="<%=request.getContextPath()%>/smain" class="check">예 약
								조 회 </a></td>
						<td class="stable4"><a href="<%=request.getContextPath()%>/UUA.do" class="check">개인정보 수정</a></td>
					</tr>
					<tr>
						<td id="aaa" colspan="2">

							<div class="s_check">

								<%
								Flight2 f = (Flight2) request.getAttribute("flight");

								// System.out.println("f=" + f);
								if (f == null) {
								%>
								<script> 
								alert("조회할 수 없습니다.")
	       						window.location.href="<%=request.getContextPath()%>/smain";
								</script>
								<%
								} else {
								%>

								<div class="swrap">
									예약번호 :
									<%=f.getResno()%>
								</div>
								<table class="stable1">

									<tr class="schart">
										<th class="th1">항공기코드</th>
										<th>출발지</th>
										<th>도착지</th>
										<th>출발일</th>
										<th>도착일</th>
										<th>출발시간</th>
										<th>도착시간</th>
										<th>항공사코드</th>
										<th class="th2">항공사</th>


									</tr>

									<tr class="newth">
										<td class="th3"><%=f.getFcode()%></td>
										<td><%=f.getDeparture()%></td>
										<td><%=f.getArrival()%></td>
										<td><%=f.getSday()%></td>
										<td><%=f.getEday()%></td>
										<td><%=f.getStime()%></td>
										<td><%=f.getEtime()%></td>
										<td><%=f.getAirnum()%></td>
										<td class="th4"><%=f.getAirname()%></td>
										<form name="frm2"
											action="<%=request.getContextPath()%>/sdelete" method="post">
											<input type="hidden" name="resno" value="<%=f.getResno()%>">
											<button class="sbtn2">예약취소</button>
										</form>

										<%
										}
										%>


									</tr>

								</table>

							</div>



						</td>


					</tr>

				</table>
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