<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Alumni Profile | DreamTracker</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<!-- Back to Dashboard Link -->
		<a href="/admin/dashboard/alumnis/${user.id}" class="btn btn-secondary mb-3">Back to Dashboard</a>

		<!-- Edit Profile Section -->
		<h1>Edit Alumni Profile</h1>
		<form:form action="/admin/dashboard/alumnis/edit/${user.id}" id="editProfileForm" method="post" modelAttribute="profileForm">
			<div class="mb-3">
				<form:label path="firstName" cssClass="form-label">First Name:</form:label>
				<form:input path="firstName" class="form-control" value="${user.firstName}" placeholder="Enter first name" />
				<form:errors path="firstName" cssClass="text-danger" />
			</div>

			<div class="mb-3">
				<form:label path="lastName" cssClass="form-label">Last Name:</form:label>
				<form:input path="lastName" class="form-control" value="${user.lastName}" placeholder="Enter last name" />
				<form:errors path="lastName" cssClass="text-danger" />
			</div>

			<div class="mb-3">
				<form:label path="email" cssClass="form-label">Email:</form:label>
				<form:input path="email" class="form-control" value="${user.email}" placeholder="Enter email" />
				<form:errors path="email" cssClass="text-danger" />
			</div>
			<button type="submit" class="btn btn-primary">Save Changes</button>
		</form:form>
	</div>

	<!-- Change Password Section -->
	<div class="container mt-5">
		<h2>Change Password</h2>
		<form:form action="/admin/dashboard/password/update/${user.id}" method="post" modelAttribute="passwordForm">
			<div class="mb-3">
				<form:label path="newPassword" cssClass="form-label">New Password:</form:label>
				<form:password path="newPassword" class="form-control" />
				<form:errors path="newPassword" cssClass="text-danger" />
			</div>
			<div class="mb-3">
				<form:label path="confirmPassword" cssClass="form-label">Confirm New Password:</form:label>
				<form:password path="confirmPassword" class="form-control" />
				<form:errors path="confirmPassword" cssClass="text-danger" />
			</div>
			<button type="submit" class="btn btn-primary">Update Password</button>
		</form:form>
	</div>

	<!-- Success/Error Messages -->
	<c:if test="${not empty successMessage}">
		<div class="alert alert-success mt-3">${successMessage}</div>
	</c:if>
	<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger mt-3">${errorMessage}</div>
	</c:if>

	<!-- Bootstrap JS (optional) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
