<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
//아이디 기억을 위한 쿠키값 확인
Cookie rcookie = null;
Cookie[] cookies = request.getCookies();
for(Cookie cookie:cookies){
	if(cookie.getName().equals("rememberId")){
		rcookie = cookie;
	}
}
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

    <title>Fresiwon - Join</title>

    <!-- Bootstrap core CSS -->
    <link href="../Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../Resources/css/clean-blog.min.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
		<jsp:include page="/includes/navigator.jsp"/>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('../Resources/img/contact-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="page-heading">
              <h1>Login Fresiwon Blog</h1>
              <span class="subheading">Login Fresiwon Blog :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p>Login Fresiwon Blog</p>
          <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
          <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
          <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
          <form action="login_action.jsp" method="post" name="sentMessage" id="contactForm" ><!-- novalidate -->
<!-- ----내가 만들어쓴거------------------------------------------------------------------- -->
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Id</label>
                <%if(rcookie==null){
                %>
                <input type="text" class="form-control" placeholder="Id" id="id" name="id" required data-validation-required-message="Please enter your id.">
            	<input type="checkbox" name="rememberId" value="remember"> Remember Id<br>
				<%
                }else{
				%>
                <input type="text" class="form-control" value="<%=rcookie.getValue() %>" id="id" name="id" required data-validation-required-message="Please enter your id.">
            	<input type="checkbox" name="rememberId" value="remember" checked> Remember Id<br>
				<%
                }
				%>				
                <p class="help-block text-danger"></p>
              </div>
            </div>
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
              <button type="submit" class="btn btn-primary" id="sendMessageButton">Login</button>
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

    <!-- Bootstrap core JavaScript -->
    <script src="../Resources/vendor/jquery/jquery.min.js"></script>
    <script src="../Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

    <!-- Contact Form JavaScript  
    <script src="../Resources/js/jqBootstrapValidation.js"></script>
    <script src="../Resources/js/contact_me.js"></script> -->
     

    <!-- Custom scripts for this template -->
    <script src="../Resources/js/clean-blog.min.js"></script> 

  </body>

</html>
