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
</script>
</head>
<body>
		<h1>아이디 찾기</h1>
		<form id="join" name="join" method="post" action="${pageContext.request.contextPath }/searchemailsuccess">
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
		<input type="submit" value="아이디 찾기">
		<li><a href="${pageContext.request.contextPath }">로그인</a><li>
		<li><a href="${pageContext.request.contextPath }/searchpassword">비밀번호 찾기</a><li>
		</form>
</body>
</html>