<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>s
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
}

main {
	border: 1px solid black;
}

header {
	border: 1px solid red;
	height: 150px;
	display: flex;
	position: relative;
}

.headerimg {
	width: 200px;
	height: 70px;
	border: 1px solid black;
	position: absolute;
	left: 30px;
	top: 30px;
}

.headerAtag {
	width: 200px;
	height: 50px;
	border: 1px solid black;
	position: absolute;
	right: 30px;
	top: 30px;
	text-align: center;
}

section {
	border: 1px solid green;
	height: 500px;
	margin-top: 40px;
}

footer {
	border: 1px solid blue;
	height: 200px;
	margin-top: 40px;
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<main>
		<header>
			<div class="headerimg">
				<img src="" alt=""> 로고사진
			</div>

			<%
			String id = (String) session.getAttribute("id");
			%>

			<div class="headerAtag">
				<%
				if (id == null) {
				%>
				<a href="<%=request.getContextPath()%>/h_login">로그인</a>
				<%
				%>
				<a href="<%=request.getContextPath()%>/l_join">회원가입</a>
				<%
				} else {
				%>
				<p>아이디: <%=id%>님 </p>
				<a href="<%=request.getContextPath()%>/h_logOut">로그아웃</a>
				<a href="<%=request.getContextPath()%>/smain">마이페이지</a>

				<%
				}
				%>
			</div>

		</header>

		<section>내용</section>

		<footer> 풋터 </footer>
	</main>
</body>
</html>