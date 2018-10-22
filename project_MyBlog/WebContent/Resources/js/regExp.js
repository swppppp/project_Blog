/** 회원가입 유효성 검증을 위한 정규표현식 */
var idReg = /^[a-zA-Z0-9]{10}$/;
var nameReg = /^[가-힣]{2,5}$/; //한글 2-4자
var passwdReg = /{}/ ;
var emailReg = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

