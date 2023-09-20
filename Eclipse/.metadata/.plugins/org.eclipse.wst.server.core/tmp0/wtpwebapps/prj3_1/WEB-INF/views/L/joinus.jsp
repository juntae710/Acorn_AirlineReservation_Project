<%@page import="L.joinDAO"%>
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
	
		
		if(frm.id.value=="") {
			alert("id는 필수 입력 항목입니다");
			frm.userid.focus();
			return false;
		}
		
		
		
		if(frm.pw.value=="") {
			alert("패스워드는 필수 입력 항목입니다");
			frm.userpw.focus();
			return false;
		}
		
		
		if(frm.name.value=="") {
			alert("이름은 필수 입력 항목입니다");
			frm.username.focus();
			return false;
		}
		
		if(frm.phone.value=="") {
			alert("번호는 필수 입력 항목입니다");
			frm.userphone.focus();
			return false;
		}
		
		
		if(frm.gender.value=="") {
			alert("성별은 필수 입력 항목입니다");
			frm.usergender.focus();
			return false;
		}
	
}



</script>


<form name="frm" action="<%= request.getContextPath()%>/join.do" method="post">

<h2>회원가입</h2>
<hr>
<table>
	<tr>

	<td><label for="id">아이디(이메일)</label></td>
	<td><input type="text" name="userid" id="id"><br></td>
	
	</tr>
	
	<tr>
	
	<td><label for="pw">비밀번호</label></td>
	<td><input type="text" name="userpw" id="pw"><br></td>
	
	</tr>
	
	
	<tr>
	
	
	<td><label for="name">이름</label></td>
	<td><input type="text" name="username" id="name"></input></td>
	
	
	</tr>
	
	
	<tr>
	
	
	<td><label for="phone">번호</label></td>
	<td><input type="text" name="userphone" id="phone"></input></td>
	
	
	</tr>

	
	
	<tr>
	
	<td><label for="성별">성별</label></td>
	<td><input type="radio" name="usergender" value="M">M</td>
	<td><input type="radio" name="usergender" value="W">W<br></td>
	
	
	</tr>
	
	<tr>
	<td><button onClick="return check()">회원가입</button></td>
	</tr>

</table>	

</form>

</body>
</html>