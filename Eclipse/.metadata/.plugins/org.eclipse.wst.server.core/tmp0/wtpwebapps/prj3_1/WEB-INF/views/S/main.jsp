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
	let fcode = document.frm.fcode;
	
	if( fcode.value ==""){
		alert("fcode를 입력하세요");
		fcode.focus();
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

<form name ="frm" action="/prj0918프로젝트연습/scheck" method="get"  onsubmit="return check();">
 <label for="fcode"> fcode 입력:</label>
 <input type="text"  name="fcode">
 <button>조회</button>
</form>
</body>
</html>