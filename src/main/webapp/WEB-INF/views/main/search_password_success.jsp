<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kakao API</title>
</head>
<body>
		<h1>비밀번호 재설정</h1>
		<form id="join" name="join" method="post" action="${pageContext.request.contextPath}">
		<label>${name }님 ${email }</label>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="uPassword"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="text" name="re_password"></td>
		</tr>
		<tr>
		<input type="submit" value="로그인">
		<li><a href="${pageContext.request.contextPath }">로그인</a><li>
		<li><a href="${pageContext.request.contextPath }/searchpassword">비밀번호 찾기</a><li>
		</form>
</body>
</html>