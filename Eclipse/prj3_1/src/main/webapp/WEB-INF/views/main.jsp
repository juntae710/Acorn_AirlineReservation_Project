<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<style>
section {
	height:600px;
   padding-top: 50px;
}
.bookingitem {
	height: 300px;
	margin: 0 auto;
	width: 1000px;
	background-color: white;
	border-radius: 20px;
}

.departure {
	height: 270px;
	width: 300px;
	display: none;
	background-color: white;
	overflow: scroll;
	border-radius: 20px;
	padding: 10px;
	margin-top: 5px;

}
.departure p, #endp, #endp2 , #endp3 ,.flightclass p{
display: inline-block;
}
.departure::-webkit-scrollbar {
  display: none;
}
#endp{
font-weight: bolder;
margin-left: 130px;
}
#endp2{
font-weight: bolder;
}
#endp3{
font-weight: bolder;
margin-left: 65px;

}

#ecoBtn, #bsnBtn{
	background-color: #B8E9FF;
	height: 30px;
	width: 100px;
	border-radius: 20px;
	border: none;
	margin-top: 25px;
	font-weight: bolder;
	background-color: #B8E6E1;
	color: black;
	border: 1px solid gray; /* 테두리 색상 추가 */
}

#ecoBtn:active, #bsnBtn:active {
	background-color: rgb(172, 237, 244);
	border: none;
}


.selectdate {
	height: 300px;
	margin: 0 auto;
	width: 300px;
	display: none;
}

.selectitem {
	height: 300px;
	margin: 0 auto;
	width: 500px;
	display: block;
}

.flightclass {
	height: 120px;
	width: 210px;
	display: none;
	margin-left: 635px;
	background-color: white;
	padding: 10px;
	margin-top: 5px;
	border-radius: 20px;
}

.btn {
	width: 100%;
	height: 50px;
	display: flex;
}

.book {
	width: 100%;
	background-color: #B8E9FF;
	border-radius: 20px 20px 0 0;
	border: none;
	font-size: 25px;
	font-weight: bold;
}

.select {
	width: 250px;
}

.bg {
	background-image: url("./img/back.png");
	background-size: 100% 100%;
}
.selectall{
display: flex;
height: 250px;
}
.point{
width: 40%;
height: 100%;
display: flex;

justify-content: space-around;
}

#fromBtn, #toBtn{
width: 100px;
height: 100px;
border-radius: 20px;
border: 2px solid skyblue;

}
#toBtn{
margin-left: 30px;

}
.point2{
display: flex;
width: 60%;
}
.sp{
display: inline-block;
}
.ep{
margin-left: 70px;
display: inline-block;
}
.sep{
margin-top:40px; 
}
.cnfqkfdlf{
width: 40%;
margin: 0 auto;
}
.cnfqkfdlf p{
margin-top:40px; 
}
.cnfqkfdlf button{
width: 100px;
height: 100px;
}
.emdrmq{
width: 40%;
}
.emdrmq p{
margin-top:40px; 
}
.emdrmq button{
width: 100px;
height: 100px;
}
.whghl{
width: 20%;
}
.whghl button{
margin-top:70px; 
width: 100px;
height: 100px;
}
.deBox{
width: 1000px;
margin: 0 auto;
}
#dateBtn{
border-radius: 20px;
border: 2px solid skyblue;
}
#gradeBtn{
border-radius: 20px;
border: 2px solid skyblue;
}
.whghl button{
border-radius: 20px;
border: 2px solid skyblue;
}
.whghl button, #gradeBtn ,#dateBtn, #fromBtn, #toBtn{
background-color: #fccdd66e;
}

