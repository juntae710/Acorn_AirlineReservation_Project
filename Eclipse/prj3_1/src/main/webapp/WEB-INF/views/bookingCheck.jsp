<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="prj3_1.L_Customer"%>
<%@ page import="prj3_1.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<style>
section {
	height: 625px;
	padding-top: 25px;
}

.bg {
	background-image: url("./img/back.png");
	background-size: 100% 100%;
}

.resbox {
	text-align: center;
	border-radius: 30px;
	margin: 0 auto;
	width: 500px;
	height: 580px;
	background-color: white;
	padding-top: 20px;
}

h1 {
	margin-bottom: 20px;
}

p {
	margin-bottom: 10px;
}

input {
	background-color: rgb(232, 240, 254);
	height: 25px;
	width: 200px;
	border-radius: 8px;
	border: 1px solid black;
}

.resdiv {
	display: inline
}

.pasnum {
	display: inline
}

.resres {
	margin-top: 20px;
}

.resbtn {
	background-color: #fccdd66e;
	border: 2px solid skyblue;
	border-radius: 30px;
	margin-left: 20px;
	width: 50px;
	height: 30px;
}
</style>
</head>
<body>

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


		<div class="resbox">

			<%
			String seatnum = (String) session.getAttribute("seatnum");
			String fcode = (String) session.getAttribute("selectFlight");
			String grade = (String) session.getAttribute("selectGrade");
			 id = (String) session.getAttribute("id");
			L_Customer c = (L_Customer) session.getAttribute("userinfo");
			Flight sc = (Flight) session.getAttribute("fightInfo");
			%>
			
			<h1>예약 페이지</h1>
			<p>
				이름:
				<%=(c != null ? c.getName() : "이름 없음")%>
			</p>
			<form action="/prj3_1/bookingcheck.do" method="POST">
				<%
				if (c != null && c.getPasno() != null) {
				%>
				<p name="passportText" value="<%=c.getPasno()%>">
					여권번호:
					<%=c.getPasno()%></p>
				<input type="hidden" name="passport" value="<%=c.getPasno()%>">

				<%
				} else {
				%>
				<p class="pasnum">여권 번호 입력 :</p>
				<input type="text" name="passport">
				<%
				}
				%>
				<p>
					성별:
					<%=(c != null ? c.getGender() : "성별 입력 없음")%></p>
				<p>
					항공편번호:
					<%=fcode%></p>
				<p>
					출발지:
					<%=(sc != null ? sc.getDep() : "출발지 없음")%></p>
				<p>
					도착지:
					<%=(sc != null ? sc.getArr() : "도착지 없음")%>
				</p>
				<p>
					출발일:
					<%=(sc != null ? sc.getSday() : "출발일 없음")%></p>
				<p>
					도착일:
					<%=(sc != null ? sc.getEday() : "도착일 없음")%></p>
				<p>
					출발시각:
					<%=(sc != null ? sc.getStime() : "출발 시간 없음")%></p>
				<p>
					출발시각:
					<%=(sc != null ? sc.getEtime() : "도착 시간 없음")%></p>
				<p>
					출발시각:
					<%=(sc != null ? seatnum : "좌석 없음")%></p>
				<p>
					출발시각:
					<%=(sc != null ? grade : "등급 없음")%></p>
				<div class="resres">
					<p class="resdiv">예약 진행하시겠습니까?</p>
					<button class="resbtn" type="submit">예</button>
				</div>

			</form>

		</div>

	</section>


	<footer>
		<div class="footer_info">
			<br>(주) 에이콘항공 <br> <br> 주소)서울 마포구 양화로 122 3층, 4층 <br>
			<br> 조장) 표준태 / 부조장) 이윤정 / 조원) 문나정 서예진 허재혁 <br> <br>
			통신판매업신고) 마포 제 17-3587 / 개인정보보호책임자) 이윤정 에이콘항공 부조장
		</div>
		<div class="footer_img">
			<a href="/prj3_1/index.do"><img alt="이미지"
				src="<%=request.getContextPath()%>/img/acornairport.png"></a>
		</div>
	</footer>

</body>
</html>