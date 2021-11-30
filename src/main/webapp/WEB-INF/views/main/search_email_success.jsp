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
		<h1>아이디 찾기 완료</h1>
		<label>${name }님의 아이디는 ${email }입니다.</label>
		
		<li><a href="${pageContext.request.contextPath }">로그인</a><li>
		<li><a href="${pageContext.request.contextPath }/searchpassword">비밀번호 찾기</a><li>
		
</body>
</html>