</style>
<script>
function endp() {
	$('.departure').css("display", "none");
}
function endp2() {
	$('.selectdate').css("display", "none");
}
function endp3() {
	$('.flightclass').css("display", "none");
}
	function send(buttonId) {
		$('.departure').css("display", "block");
		$('.flightclass').css("display", "none");
	    $('.selectdate').css("display", "none");
		$.ajax({
			type : "post",
			dataType : "json",
			url : "/prj3_1/index.do",
			success : function(data) {
				console.log(data);
				$("#departureList").empty();
				$.each(data, function(index, item) {
					$("#departureList").append(
							'<span style="cursor: pointer;" onclick="select(\''
									+ buttonId + '\', this);">' + item.code
									+ " - " + item.city + " - " + item.country
									+ " - " + item.cotinet + "</span><br>");

				});

			},
			error : function(err) {

				console.log(err);
			}
		});

	}

	function select(buttonId, target){
		let selected = document.getElementById(buttonId);
		let splitStr = target.innerText;
		let parts = splitStr.split(" - ");
		let code = parts[0];         
		let city = parts[1];
		selected.value  = code + "\n" + city;
		selected.innerText = selected.value
		if(buttonId == "fromBtn"){
		    document.getElementById("fromData").value = target.innerText;
		  
	    }
	    else if(buttonId == "toBtn"){
	    	document.getElementById("toData").value = target.innerText;
	    	   
	    }
	    $('.departure').css("display","none");
	}

	function selectDate() {
		$('.selectdate').css("display", "block");
		$('.departure').css("display", "none");
		$('.flightclass').css("display", "none");
		let now_utc = Date.now()
		let timeOff = new Date().getTimezoneOffset() * 60000;
		let today = new Date(now_utc - timeOff).toISOString().split("T")[0];
		document.getElementById("Date").setAttribute("min", today);

		$('#Date').change(function() {
			let date = $('#Date').val();
			$('#dateBtn').text(date);
			$('.selectdate').css("display", "none");
		});

	}
	function databtn() {
		let date = $('#Date').val();
		$('.flightclass').css("display", "none");
	    $('.selectdate').css("display", "none");
		$('.departure').css("display", "none");

	    
		let fromBtn = document.getElementById("fromBtn").value;
		let toBtn = document.getElementById("toBtn").value;
		if (date == "" || fromBtn == "" || toBtn == "") {
			alert("입력되지 않은 정보가 있습니다.");
			return false;
		}
		return true;

	}
	function selectGrade(buttonId) {
		if (buttonId == "ecoBtn") {
			document.getElementById("selectedGrade").value = "이코노미석";
		} else if (buttonId == "bsnBtn") {
			document.getElementById("selectedGrade").value = "비즈니스석";
		}
		$('#gradeBtn').text(document.getElementById("selectedGrade").value);
		$('.flightclass').css("display", "none");
	}
	function btnGrade() {
		$('.flightclass').css("display", "block");
		$('.selectdate').css("display", "none");
		$('.departure').css("display", "none");

	}
</script>
</head>
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
			<div class="bookingitem">
				<div class="btn">
					<button class="book">예매</button>
					
				</div>
				<div class="selectall">
					<!-- 선택창 -->
					<div class="point">
						<!-- 출발지와 목적지 -->
						<form name="frm" action="flight.do" method="post" charset="utf-8">
							<input type="hidden" id="fromData" name="fromData" value="">
							<input type="hidden" id="toData" name="toData" value="">
							<div class="sep">
							<div class="sp"><p>출발지</p></div>
							<div class="ep"><p>목적지</p></div>
							</div>
							<button onclick="send('fromBtn')" id="fromBtn" type="button">From</button>
							
							<button onclick="send('toBtn')" id="toBtn" type="button">To</button>
					</div>

					<div class="point2">
						<!-- 출발일, 좌석등급, 검색 버튼 -->
						<div class="cnfqkfdlf">
							<!-- 출발일 선택 -->
							<p>출발일</p>
							<button id="dateBtn" onclick="selectDate()" type="button">가는날</button>
						</div>
						<div  class="emdrmq">
							<!-- 좌석등급 -->
							<p>좌석등급</p>
							<button type="button" onclick="btnGrade()" id="gradeBtn">선택하세요</button>
						</div>
						<div class="whghl">
							<!-- 항공편 조회 버튼 -->
							<button onclick="return databtn()" type="submit">항공편 검색</button>
						</div>

					</div>
				</div>

			</div>
			<div class="deBox">
			<div class="departure">
				<p>지역과 도시 선택 </p><div id="endp" onclick="endp()">[X]</div>
				<div id="departureList"></div>

			</div>
			<div class="selectdate">
				<input type="date" id="Date" name="dateData"><div id="endp2" onclick="endp2()">[X]</div>
			</div>
			<div class="flightclass">
				<p>좌석등급선택</p><div id="endp3" onclick="endp3()">[X]</div>
				<button type="button" onclick="selectGrade('ecoBtn')" id="ecoBtn">이코노미석</button>
				<button type="button" onclick="selectGrade('bsnBtn')" id="bsnBtn">비즈니스석</button>
				<input type="hidden" id="selectedGrade" name="selectedGrade"
					value="">
			</div>
			</div>
			</form>




		</section>


		<div class="fr">
			<div>
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
			</div>
		</div>
	</main>
</body>
</html>