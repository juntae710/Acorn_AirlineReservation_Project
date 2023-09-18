<%@page import="java.util.ArrayList"%>
<%@page import="ptj3_1team.P_ResUD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid black;
}

td {
	border: 1px solid black;
	width: 100px;
}
input{
width: 80px;
}
</style>
<script type="text/javascript">
	function update() {
		//$.ajax();  ( ) 인자정보를 객체타입으로 제공
		$.ajax({
			type : "get",
			dataType : "json",
			url : "/ptj3_1team/RUS2.do",
			success : function(data) {
				console.log(data);
				output = '';

				$.each(data, function() {

					output += '<table><tr><td>' + this.resno + '</td>';
					output += '<td>' + this.fcode + '</td>';
					output += '<td>' + this.departure + '</td>';
					output += '<td>' + this.arrival + '</td>';
					output += '<td><input value=' + this.sday + '></td>';
					output += '<td><input value=' + this.eday + '></td>';
					output += '<td><input value=' + this.stime + '></td>';
					output += '<td><input value=' + this.etime + '></td>';
					output += '<td>' + this.airnum + '</td>';
					output += '<td>' + this.airname + '</td>';
					output += '<td><button>수정하기</button></td></table></tr>';
					
				});
				document.getElementById('disp').innerHTML = output;
			},
			error : function() {
				alert("요청실패");

			}
		})
	}
</script>
</head>
<body>
	<%-- 	<%
	ArrayList<P_ResUD> list = (ArrayList<P_ResUD>) request.getAttribute("Res");
	%> --%>
	<button>
		<h2>개인정보 수정</h2>
	</button>
	<button onclick="update()">
		<h2>항공편 수정</h2>
	</button>
	
		<table>
			<tr>
			
				<td>예약정보</td>
				<td>비행번호</td>
				<td>출발지</td>
				<td>도착지</td>
				<td>출발일</td>
				<td>도착일</td>
				<td>출발시간</td>
				<td>도착시간</td>
				<td>항공기코드</td>
				<td>항공기명</td>
				<td>수정</td>
			</tr>
			</table>
			<div id="disp"></div>
	
	<%-- <div>
		<table>
			<tr>
				<td>예약정보</td>
				<td>비행번호</td>
				<td>출발지</td>
				<td>도착지</td>
				<td>출발일</td>
				<td>도착일</td>
				<td>출발시간</td>
				<td>도착시간</td>
				<td>항공기코드</td>
				<td>항공기명</td>
				<td>수정</td>
			</tr>
			<%
			for (P_ResUD r : list) {
			%>
			<tr>
				<td><%=r.getResno()%></td>
				<td><%=r.getFcode()%></td>
				<td><%=r.getDeparture()%></td>
				<td><%=r.getArrival()%></td>
				<td><input value=" <%=r.getSday()%>"></td>
				<td><input value=" <%=r.getEday()%>"></td>
				<td><input value=" <%=r.getStime()%>"></td>
				<td><input value=" <%=r.getEtime()%>"></td>
				<td><%=r.getAirnum()%></td>
				<td><%=r.getAirname()%></td>
				<td><button onclick="update()">수정하기</button></td>
			</tr>
			<%
			}
			%>
		</table>
	</div> --%>
</body>
</html>