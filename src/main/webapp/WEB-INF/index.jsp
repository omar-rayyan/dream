<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | DreamTracker</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
body {
	background-color: #D9D9D9;
}

.navbar {
	background-color: #691489;
	height: 60px;
}

.login-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: calc(100vh - 60px);
}

.login-box {
	background-color: #FFFFFF;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px; /* Adjusted width */
}

.form-control {
	border: 1px solid #3A0A4C;
}

.btn-primary {
	background-color: #691489;
	border: none;
}

.btn-primary:hover {
	background-color: #5a0c9a;
}

.forgot-password {
	color: #691489;
}
</style>
<body>
	<nav class="navbar"></nav>
	<div class="login-container">
		<div class="login-box">
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="mb-3">
					<form:label path="email" cssClass="form-label" for="loginEmail">Email:</form:label>
					<form:input path="email" id="loginEmail" class="form-control"
						placeholder="Enter your email" />
					<form:errors path="email" cssClass="text-danger" />
				</div>
				<div class="mb-3">
					<form:label path="password" class="form-label" for="loginPassword">Password:</form:label>
					<form:input path="password" id="loginPassword" type="password"
						class="form-control" placeholder="Enter your password" />
					<form:errors path="password" cssClass="text-danger" />
				</div>
				<button type="submit" class="btn btn-primary w-100">Sign In</button>
			</form:form>
		</div>
	</div>
</body>
</html>