<%@page import="java.util.ArrayList"%>
<%@page import="prj3_1.P_Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
<style type="text/css">

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

.butt {
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

.butt:active {
	background-color: rgb(172, 237, 244);
	border: none;
}

#id, #name, #gender {
	background-color: #d9d5d5;
	border: 0.5px solid black;
	outline: none;
}

.bub {
	color: gray;
	font-size: 12px;
}
.ynbut{
display: flex;
width:185px;
margin: 0 auto; 
}
.nbut{
margin-left: 20px;
}
.ybut, .nbut{
width: 80px;
height: 25px;
margin-top: 40px;
}
</style>
<script type="text/javascript">
	function select() {
		//$.ajax();  ( ) 인자정보를 객체타입으로 제공
		$
				.ajax({
					type : "get",
					dataType : "json",
					url : "/prj3_1/UUA2.do",
					success : function(data) {
						console.log(data);
						output = '';
						output += '아이디 <br> <input id="id" type="text" value="' + data.id + '" readonly="readonly" ><br>';
						output += '비밀번호 <br> <input id="pw" type="text" value="' + data.pw + '"  ><br>';
						output += '이름 <br> <input id="name" type="text" value="' + data.name + '"readonly="readonly"  ><br>';
						output += '전화번호 <br> <input id="phone" type="text" value="' + data.phone + '"  ><br>';
						output += '성별 <br> <input id="gender" type="text" value="' + data.gender + '" readonly="readonly" ><br>';
						output += '<button class="butt" onclick="update(this)">수정하기</button>';

						document.getElementById('disp').innerHTML = output;
					},
					error : function() {
						alert("요청실패");
					}
				});
	} // select
	function update(obj) {

		let div = obj.parentElement;
		let id = div.querySelector("#id").value;
		let pw = div.querySelector("#pw").value;
		let name = div.querySelector("#name").value;
		let phone = div.querySelector("#phone").value;
		let gender = div.querySelector("#gender").value;

		$.ajax({
			type : 'post',
			dataType : 'text',
			data : "id=" + id + "&pw=" + pw + "&name=" + name + "&phone="
					+ phone + "&gender=" + gender,
			url : "/prj3_1/UUA2.do",
			success : function(data) {
				alert(data);
			},
			error : function(err) {
				alert("요청에 실패 했습니다.");
			}
		});
	}
</script>
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

		<div class="wrap">
			<div class="sp">
				<a href="<%=request.getContextPath()%>/smain">조회</a>
			</div>
			<div class="pp" >
				<a href="<%=request.getContextPath()%>/UUA.do">개인정보 수정</a>
			</div>
			<div class="ppinpo">

				<div id="disp" class="disp">
					<p>개인정보 수정 동의 </p> <br>
					<p class="bub">
						제1조(목적) 이 법은 개인정보의 처리 및 보호에 관한 사항을 정함으로써 개인의 자유와 권리를 보호하고, 나아가 개인의
						존엄과 가치를 구현함을 목적으로 한다.<br> 제6조(다른 법률과의 관계) 개인정보 보호에 관하여는 다른
						법률에 특별한 규정이 있는 경우를 제외하고는 이 법에서 정하는 바에 따른다. <br> 제68조(권한의
						위임·위탁) ① 이 법에 따른 행정안전부장관 또는 관계 중앙행정기관의 장의 권한은 그 일부를 대통령령으로 정하는 바에
						따라 특별시장, 광역시장, 도지사, 특별자치도지사 또는 대통령령으로 정하는 전문기관에 위임하거나 위탁할 수 있다.
					</p>
					<div class="ynbut">
					<div>
					<button class="ybut" onclick="select()">동의</button>
					</div>
					<form action="<%=request.getContextPath()%>/h_index" method="get">
						<button class="nbut"  onclick="/prj3_1/h_index">비동의</button>

					</form>
					</div>
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



</body>
</html>