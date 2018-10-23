/**
 * 회원가입 시 유효성 검증을 위한 js소스파일
 */
window.onload = function(){
	eventRegist();
}

function eventRegist() {
	// validate검사 모두 충족 시 버튼 활성화
	var idCheck = document.getElementById('id').onkeyup=function(){
		validate(this)};
	//document.getElementById('dupCheck').onclick=checkId(document.getElementById('id').value);	
	
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
	}else{
		
	}
	
	
}

function validate(inputField) {
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
			showAlert('2~10자의 영문 대 소문, 숫자 형식으로 입력해주세요.', target, 'red');
			return false;
		}else{
			showAlert('아이디 중복체크를 해주세요!', target, 'red');
			return true;
		}
		break;
	case 'name':
		reg = /^[가-힣]{2,5}$/;
		target = alertEl[3];
//		if(inputVal.trim() == null || inputVal.trim() ==''){
//			showAlert('필수 입력란 입니다.', target, 'red');
//			return false;
//		}
	if(!reg.test(inputVal)){
			showAlert('이름은 2~5자의 한글 입니다.', target, 'red');
			return false;
		}else{
			target.style="display:none;";
			return true;
		}
		break;
	case 'passwd':
		reg = /^[a-zA-Z0-9]{4,10}$/; //특수문자넣는거도 포함..
		target = alertEl[4];
//		if(inputVal.trim() == null || inputVal.trim() ==''){
//			showAlert('필수 입력란 입니다.', target, 'red');
//			return false;
//		}
		if(!reg.test(inputVal)){ 
			showAlert('비밀번호는 8~16자 영문 대 소문자, 숫자를 사용해 주세요', target, 'red');
			return false;
		}else{
			target.style="display:none";
			return true;
		}
		break;
	case 'passwdCheck':
		target = alertEl[5];
		var passwd = document.getElementById('passwd').value;
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
		target = alertEl[6];
		if(!reg.test(inputVal)){
			showAlert('이메일 형식을 지켜주세요', target, 'red');
			return false;
		}else{
			target.style="display:none";
			return true;
		}
		break;
	}
}

function idCheck(){
	var checkId = document.getElementById('id'); //확인할 id값 받는 input(입력받은 값)
	validate(checkId);
}

function showAlert(message, target, color) {
	target.innerText = message;
	target.style ="display: block; color:"+color;
}

function checkId(id) {
	console.log("아이디체크함수, 체크할 아이디: "+document.getElementById('id').value);
	var url = "../user/check_id.jsp?id="+document.getElementById('id').value;
	var checkWin = window.open(url, "id중복 체크", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}


