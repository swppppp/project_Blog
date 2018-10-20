<%@page import="kr.or.kosta.blog.user.dao.User"%>
<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@page import="kr.or.kosta.blog.user.dao.JdbcDaoFactory"%>
<%@page import="kr.or.kosta.blog.user.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
// 올때 article_id, whatAction("Modify", "Delete")
int article_id = Integer.parseInt(request.getParameter("article_id"));
String whatAction = request.getParameter("whatAction");
String user_id = request.getParameter("user_id");
// 비밀번호일치여부에 따른 확인값
String check=request.getParameter("checkResult");
System.out.println("check값: "+check);

UserDao dao = (UserDao)application.getAttribute("userDao");
User user = dao.read(user_id);
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
    
        <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p>Check Password</p>
          <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
          <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
          <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
          <form action="confirm_action.jsp" method="post" name="sentMessage" id="contactForm" >
          <%if(check == null || check.length()==0){
          %>
          <span style="display:none; color:red;">비밀번호를 확인해 주세요</span>
          <%}else{ 
          %>
          <span style="color:red;">비밀번호를 확인해 주세요</span>	  
          <%}
          %>
          
<!-- ----내가 만들어쓴거------------------------------------------------------------------- -->
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Password</label>
                <input type="password" class="form-control" placeholder="Password" id="passwd" name="passwd" required data-validation-required-message="Please enter your password.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
<!-- ---------------------------------------------------------------------------------------------------------------- -->
            <br>
            <div id="success"></div>
            <div class="form-group">
	            <%--확인절차에 필요한 변수들 가져가기 --%>
	            <input type="hidden" name="article_id" value="<%=article_id %>">
	            <input type="hidden" name="whatAction" value="<%=whatAction %>">
	            <input type="hidden" name="user_id" value="<%=user_id %>">
              <button type="submit" class="btn btn-primary" id="sendMessageButton">Confirm</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <hr>

        <!-- Footer -->
    <footer>
		<jsp:include page="../includes/footer.jsp"/>
    </footer>

</body>
</html>