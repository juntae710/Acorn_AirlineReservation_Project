<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="prj3_1.L_Customer"%>
<%@ page import="prj3_1.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">

<style>
.bg {
	background-image: url("./img/back.png");
	background-size: 100% 100%;
	position: relative;
	
}
section{
	height: 625px;
	padding-top: 30px;
}

.resbox {
	text-align: center;
	border-radius: 30px;
	margin: 0 auto;
	width: 700px;
	height: 230px;
	background-color: white;
	padding-top: 20px;
	position: absolute;
	top:  170px;
	left: 650px;
	line-height: 50px;
	border: 2px solid navy; 
}
.reswrap{
margin-top: 28px;
}
.reswrap h2{
color: navy;
}
.txtmsg{
color: gray;
font-size: 11px;
 
}
</style>
</head>
<body>
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

	<div class="resbox">
		<div class="reswrap">
		<%
		int resno = (int) session.getAttribute("resno");
		%>

		<h2>
			예약번호:
			<%=resno%></h2>
		<h3>항공권 예약이 완료되었습니다.</h3>
		<p class="txtmsg">선택하신 항공사의 경우 항공사 사정에 의해 조회된 좌석과 예약 완료후의 좌석 상태가 상이할 수 있습니다. <br>
			예약 완료 후 좌석 상태를 재확인해 주시기 바랍니다.</p>
		<h4></h4>
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
			<a href="/prj3_1/index.do"><img alt="이미지"
				src="<%=request.getContextPath()%>/img/acornairport.png"></a>
		</div>
	</footer>
</body>
</html>