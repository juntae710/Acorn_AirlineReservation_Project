<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./css/HF.css" rel="stylesheet" type="text/css">
</head>
<style>

section {
	height:620px;
   padding-top: 30px;
}

.joinbox {
   border-radius: 30px;
   margin: 0 auto;
   width: 500px;
   
   background-color: white;
   padding-top: 30px;
}

.join_info {
   text-align: center;
   font-size: 20px;
   width: 400px;
   height: 550px;
   margin: 0 auto;
}

input {
   width: 300px;
   height: 30px;
    border-radius: 30px;
    border: 1px solid black;
}

label {
   width: 150px;
}


.radiobtn {
   width: 30px;
   height: 20px;
}

.joinbtn {
   border:none;
   font-size: 20px;
   border-radius: 30px;
 width: 310px;
   height: 35px;
   background-color: #B8E6E1;
	color: gray;
	    border: 1px solid gray; /* 테두리 색상 추가 */

}

.joinbtn:active {
	background-color: rgb(172, 237, 244);
	border: none;

}
.inputbut{
 margin-top: 20px;
}

.inputbox {
   margin-top: 20px;
}




.bg{
   background-image: url("./img/back.png");
    background-size: 100% 100%;
   }


</style>
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

      <div class="joinbox">
         <form name="frm" action="l_join" method="post">
            <div class="join_info">
               <h2>회원가입</h2>
               <div class="inputbox">
                  <label for="userid">아이디(이메일)</label><br> <input type="text"
                     name="userid" id="userid"><br>
               </div>

               <div class="inputbox">

                  <label for="userpw">비밀번호</label><br> <input type="text"
                     name="userpw" id="userpw"><br>
               </div>

               <div class="inputbox">

                  <label for="username">이름</label><br> <input type="text"
                     name="username" id="username"><br>
               </div>

               <div class="inputbox">
                  <label for="userphone">전화번호</label><br> <input type="text"
                     name="userphone" id="userphone"><br>
               </div>

               <div class="inputbox">
                  <label>성별</label><br> <input type="radio" class="radiobtn"
                     name="usergender" value="M">남자 <input type="radio"
                     class="radiobtn" name="usergender" value="W">여자<br>
               </div>


               <div class="inputbut">

                  <button type="submit" class="joinbtn">회원가입</button>
               </div>
               </table>
            </div>
         </form>
      </div>


   </section>


<div class="fr"><div>
		<footer>
			<div class="footer_info">
				<br>(주) 에이콘항공 <br>
				<br> 주소)서울 마포구 양화로 122 3층, 4층 <br>
				<br> 조장) 표준태 / 부조장) 이윤정 / 조원) 문나정 서예진 허재혁 <br>
				<br> 통신판매업신고) 마포 제 17-3587 / 개인정보보호책임자) 이윤정 에이콘항공 부조장
			</div>
			<div class="footer_img">
				<img alt="이미지" src="<%=request.getContextPath()%>/img/acornairport.png">
			</div>
		</footer>

</body>
</html>