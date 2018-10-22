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

	<%--유효성검증을 위한 정규식 
	<script type="text/javascript" src="../Resources/js/regExp.js"/>--%>
<script type="text/javascript">
window.onload=function(){
	eventRegist();
}
</script>
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
          <form action="join_action.jsp" method="post" name="sentMessage" id="contactForm" ><!-- novalidate -->
<!-- ----내가 만들어쓴거------------------------------------------------------------------- -->
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>Id</label>
                <input type="text" class="form-control" placeholder="Id" id="id" name="id" required data-validation-required-message="필수 입력란 입니다.">
				<button id="dupCheck" class="btn btn-primary">중복확인</button>
<span style="display: none; color:red;">id alert</span>
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
              <button type="submit" disabled="disabled" class="btn btn-primary" id="sendMessageButton">Join</button>
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
    <!-- validation script -->
	<script type="text/javascript">

function eventRegist() {
	// validate검사 모두 충족 시 버튼 활성화
	console.log('이벤트등록합니다');
	var idCheck = document.getElementById('id').onkeyup=function(){
					validate(this)};
	var nameCheck = document.getElementById('name').onkeyup=function(){
		validate(this)};
	var passCheck = document.getElementById('passwd').onkeyup=function(){
		validate(this)};
	var passCheckCheck = document.getElementById('passwdCheck').onkeyup=function(){
		validate(this)};
	var emailCheck = document.getElementById('email').onkeyup=function(){
		validate(this)};
		
	if(idCheck&&nameCheck&&passCheck&&passCheckCheck&&emailCheck){
		document.getElementById('sendMessageButton').removeAttribute('disabled');
	}else{}
	
}

function validate(inputField) {
	console.log('유효성시작합니다..');
	var alertEl = document.getElementsByTagName('span');
	// 입력받은값
	var inputVal = inputField.value.trim();
	console.log('입력값은?'+inputVal);
	// 정규식에 쓰일 변수
	var reg;
	
	// 입력el의 name에 따른 분기
	switch(inputField.getAttribute('name')){
	case 'id':
		reg = /^[a-zA-Z0-9]{2,10}$/;
		var target = alertEl[1];
		if(!reg.test(inputVal)){
			showAlert('* id포맷 알려주기', target, 'red');
			return false;
		}else{
			showAlert('멋진 아이디이네요!', target, '#0085A1');
			return true;
		}
		break;
	case 'name':
		reg = /^[가-힣]{2,5}$/;
		target = alertEl[2];
		if(inputVal.trim() == null || inputVal.trim() ==''){
			showAlert('필수 입력란 입니다.', target, 'red');
			return false;
		}else if(!reg.test(inputVal)){
			showAlert('이름은 2~5자의 한글 입니다.', target, 'red');
			return false;
		}else{
			target.style="display:none;";
			return true;
		}
		break;
	case 'passwd':
		reg = /^[a-zA-Z0-9]{4,10}$/; //특수문자넣는거도 포함..
		target = alertEl[3];
		if(inputVal.trim() == null || inputVal.trim() ==''){
			showAlert('필수 입력란 입니다.', target, 'red');
			return false;
		}else if(!reg.test(inputVal)){ 
			showAlert('비밀번호는 4~10자 영문 대 소문자, 숫자, 특수문자를 사용해 주세요');
			return false;
		}else{
			target.style="display:none";
			return true;
		}
		break;
	case 'passwdCheck':
		target = alertEl[4];
		var passwd = document.getElementById('passwd').value;
		console.log('비밀번호: '+passwd);
		console.log('비번체크: '+inputVal);
		if(inputVal==passwd){
			target.style="display:none;";
			return true;
		}else{
			showAlert('비밀번호가 일치하지 않습니다.', target, 'red');
			return false;
		}
		break;
	case 'email':
		reg = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;;
		break;
	}
}
function showAlert(message, target, color) {
	target.innerText = message;
	//var styleTxt = "display: block; color: "+color;
	target.style ="display: block; color:"+color;
}
	
	</script>

  </body>

</html>
