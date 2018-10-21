<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
//작성자 아이디값 확인
String writer = "";
Cookie[] cookies = request.getCookies();
for(Cookie cookie:cookies){
	if(cookie.getName().equals("loginId")){
		writer = cookie.getValue();
	}
}

//답글인지 아닌지 확인을 위한 group_no값 확인(null이면 원글, null이 아니면 답글)
String group_no =request.getParameter("group_no");
String origin_subject = request.getParameter("origin_subject");
System.out.println("그룹번호"+group_no);
%>
<!DOCTYPE html>
<html>
<!-- 
<html lang="ko">
 -->
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Fresiwon - Free Board</title>

    <!-- Bootstrap core CSS -->
    <link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Resources/css/clean-blog.min.css" rel="stylesheet">
    <link href="../Resources/css/custom.css" rel="stylesheet">

	<%--강사님 스타일..가져옴 --%>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" type="text/css" href="<%=application.getContextPath() %>/Resources/css/pagination.css">
	
  </head>
<body>
    <!-- Navigation -->
		<jsp:include page="/includes/navigator.jsp"/>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('../Resources/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>Free Board</h1>
              <span class="subheading">Free Board :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

	<!-- Page Content -->
	
<div class="container">
<form action="article_action.jsp" method="post" id="contactForm">
	<%if(group_no == null || group_no.length()==0){
	%>
	<table border="1px black">
		<tr>
		  <td>글 제목</td>
		  <td colspan="3">
		  	<input type="text" class="form-control" name="subject">
		  </td>
		</tr>
		<tr>
		  <td>작성자</td><td><input type="text" value="<%=writer %>" name="writer" readonly></td>
		  <td>비밀번호</td><td><input type="password" name="passwd"></td>
		</tr>
		<tr>
		  <td colspan="4">
		  <!-- <input type="textarea" name="content"> -->
		  <textarea rows="40" cols="50" class="form-control" name="content" style="height: 300px;"></textarea>
		  </td>
		</tr>
	</table>
	<%}else{ %><%--댓글일 경우 --%>
	<input type="hidden" name="group_no" value="<%=group_no%>">
	<table border="1px black">
		<tr>
		  <td>글 제목</td>
		  <td colspan="3">
		  	<span>re: <%=origin_subject %></span>
		  	<input type="text" class="form-control" name="subject">
		  </td>
		</tr>
		<tr>
		  <td>작성자</td><td><input type="text" value="<%=writer %>" name="writer" readonly></td>
		  <td>비밀번호</td><td><input type="password" name="passwd"></td>
		</tr>
		<tr>
		  <td colspan="4">
		  <!-- <input type="textarea" name="content"> -->
		  <textarea rows="40" cols="50" class="form-control" name="content" style="height: 300px;"></textarea>
		  </td>
		</tr>
	</table>
	<%} %>
<input type="submit" value="등록하기">
</form>
</div>

    <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>

</body>
</html>