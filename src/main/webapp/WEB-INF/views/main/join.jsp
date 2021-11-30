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
<script type="text/javascript">
function check_pw(){
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%","^","&","*","(",")","_","+"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length > 16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('특수문자가 비밀번호에 포함되어 있지 않습니다.')
        document.getElementById('pw').value='';
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
}
	</script>
</head>
<body>
		<form id="join" name="join" method="post" action="${pageContext.request.contextPath}/join">
		  <tr>
                <td>아이디</td>
                <td><input type="text" name ="uEmail" id="id"></td>
            </tr>
            <tr >
                <td>비밀번호</td>
                <td><input type="password" name="uPassword" id="pw" onchange="check_pw()"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="uPassword2" id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span></td>
            </tr>
		
		<br>
		<tr>
			<th>이름</th>
			<td><input type="text" name="uName"></td>
		</tr>
		<tr>
			<th>주민등록번호</th>
			<td><input type="text" name="uRrn"></td>
		</tr>
			<th>직급</th>
			<td><label>간호사</label> <input type="radio" name=uJob" value="N" checked="checked">
			<label>의사</label> <input type="radio" name="uJob" value="D"></td>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="uPhone"></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" id="zonecode_kakao" name="zonecode" readonly /></td>
		</tr>
		<tr>
			<td><button id='btn'>우편번호 입력</button></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" id="address_kakao" name="address" readonly /></td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td><input type="text" name="address_detail" /></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><label>남</label> <input type="radio" name="uGender" value="male"	checked="checked">
			<label>여</label> <input type="radio" name="uGender" value="female"></td>
		</tr>
			<input type="submit" value="가입하기" id="go">
		</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("btn").addEventListener("click", function(){ // 주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
	  			document.getElementById("zonecode_kakao").value = data.zonecode; // 우편번호 넣기
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); // 상세입력 포커싱
		}
        }).open();
    });
}
</script>
</html>