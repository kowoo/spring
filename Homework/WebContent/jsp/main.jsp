<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>
<body>
	${userid}님 환영ㅋ
	<input type="button" value="로그아웃" onclick="location.href='logout'">
	
	<ul>
		<c:forEach items="${memberList}" var="m">
			<li>
				<a href="message?receiver=${m.NAME}">${m.NAME}</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>