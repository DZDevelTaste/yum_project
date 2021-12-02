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
</script>
</head>
<body>
		<h1>비밀번호 재설정</h1>
		<form id="join" name="join" method="post" action="${pageContext.request.contextPath}/searchpasswordsuccess/${vo.name}">
		<label>${vo.name }님 ${vo.email }</label>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="pw"
					onchange="check_pw()"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="uPassword2" id="pw2"
					onchange="check_pw()">&nbsp;<span id="check"></span></td>
			</tr>
		<input type="submit" value="비밀번호 변경">
		<li><a href="${pageContext.request.contextPath }">로그인</a><li>
		<li><a href="${pageContext.request.contextPath }/searchpassword">비밀번호 찾기</a><li>
		</form>
</body>
</html>