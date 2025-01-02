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
<title>Admin Dashboard | DreamTracker</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body class="m-4">
	<div class="container-fluid">
		<div class="row">
			<!-- Left Side: Add Task Form -->
			<div class="col-md-3 border-end">
				<h3 class="text-center">Add a Task</h3>
				<c:if test="${selectedAlumni == null}">
					<div class="alert alert-info">Select an Alumni to display and
						manage their tasks.</div>
				</c:if>
				<form action="/admin/dashboard/tasks/add/${selectedAlumni.id}"
					method="post">
					<div class="mb-3">
						<label for="taskDescription" class="form-label">Task
							Description</label>
						<textarea name="description" class="form-control"
							<c:if test='${selectedAlumni == null}'> disabled</c:if>
							id="taskDescription" rows="3" required></textarea>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary"
							<c:if test='${selectedAlumni == null}'> disabled</c:if>>Add</button>
					</div>
				</form>
				<!-- Tasks Section -->
				<div class="mt-4">
					<h3 class="text-center">Tasks</h3>
					<c:forEach var="task" items="${selectedAlumniTasks}">
						<div class="card mb-3">
							<div
								class="card-body d-flex justify-content-between align-items-center">
								<div>
									<h6 class="card-title">${task.author.firstName}
										${task.author.lastName}</h6>
									<p class="card-text">${task.description}</p>
								</div>
								<div class="d-flex align-items-center">
									<form action="/admin/dashboard/tasks/update" method="post"
										class="me-2">
										<input type="hidden" name="taskId" value="${task.id}">
										<input type="checkbox" name="completed" value="true"
											<c:if test="${task.completed}">checked</c:if>
											onchange="this.form.submit()">
									</form>
									<form action="/admin/dashboard/tasks/delete/${task.id}"
										method="post">
										<button type="submit" class="btn btn-danger btn-sm">Delete</button>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:if test="${empty selectedAlumniTasks}">
						<div class="alert alert-info">No tasks to display.</div>
					</c:if>
				</div>
			</div>

			<!-- Middle Section: Dropdown and Tables -->
			<div class="col-md-6 border-end">
				<div class="mb-4">
					<div class="mb-4 d-flex align-items-center justify-content-between">
						<div class="d-flex align-items-center">
							<label for="alumniDropdown" class="form-label me-2">Select
								Alumni</label> <a href="/admin/dashboard/alumnis/add"
								class="btn btn-success me-2">Add Alumni</a>
						</div>
						<div>
							<a href="/admin/dashboard/admins" class="btn btn-primary me-2">Manage
								Site Admins</a> <a href="/logout" class="btn btn-secondary">Logout</a>
						</div>
					</div>

					<select id="alumniDropdown" class="form-select" name="alumniId"
						onchange="location.href='/admin/dashboard/alumnis/' + this.value">
						<c:if test="${selectedAlumni == null}">
							<option value="" disabled selected>Select Alumni...</option>
						</c:if>
						<c:if test="${selectedAlumni != null}">
							<option value="${selectedAlumni.id}" disabled selected>${selectedAlumni.firstName}
								${selectedAlumni.lastName}</option>
						</c:if>
						<c:forEach var="alumni" items="${alumnis}">
							<c:if
								test="${selectedAlumni == null || alumni.id != selectedAlumni.id}">
								<option value="${alumni.id}">${alumni.firstName}
									${alumni.lastName}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>

				<div class="d-flex justify-content-between">
					<c:forEach var="status"
						items="Applied,Interviewed,Offer,Accepted,Rejected">
						<table class="job-table table table-bordered">
							<thead>
								<tr>
									<th>${status}</th>
								</tr>
							</thead>
							<tbody class="sortable" data-status="${status}">
								<c:forEach var="jobApplication" items="${alumniJobApplications}">
									<c:if test="${jobApplication.status.equals(status)}">
										<tr>
											<td>
												<div class="card mb-3 draggable-card"
													data-id="${jobApplication.getStringId()}">
													<div class="card-body">
														<div class="d-flex justify-content-between">
															<h6 class="card-title">${jobApplication.title}</h6>
															<div>
																<a
																	href="/alumni/dashboard/jobApplication/edit/${jobApplication.id}"
																	class="btn btn-sm btn-primary me-2">Edit</a>
																<form action="/alumni/dashboard/jobApplication/delete/${jobApplication.id}"
																	method="post">
																	<button type="submit" class="btn btn-danger btn-sm">Delete</button>
																</form>
															</div>
														</div>
														<p class="card-text">${jobApplication.organization}</p>
														<p class="card-text">${jobApplication.notes}</p>
													</div>
												</div>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</c:forEach>
				</div>
			</div>

			<!-- Right Side: Profile Card -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Alumni Profile</h5>
						<c:if test="${selectedAlumni != null}">
							<p class="card-text">
								<strong>First Name:</strong> ${selectedAlumni.firstName}<br>
								<strong>Last Name:</strong> ${selectedAlumni.lastName}<br>
								<strong>Email:</strong> ${selectedAlumni.email}<br>
							</p>
							<div class="d-flex justify-content-between">
								<a href="/admin/dashboard/alumnis/edit/${selectedAlumni.id}"
									class="btn btn-warning">Edit Profile</a>
								<form:form action="/admin/dashboard/${selectedAlumni.id}/delete"
									method="post">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form:form>
							</div>
						</c:if>
						<c:if test="${selectedAlumni == null}">
							<div class="alert alert-info">Select an Alumni to display
								their profile.</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
