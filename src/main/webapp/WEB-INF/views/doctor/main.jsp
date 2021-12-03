<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<style>
		
		#patientList {
			border: 1px solid black;
			width:200px;
			height: 200px;
			display: block;
			float:left;
		}
		
		#patientList div{
			border: 1px solid black;
			width:80px;
			display: block;
			float:left;
		}
		
		#patientInfo {
			border: 1px solid black;
			width:200px;
			height: 200px;
			display: block;
			float:left;
		}
				
	</style>
	
	<script>
	
		var showPatientInfo = function(no){
			console.log('click! ' + no);
		}
	
	</script>

<title>Insert title here</title>
</head>
<body>
	<div id="patientList" >
		<c:forEach items="${orderList}" var="vo">
			<div>
				${vo.no }
			</div>
			<div onClick="showPatientInfo(${vo.patientNo})">
				진료대기중
			</div>
		</c:forEach>
	</div>
	<div id="patientInfo">
		
	</div>
</body>
</html>