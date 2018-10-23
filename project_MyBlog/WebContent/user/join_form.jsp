<%@page import="kr.or.kosta.blog.user.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
    <link href="../Resources/css/clean-blog.css" rel="stylesheet">

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
              <h1>Join Fresiwon Blog</h1>
              <span class="subheading">Join Fresiwon Blog :-)</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <p>Join Fresiwon Blog Right Now!</p>
          <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
          <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
          <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
<!-- ----내가 만들어쓴거------------------------------------------------------------------- -->
          
          <form action="check_id.jsp">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Id</label>
<% String res = request.getParameter("checkResult");
String id = request.getParameter("id");
if(res == null || res.length()==0){%>
<input type="text" style="width:75%;" class="form-control" placeholder="Id" id="id" name="checkedId" required data-validation-required-message="필수 입력란 입니다.">
<button type="submit" id="dupCheck" class="btn btn-primary">중복확인</button>
<!-- <span style="display: red; color:red;">아이디 중복확인을 해주세요.</span> -->
<%} else if(res.equals("checked")){ %>
                <input type="text" readonly value="<%=id %>" style="width:75%;" class="form-control" placeholder="Id" id="id" name="id" required data-validation-required-message="필수 입력란 입니다.">
				<button type="submit" id="dupCheck" class="btn btn-primary">중복확인</button>
<span style="color:#0085A1;">멋진 아이디이군요!</span>

<%} else if(res.equals("duplicated")){%>
                <input type="text" style="width:75%;" class="form-control" placeholder="Id" id="id" name="id" required data-validation-required-message="필수 입력란 입니다.">
				<button type="submit" id="dupCheck" class="btn btn-primary">중복확인</button>
<span style="color:red;">존재하는 아이디 입니다.</span> <%} %>
				<input type="hidden" id="isDupChecked" name="isDupChecked" value="">
			</form>
			
          <form action="join_action.jsp" onSubmit="return validate()" method="post" name="sentMessage" id="contactForm" ><!-- novalidate -->
<span style="display: none; color:red;">id alert</span>
<input type="hidden" id="checkedId" name="id">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Name</label>
                <input type="text" class="form-control" placeholder="Name" id="name" name="name" required data-validation-required-message="Please enter your name.">
<span style="display: none; color:red;">name alert</span>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Password</label>
                <input type="password" class="form-control" placeholder="Password" id="passwd" name="passwd" required data-validation-required-message="Please enter your password.">
<span style="display: none; color:red;">pass alert</span>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Password Check</label>
                <input type="password" class="form-control" placeholder="Password Again" id="passwdCheck" name="passwdCheck" required data-validation-required-message="Please enter your password check.">
<span style="display: none; color:red;">passCheck alert</span>               
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Email Address</label>
                <input type="email" class="form-control" placeholder="Email Address" id="email" name="email" required data-validation-required-message="Please enter your email address.">
<span style="display: none; color:red;">email alert</span>                
                <p class="help-block text-danger"></p>
              </div>
            </div>
        
            <br>
            <div id="success"></div>
            <div class="form-group">
              <button type="submit" disabled="disabled" class="btn btn-primary" id="sendMessageButton" onclick="includeId();">Join</button>
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

<script type="text/javascript">
function includeId() {
var idVal = document.getElementById('id').value;
document.getElementById('checkedId').value = idVal;
}
</script>

    <!-- Bootstrap core JavaScript -->
    <script src="../Resources/vendor/jquery/jquery.min.js"></script>
    <script src="../Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

    <!-- Contact Form JavaScript  
    <script src="../Resources/js/jqBootstrapValidation.js"></script>
    <script src="../Resources/js/contact_me.js"></script> -->
     

    <!-- Custom scripts for this template -->
    <script src="../Resources/js/clean-blog.min.js"></script> 
    <!-- validation script -->
    
	<script src="../Resources/js/joinValidation.js"></script>

  </body>

</html>
