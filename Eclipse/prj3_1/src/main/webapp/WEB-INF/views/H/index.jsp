<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        *{
            margin: 0;

        }
        main{

            border: 1px solid black;
        }
        header{
            border: 1px solid red;
            height: 150px;
            display: flex;
            position: relative;
        }
        .headerimg{
            width: 200px;
            height: 70px;
            border: 1px solid black;
            position: absolute;
            left: 30px;
            top: 30px;
        }
        .headerAtag{
            width: 200px;
            height: 50px;
            border: 1px solid black;
            position: absolute;
            right: 30px;
            top: 30px;
            text-align: center;

        }

        section{
            border: 1px solid green;
            height: 500px;
            margin-top: 40px;
        }
        footer{
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
            <div class="headerimg"> <img src="" alt=""> 로고사진</div>
    
    <% String id  = (String) session.getAttribute("id"); %>
    <% if( id ==null) {%>
     <div class="headerAtag"><a href="<%=request.getContextPath()%>/login">로그인</a></div>
     
    <%}else{ %>
    <div class="headerAtag"><a href="<%=request.getContextPath()%>/logOut">로그아웃</a>  <br></div>
    <%}%>
    
        </header>

    <section>
        내용
    </section>

    <footer>
        풋터
    </footer>
</main>
</body>
</html>