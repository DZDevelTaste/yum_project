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
</head>
<body>
	<h1>Admin jsp</h1>
	<c:set var='no' value='${fn:length(list) }' />
		<c:forEach items='${list }' var='vo' varStatus='status'>	
		<tr>
			<td>${vo.name }</td>
			<td>${vo.email }</td>
		</tr>
		</c:forEach>	
									
</body>
</html>