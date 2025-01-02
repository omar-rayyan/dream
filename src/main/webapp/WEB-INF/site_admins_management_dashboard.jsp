<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Site Admins Management Dashboard | DreamTracker</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>

<body>
	<div class="container mt-5">
	<a href="/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h2 class="mt-3">Site Admins</h2>
			<a href="/admin/dashboard/admins/add" class="btn btn-primary">Add
				New Admin</a>
		</div>
		<table class="table table-striped table-bordered">
			<thead class="table-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email Address</th>
					<th>Created Date</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="admin" items="${admins}">
					<tr>
						<td>${admin.firstName}</td>
						<td>${admin.lastName}</td>
						<td>${admin.email}</td>
						<td>${admin.createdAt}</td>
						<td>
							<form method="post"
								action="/admin/dashboard/admins/delete/${admin.id}" class="me-2">
								<input type="hidden" name="adminId" value="${admin.id}">
								<button type="submit" class="btn btn-danger btn-sm">Delete</button>
							</form> <a href="/admin/dashboard/admins/edit/${admin.id}"
							class="btn btn-secondary btn-sm">Edit Profile</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

</html>
