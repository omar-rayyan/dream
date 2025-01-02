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
<title>Alumni Dashboard | DreamTracker</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>

<body class="m-4">
	<div class="container-fluid">
		<div class="row">
			<!-- Tasks Section -->
			<div class="col-md-2 border-end">
				<h3 class="text-center mt-4">Tasks</h3>
				<c:forEach var="task" items="${alumniTasks}">
					<div class="card mb-3">
						<div
							class="card-body d-flex justify-content-between align-items-center">
							<div>
								<h6 class="card-title">${task.author.firstName}
									${task.author.lastName}</h6>
								<p class="card-text">${task.description}</p>
							</div>
							<div class="d-flex align-items-center">
								<form action="/alumni/dashboard/tasks/update" method="post"
									class="me-2">
									<input type="hidden" name="taskId" value="${task.id}">
									<input type="checkbox" name="completed" value="true"
										<c:if test="${task.completed}">checked</c:if>
										onchange="this.form.submit()">
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${empty alumniTasks}">
					<div class="alert alert-info">No tasks to display.</div>
				</c:if>
			</div>

			<!-- Job Applications Section -->
			<div class="col-md-10">
				<h3 class="d-flex justify-content-between align-items-center mt-4">
					<span class="text-start">Job Applications</span>
					<div>
						<a href="/logout" class="btn btn-secondary me-2">Logout</a> <a
							href="/alumni/dashboard/jobApplication/new"
							class="btn btn-primary">Add Job Application</a>
					</div>
				</h3>

				<!-- Flex Container for Tables -->
				<div class="d-flex justify-content-between">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Applied</th>
							</tr>
						</thead>
						<tbody>
							<!-- Add your dynamic content here -->
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Interviewed</th>
							</tr>
						</thead>
						<tbody>
							<!-- Add your dynamic content here -->
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Offer</th>
							</tr>
						</thead>
						<tbody>
							<!-- Add your dynamic content here -->
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Accepted</th>
							</tr>
						</thead>
						<tbody>
							<!-- Add your dynamic content here -->
						</tbody>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Rejected</th>
							</tr>
						</thead>
						<tbody>
							<!-- Add your dynamic content here -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
