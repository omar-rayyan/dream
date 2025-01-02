<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin | DreamTracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
    	<div class="row g-4">
			<!-- Registration Card -->
			<div>
				<a href="/admin/dashboard/admins" class="btn btn-secondary mb-3">Back to Site Admins Dashboard</a>
				<div class="card shadow-sm border-primary">
					<div class="card-body">
						<h3 class="card-title text-center text-primary">Create an Admin
							Account</h3>
						<form:form action="/admin/dashboard/register" id="registrationForm" method="post"
							modelAttribute="newUser">
							<div class="mb-3">
								<form:label path="firstName" cssClass="form-label"
									for="registerFirstName">First Name:</form:label>
								<form:input path="firstName" id="registerFirstName"
									class="form-control" placeholder="Enter your first name" />
								<form:errors path="firstName" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="lastName" cssClass="form-label"
									for="registerLastName">Last Name:</form:label>
								<form:input path="lastName" id="registerLastName"
									class="form-control" placeholder="Enter your last name" />
								<form:errors path="lastName" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="email" cssClass="form-label"
									for="registerEmail">Email:</form:label>
								<form:input path="email" id="registerEmail" class="form-control"
									placeholder="Enter your email" />
								<form:errors path="email" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="password" cssClass="form-label"
									for="registerPassword">Password:</form:label>
								<form:input path="password" id="registerPassword"
									type="password" class="form-control"
									placeholder="Enter your password" />
								<form:errors path="password" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="confirm" cssClass="form-label"
									for="confirmPassword">Confirm Password:</form:label>
								<form:input path="confirm" id="confirmPassword" type="password"
									class="form-control" placeholder="Confirm your password" />
								<form:errors path="confirm" cssClass="text-danger" />
							</div>
							<form:hidden path="accountType" value="Admin"/>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form:form>

					</div>
				</div>
			</div>
    </div>
</body>
</html>