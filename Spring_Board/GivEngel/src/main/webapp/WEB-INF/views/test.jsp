<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입장 확인</title>
</head>
<body>
<h1>데이터베이스 출력</h1>
<hr>
<table border="1">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">id</th>
				<th bgcolor="orange" width="150">name</th>
				<th bgcolor="orange" width="150">pw</th>
				<th bgcolor="orange" width="100">tel</th>
			</tr>
			<c:forEach items="${test }" var="userVO">
				<tr>
					<td>${userVO.user_no }</td>
					<td align="left"><a href="getBoard.do?seq=${userVO.user_no }">
							${userVO.user_id }</a></td>
					<td>${userVO.user_name }</td>
					<td>${userVO.user_pw }</td>
					<td>${userVO.user_tel }</td>
				</tr>
			</c:forEach>
		</table>


</body>
</html>