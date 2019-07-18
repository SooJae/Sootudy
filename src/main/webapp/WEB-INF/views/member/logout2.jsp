<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Logout Page</h1>


<form method='post' action="/logout">
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
  <button>로그아웃</button>
  </form>

<%-- <form method="post" action="/login">
	<div>
		<input type="text" name="username" value="admin">
	</div>
	<div>
		<input type="password" name="password" value="admin">
	</div>
	<button type="submit">버튼</button>
	<input type="hidden" name="{_csrf.parameterName}" value="${_csrf.token }"/>
</form> --%>

</body>
</html>