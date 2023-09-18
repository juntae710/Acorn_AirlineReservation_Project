<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>


function check() {
	

	
	alert("dkdkdk");
	
	
	if (frm.id.value == "") {
		frm.id.focus(();
		alert("아이디를 입력하세요");
		return false;
	};
}



</script>


<form name="frm" action="<%= request.getContextPath()%>/join.do" method="post" onsubmit="return check()">

	<input type="text" name="id"><br>
	<input type="text" name="pw"><br>
	<input type="text" name="name"><br>
	<input type="text" name="phone"><br>
	<input type="radio" name="gender" value="M">M
	<input type="radio" name="gender" value="W">W<br>
	<button>회원가입</button>

	

</form>

</body>
</html>