<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="prj3_1.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
</head>
<body>
	<!--  

-->
	<h2>예약조회</h2>

	<% Flight f = (Flight) request.getAttribute("flight")	;	
	
	 // System.out.println("f=" + f);
	 if ( f == null) {%>
	      <script> alert("없다")
	       window.location.href="<%=request.getContextPath()%>/smain";
	      </script>
	 <%} else{ %>
	 
		<%=f.getResno()%><br>
		<%=f.getFcode()%><br>
		<%=f.getDeparture()%><br>
		<%=f.getArrival()%><br>
		<%=f.getSday()%><br>
		<%=f.getEday()%><br>
		<%=f.getStime()%><br>
		<%=f.getEtime()%><br>
		<%=f.getAirnum()%><br>
		<%=f.getAirname()%><br>
		
	
		<form name="frm2" action="<%=request.getContextPath() %>/sdelete" method="post">
			<input type="hidden" name="resno" value="<%=f.getResno()%>">
			<button>예약취소</button>
		</form>	
	<%}%>
	
 

</body>
</html>