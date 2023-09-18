<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ptj3_1team.P_Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
</script>
</head>
<body>

<%   String message= request.getParameter("m"); %>

	<%
	P_Customer info = (P_Customer) request.getAttribute("userinfo");
	
	%>
	<form action="/ptj3_1team/UUS.do" method="post">	
	<div>
		아이디: <input type="text" value="<%=info.getId()%>" name="id" readonly="readonly" ><br>
		비밀번호: <input type="text" value="<%=info.getPw()%>" name="pw"><br>
		이름: <input type="text" value="<%=info.getName()%>" name="name"><br>
		전화번호: <input type="text" value="<%=info.getPhone()%>" name="phone" ><br>
		성별: <input type="text" value="<%=info.getGender()%>" name="gender" readonly="readonly"><br>
		<button  >변경하기</button>
	</div>
	</form>
	

	
	
	<script>
	   let m ="<%=message%>";
	   if(m !="null" )
	   alert( " <%=message%>" );
	
	</script>
</body>
</html>