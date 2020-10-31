<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="man" value="t"/>
	<c:set var="a" value="10"/>
	<c:choose>
		<c:when test="${a==10 && man=='t'}">
			<c:out value="남성"/>
		</c:when>
		
	</c:choose>
</body>
</html>