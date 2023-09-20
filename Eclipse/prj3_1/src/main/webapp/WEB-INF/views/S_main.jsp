<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check(){
	//alert("dkfdkdfk");
	let resno = document.frm.resno;
	
	if( resno.value ==""){
		alert("예약번호를 입력하세요");
		resno.focus();
		return false;
	}
	else{
		return true;
	}
	
}
</script>
</head>
<body>
<h2> 예약조회</h2>

<form name ="frm" action="<%=request.getContextPath()%>/scheck" method="get"  onsubmit="return check();">
 <label for="resno"> 예약번호 입력:</label>
 <input type="text"  name="resno">
 <button>조회</button>

</form>
<form  action="<%=request.getContextPath()%>/UUA.do" method="get" >
 <button>개인정보수정</button>

</form>
</body>
</html>