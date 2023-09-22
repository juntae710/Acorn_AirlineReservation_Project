<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="prj3_1.Schedule"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.btn {
	width: 100%;
	height: 50px;
	display: flex;
	
}

.business {
border-radius:0px 30px 0 0; 
	width: 500px;
	border: none;
	
	background-color: #b8e9ff;
	font-size: 25px;
	font-weight: bolder;
}
.economy{
border-radius:30px 0px 0 0; 
	width: 500px;
	border: none;
	
border-right:1px solid gray; 
	background-color: #b8e9ff;
	font-size: 25px;
	font-weight: bolder;
}
.eco_flightList {
	width: 100%;
	margin: 0 auto;
	display: flex;
	border-bottom:1px solid gray; 
	background-color: white;
}

.bsn_flightList {
	width: 100%;
	display: flex;
	display: none;
	background-color: white;
	border-bottom:1px solid gray; 
}

.infoItem {
	display: flex;
	width: 50%;

}

.bg {
	background-image: url("./img/back.png");
	background-size: 100% 100%;
}

.mwrap {
	margin: 0 auto;
	width: 1000px;
}

section {
	height: 550px;
	padding-top: 100px;
}

.depInfo {
	width: 40%;
}

.depInfo p, .arrInfo p, .aud p {
	text-align: center;
}

.ghktkfvy {
	width: 20%;
}

.ghktkfvy p {
	margin-top: 30px;
}

.arrInfo {
	width: 40%;
}

.aud {
	width: 40%;
}

.tjsxor {
	width: 10%;
}

.tjsxor button {
	margin-top: 30px;
	width: 60px;
	height: 25px;
	background-color: #fee9ed;
	border: 2px solid skyblue;
	border-radius: 10px;
}
.qnfrk{
margin-top: 30px;
}
</style>
<script>
	function ecolist() {
		$('.bsn_flightList').css("display", "none");
		$('.eco_flightList').css("display", "block");
		$('.eco_flightList').css("display", "flex");
	}
	function bsnlist() {
		$('.eco_flightList').css("display", "none");
		$('.bsn_flightList').css("display", "block");
		$('.bsn_flightList').css("display", "flex");
	}
</script>
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
		<% 
try {
    // 예외가 발생할 수 있는 코드
%>
			<div class="mwrap">
		<%
		ArrayList<Schedule> sheduleList = (ArrayList<Schedule>) session.getAttribute("scheduleList");
		String grade = (String) session.getAttribute("grade");
		String fromCode = (String) session.getAttribute("fromCode");
		String toCode = (String) session.getAttribute("toCode");
		%>
		
			<h2>항공편 선택</h2>
			<h3>
				가는편
				<%=fromCode%>
				<%=sheduleList.get(1).getDep()%>
				->
				<%=toCode%>
				<%=sheduleList.get(1).getArrival()%></h3>
			<h3><%=sheduleList.get(1).getSday()%></h3>


			<div class="btn">
				<button class="economy" onclick="ecolist()" type="button">이코노미석</button>
				<button class="business" onclick="bsnlist()" type="button">비즈니스석</button>
			</div>
			<%
			for (int i = 0; i < sheduleList.size(); i++) {
			%>
			<form action="/prj3_1/seat.do" method="POST">

				<div class="eco_flightList">
					<div class="infoItem">
						<div class="depInfo">
							<p><%=sheduleList.get(i).getStime()%></p>
							<p><%=fromCode%>
						</div>
						<div class="ghktkfvy">
							<p>----->
						</div>
						<div class="arrInfo">
							<p><%=sheduleList.get(i).getEtime()%></p>
							<p><%=toCode%>
						</div>
					</div>
					<div class="aud">
						<p>
							항공편 명 :
							<%=sheduleList.get(i).getFcode()%></p>
						<p>
							항공기 명 :
							<%=sheduleList.get(i).getAriname()%></p>
						<%
						if (sheduleList.get(i).getEconum() != 0) {
						%>
						<p>
							잔여좌석 :
							<%=sheduleList.get(i).getEconum()%></p>
						<%
						} else {
						%>
						<p>잔여좌석이 없습니다</p>
						<%
						}
						%>

					</div>
					<input type="hidden" name="selectFlight"
						value="<%=sheduleList.get(i).getFcode()%>"> <input
						type="hidden" name="selectGrade" value="이코노미석">
					<div class="tjsxor">
						<%
						if (sheduleList.get(i).getEconum() != 0) {
						%>
						<button type="submit">선택</button>
						<%
						} else {
						%>
						<p>예매불가</p>
						<%
						}
						%>
					</div>
				</div>
			</form>


			<%
			}
			%>
			<%
			for (int i = 0; i < sheduleList.size(); i++) {
			%>
			<form action="/prj3_1/seat.do" method="POST">
				<div class="bsn_flightList">
					<div class="infoItem">
						<div class="depInfo">
							<p><%=sheduleList.get(i).getStime()%></p>
							<p><%=fromCode%>
						</div>
						<div class="ghktkfvy">
							<p>----->
						</div>
						<div class="arrInfo">
							<p><%=sheduleList.get(i).getEtime()%></p>
							<p><%=toCode%>
						</div>
					</div>
					<div class="aud">
						<p>
							항공편 명 :
							<%=sheduleList.get(i).getFcode()%></p>
						<p>
							항공기 명 :
							<%=sheduleList.get(i).getAriname()%></p>
						<%
						if (sheduleList.get(i).getBsnnum() != 0) {
						%>
						<p>
							잔여좌석 :
							<%=sheduleList.get(i).getBsnnum()%></p>
						<%
						} else {
						%>
						<p>잔여좌석이 없습니다</p>
						<%
						}
						%>

					</div>
					<input type="hidden" name="selectFlight"
						value="<%=sheduleList.get(i).getFcode()%>"> <input
						type="hidden" name="selectGrade" value="비즈니스석">
					<div class="tjsxor">
						<%
						if (sheduleList.get(i).getBsnnum() != 0) {
						%>
						<button type="submit">선택</button>
						<%
						} else {
						%>
						<p class="qnfrk">예매불가</p>
						<%
						}
						%>
					</div>
				</div>
			</form>

			<%
			}
			%>
		
		</div>
		
<%
} catch (Exception e) {
    // 예외 처리 로직
    %>
    <script type="text/javascript">
    alert("없는 항공편입니다.")
   	window.location.href="<%=request.getContextPath()%>/index.do";
   	</script>
    <%
    e.printStackTrace();
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
</body>
</html>