<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>YUM</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function login() {
	var id = document.getElementById('id').value;
	var pw = document.getElementById('pw').value;
	var name = document.getElementById('name').value;
	var rrn = document.getElementById('rrn').value;
	var address_kakao = document.getElementById('address_kakao').value;
	var addressDetail = document.getElementById('addressDetail').value;
	var job = document.getElementById('job').value;
	var phone = document.getElementById('phone').value;
	var gender = document.getElementById('gender').value;
	
	if(!id){
		window.alert('아이디를 입력해주세요');
		document.getElementById('id').focus();
		return false;
	} else if(!pw){
		window.alert('비밀번호를 입력해주세요');
		document.getElementById('pw').focus();
		return false;
	} else if(!name){
		window.alert('이름를 입력해주세요');
		document.getElementById('name').focus();
		return false;
	} else if(!rrn){
		window.alert('주민등록번호를 입력해주세요');
		document.getElementById('rrn').focus();
		return false;
	} else if(!address_kakao){
		window.alert('주소를 입력해주세요');
		document.getElementById('address_kakao').focus();
		return false;
	} else if(!addressDetail){
		window.alert('상세주소를 입력해주세요');
		document.getElementById('addressDetail').focus();
		return false;;
	} else if(!job){
		window.alert('직급을 선택해주세요');
		document.getElementById('job').focus();
		return false;
	} else if(!phone){
		window.alert('전화번호를 입력해주세요');
		document.getElementById('phone').focus();
		return false;
	} else if(!gender){
		window.alert('성별을 선택해주세요');
		document.getElementById('gender').focus();
		return false;
	}
	window.alert('회원가입이 완료 되었습니다.');
	return true
};
// 비밀번호 정규화 및 확인작업
function check_pw(){
	var SC = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
    var pw = document.getElementById('pw').value;
    
    if(!SC.test(pw)) {
    	window.alert('올바른 비밀번호 형식이 아닙니다.');
    	document.getElementById('pw').value='';
    	document.getElementById('pw').focus();
    	return;
    } 
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
};
// 주민등록 번호 정규식 
function rrn_check() {
	var rrn = document.getElementById('rrn').value;
	var rrn1 = document.getElementById('rrn1').value;
	
	var re = /\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/;
	var re1 = /[1-4][0-9]{6}$/;
	
	if(!re.test(rrn)) {
		window.alert('올바른 주민등록번호 형식이 아닙니다.');
		document.getElementById('rrn').value='';
    	document.getElementById('rrn').focus();
    	return;
	}
	if(!re1.test(rrn1)) {
		window.alert('올바른 주민등록번호 형식이 아닙니다.');
		document.getElementById('rrn1').value='';
    	document.getElementById('rrn1').focus();
    	return;
	}
};
// 이메일 뒷자리 선택
function email_check(){
	var email1 = document.getElementById('id1').value;
	var email2 = document.getElementById('id2').value;
	console.log(email2);
	if(email2 == 1) {
		document.getElementById('id1').disabled = false;
		document.getElementById('id1').value='';
	} else {
		document.getElementById('id1').disabled = true;
		document.getElementById('id1').value=email2;
	}
};
// 전화번호 앞자리 선택
function phone_check() {
	var phone = document.getElementById('phone').value;
	var phone1 = document.getElementById('phone1').value;
	
	document.getElementById('phone1').value = phone;
};
// 전화번호 2번째 3번째 숫자가 아닌값을 입력하면 삭제
function onlynumberic(event) {
    event.target.value = event.target.value.replace(/[^0-9]/g, "");
};
window.onload = function(){
    document.getElementById("zonecode_kakao").addEventListener("click", function(){ // 우변번호 칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
	  			document.getElementById("zonecode_kakao").value = data.zonecode; // 우편번호 넣기
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); // 상세입력 포커싱
               
		}
        }).open();
    });
};
</script>
</head>
<body>
		<form id="join" name="join" method="post" onSubmit="return login();" action="${pageContext.request.contextPath}/join">
		  	<tr>
                <td>아이디</td>
                <td><input type="text" name ="email" id="id"></td>
            </tr>
            <tr>
                <td>@</td>
	            <input type="text" id="id1" name="email1" class="ui_input" onfucus="" />
				<td><select id="id2" name="email1" title="이메일 주소 선택" class="ui_select" onchange="email_check()">
						<option value="1">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="hanmail.net">hanmail.net</option>
				</select></td>
			</tr>
			<br>
            <tr >
                <td>비밀번호</td>
                <td><input type="password" name="password" id="pw" onchange="check_pw()"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="uPassword2" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span></td>
            </tr>
		
		<br>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<th>주민등록번호</th>
			<td><input type="text" name="rrn" id="rrn" /></td>
		</tr>
		<tr>
			<th>-</th>
			<td><input type="password" name="rrn1" id="rrn1" onchange="rrn_check()" /></td>
		</tr>
		<br>
		<tr>
			<th>직급</th>
			<td><label>간호사</label> <input type="radio" name="job" id="job" value='N' checked>
			<label>의사</label> <input type="radio" name="job" id="job" value='D'></td>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" id="phone1" value="010" disabled></td>
			<select id="phone" name="phone" title="" class="ui_select" onchange="phone_check()">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="013">013</option>
						<option value="014">014</option>
						<option value="015">015</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
			</select>
		</tr>
		<tr>
			<th>-</th>
			<td><input type="text" max="9999" maxlength="4" name="phone1" id="phone2" onkeyup="onlynumberic(event)"></td>
		</tr>
		<tr>
			<th>-</th>
			<td><input type="text" max="9999" maxlength="4" name="phone2" id="phone3" onkeyup="onlynumberic(event)"></td>
		</tr>
		<br>
		<tr>
			<th>우편번호</th>
			<td><input type="text" id="zonecode_kakao" name="zonecode" readonly /></td>
		</tr>
		<tr>
			<td><button id="zonecode_kakao">우편번호 입력</button></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" id="address_kakao" name="address" readonly /></td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td><input type="text" name="addressDetail" id="addressDetail"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><label>남</label> <input type="radio" name="gender" id="gender" value='M'checked="checked">
			<label>여</label> <input type="radio" name="gender" "gender" value='F'></td>
		</tr>
			<input type="submit" value="가입하기" id="go">
		</form>
</body>
</html>