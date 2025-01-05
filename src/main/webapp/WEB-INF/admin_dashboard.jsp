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
<link rel="icon"
	href="https://i.ibb.co/3NLmf1N/image-2024-12-31-193140352.png"
	type="image/icon type">
<title>Admin Dashboard | DreamTrackr</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"
	rel="stylesheet" />
<style>
:root {
	--axsos-purple: #691489;
	--axsos-light-gray: #D9D9D9;
	--axsos-dark: #3A0A4C;
	--axsos-hover: #5a0c9a;
}

.alert, .alert-info {
	background-color: #691489; /* Example Axsos color */
	color: #ffffff; /* Ensure the text is readable */
	border-color: #D9D9D9;
}

body {
	background-color: var(--axsos-light-gray);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.navbar .nav-buttons {
	display: flex;
	gap: 1rem;
	margin-right: 1rem;
}

.navbar .btn {
	padding: 0.5rem 1rem;
	white-space: nowrap;
}

/* Ensure the logout button stands out */
.navbar .btn-outline-light {
	border-width: 2px;
}

.navbar {
	background-color: var(--axsos-purple);
	min-height: 80px;
	padding: 0.5rem 0;
}

.logo-placeholder {
	/* Remove fixed width/height */
	max-width: 250px; /* Set a maximum width */
	min-width: 120px; /* Set a minimum width */
	height: auto;
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 90px;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	padding: 0.5rem;
	padding-right: 1rem;
}

.logo-placeholder img {
	width: 100%;
	height: auto;
	max-height: 60px;
	object-fit: contain;
}

@media ( max-width : 768px) {
	.navbar h2 {
		font-size: 1.5rem;
	}
	.logo-placeholder {
		max-width: 150px;
	}
}

@media ( max-width : 576px) {
	.navbar h2 {
		font-size: 1.25rem;
	}
	.logo-placeholder {
		max-width: 120px;
	}
	.navbar .btn {
		padding: 0.375rem 0.75rem;
		font-size: 0.875rem;
	}
}

.main-content {
	flex: 1;
	padding: 2rem;
}

.card {
	background-color: #FFFFFF;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	border: none;
}

.custom-col {
	flex: 0 0 25%; /* Adjust this percentage to control the column width */
	max-width: 20%; /* Ensures the column doesn't grow larger */
}

.form-control {
	border: 1px solid var(--axsos-dark);
	padding: 0.75rem;
}

.form-control:focus {
	border-color: var(--axsos-purple);
	box-shadow: 0 0 0 0.2rem rgba(105, 20, 137, 0.25);
}

.btn-primary {
	background-color: var(--axsos-purple);
	border: none;
	padding: 0.75rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-primary:hover {
	background-color: var(--axsos-hover);
	transform: translateY(-1px);
}

.btn-primary:disabled {
	background-color: var(--axsos-purple);
	border-color: none;
	font-weight: 500;
	opacity: 0.65;
	cursor: not-allowed;
}

.btn-secondary {
	background-color: var(--axsos-dark);
	border: none;
	padding: 0.75rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-secondary:hover {
	background-color: var(--axsos-hover);
	transform: translateY(-1px);
}

footer {
	background-color: var(--axsos-purple);
	color: white;
	padding: 1rem 0;
	text-align: center;
	margin-top: auto;
}

.alert {
	border-radius: 8px;
	padding: 1rem;
}

.select2-container--bootstrap-5 {
	width: 100% !important; /* Ensure full width */
}

.select2-container--bootstrap-5 .select2-selection {
	height: auto; /* Allow height to adjust */
	min-height: 38px; /* Set a minimum height */
	border: 1px solid var(--axsos-dark);
	border-radius: 0.375rem; /* Bootstrap default border radius */
	padding: 0.375rem 0.75rem; /* Bootstrap default padding */
}

.select2-container--bootstrap-5 .select2-selection--single .select2-selection__rendered
	{
	line-height: 1.5; /* Align text vertically */
	padding: 0.375rem 0.75rem; /* Match Bootstrap padding */
	color: #000; /* Text color */
}

.select2-container--bootstrap-5 .select2-selection--single .select2-selection__arrow
	{
	height: 100%; /* Ensure the arrow is vertically centered */
}

.select2-container--bootstrap-5 .select2-selection--single .select2-selection__placeholder
	{
	color: var(--axsos-dark); /* Placeholder color */
}

.select2-container--bootstrap-5 .select2-selection--single .select2-selection__arrow b
	{
	border-color: transparent transparent var(--axsos-dark) transparent;
	/* Arrow color */
}
/* Fancy Checkbox Styles */
.fancy-checkbox-wrapper {
	position: relative;
	display: inline-block;
}

.fancy-checkbox {
	display: none;
}

.fancy-checkbox-label {
	display: inline-block;
	width: 22px;
	height: 22px;
	border: 2px solid var(--axsos-purple);
	border-radius: 4px;
	position: relative;
	cursor: pointer;
	transition: all 0.3s ease;
}

.fancy-checkbox-label:hover {
	border-color: var(--axsos-hover);
}

.fancy-checkbox-label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 2px;
	width: 6px;
	height: 11px;
	border: solid white;
	border-width: 0 2px 2px 0;
	transform: rotate(45deg);
	opacity: 0;
	transition: all 0.2s ease;
}

.fancy-checkbox:checked+.fancy-checkbox-label {
	background-color: var(--axsos-purple);
	border-color: var(--axsos-purple);
}

.fancy-checkbox:checked+.fancy-checkbox-label:after {
	opacity: 1;
}

.fancy-checkbox:checked+.fancy-checkbox-label:hover {
	background-color: var(--axsos-hover);
	border-color: var(--axsos-hover);
}

<!
DOCTYPE html> <html lang ="en "><!--Previous head content remains the same -->
	<style> /* Add these styles to your existing stylesheet */
	.modal-content {
	border-radius: 10px;
	border: none;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.modal-header {
	background-color: var(--axsos-purple);
	color: white;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	padding: 1rem;
}

.modal-title {
	font-weight: 500;
}

.modal-body {
	padding: 1.5rem;
}

.modal-footer {
	border-top: none;
	padding: 1rem;
}

.btn-cancel {
	background-color: var(--axsos-light-gray);
	color: var(--axsos-dark);
	border: none;
	padding: 0.75rem 1.5rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-cancel:hover {
	background-color: #c0c0c0;
	color: var(--axsos-dark);
}

.modal-icon {
	font-size: 2.5rem;
	color: var(--axsos-purple);
	margin-bottom: 1rem;
}
</style>
</head>

<body>
	<nav class="navbar">
		<div
			class="container d-flex justify-content-between align-items-center">
			<a href="/admin/dashboard"><div class="logo-placeholder bg-white">
					<img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
						alt="AXSOS Academy Logo" style="max-width: 100%; height: auto;">
					<img src="/imgs/dream_logo.png" alt="DreamTracker Logo"
						style="max-width: 100%; height: auto;">
				</div></a>
			<div class="d-flex align-items-center">
				<div class="nav-buttons">
					<a href="/admin/dashboard/admins" class="btn btn-secondary">Manage
						Site Admins</a> <a href="/admin/dashboard/alumnis/add"
						class="btn btn-secondary">Register Alumni</a>
				</div>
				<a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
			</div>
		</div>
	</nav>

	<div class="main-content">
		<div class="container-fluid">
			<div class="row">
				<!-- Left Side: Add Task Form -->
				<div class="border-end custom-col">
					<h3 class="text-center">
						<strong>Add a Task</strong>
					</h3>
					<c:if test="${selectedAlumni == null}">
						<div class="alert alert-info">Select an Alumni to display
							and manage their tasks.</div>
					</c:if>
					<form action="/admin/dashboard/tasks/add/${selectedAlumni.id}"
						method="post">
						<div class="mb-3">
							<label for="taskDescription" class="form-label">Task
								Description</label>
							<textarea name="description" class="form-control"
								<c:if test='${selectedAlumni == null}'> disabled</c:if>
								id="taskDescription" rows="3" required
								placeholder="Describe the task..."></textarea>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary"
								<c:if test='${selectedAlumni == null}'> disabled</c:if>>Add</button>
						</div>
					</form>
					<!-- Tasks Section -->
					<div class="mt-4">
						<h3 class="text-center">
							<strong>Tasks</strong>
						</h3>
						<c:forEach var="task" items="${selectedAlumniTasks}">
							<div class="card mb-3">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div>
										<h6 class="card-title">
											<strong>${task.author.firstName}
												${task.author.lastName}</strong>
										</h6>
										<p class="card-text mb-0">${task.description}</p>
									</div>

									<div class="d-flex align-items-center">
										<!-- Fancy Checkbox Form -->
										<form action="/admin/dashboard/tasks/update" method="post"
											class="me-3">
											<input type="hidden" name="taskId" value="${task.id}">
											<div class="fancy-checkbox-wrapper">
												<input type="checkbox" id="checkbox-${task.id}"
													class="fancy-checkbox" name="completed" value="true"
													<c:if test="${task.completed}">checked</c:if>
													onchange="this.form.submit()"> <label
													for="checkbox-${task.id}" class="fancy-checkbox-label"></label>
											</div>
										</form>

										<!-- Delete Form -->
										<form action="/admin/dashboard/tasks/delete/${task.id}"
											method="post">
											<button type="submit" class="btn btn-link p-0">
												<i class="fas fa-trash-alt text-danger"></i>
											</button>
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
				<div class="col-md-7 border-end">
					<div class="mb-4">
						<select id="alumniDropdown" class="form-select select2"
							name="alumniId">
							<c:if test="${selectedAlumni == null}">
								<option value="" disabled selected>Search Alumni...</option>
							</c:if>
							<c:if test="${selectedAlumni != null}">
								<option value="${selectedAlumni.id}" selected>${selectedAlumni.getFullName()}</option>
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
									<c:forEach var="jobApplication"
										items="${alumniJobApplications}">
										<c:if test="${jobApplication.status.equals(status)}">
											<tr>
												<td>
													<div class="card mb-3 draggable-card"
														data-id="${jobApplication.getStringId()}">
														<div class="card-body">
															<!-- Header section with title and action buttons -->
															<div
																class="d-flex justify-content-between align-items-center mb-1">
																<h6 class="card-title mb-0">
																	<strong>${jobApplication.title}</strong>
																</h6>

															</div>

															<!-- Job details section -->
															<div class="job-details">
																<p class="card-text mb-2">
																	<strong>@</strong> ${jobApplication.organization}
																</p>
																<p class="card-text mb-0">${jobApplication.notes}</p>
															</div>
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
				<div class="custom-col">
					<div class="card">
						<div class="card-body">
							<!-- Header with action buttons -->
							<div
								class="d-flex justify-content-between align-items-center mb-3">
								<h5 class="card-title mb-0">
									<strong>Alumni Profile</strong>
								</h5>
								<c:if test="${selectedAlumni != null}">
									<div class="d-flex align-items-center">
										<!-- Edit button -->
										<a href="#"
											onclick="showExportModal(${selectedAlumni.id}); return false;"
											class="btn btn-link p-0 me-1"> <i
											class="fas fa-file-excel me-2"
											style="color: var(--axsos-purple)"></i>
										</a> <a href="/admin/dashboard/alumnis/edit/${selectedAlumni.id}"
											class="btn btn-link p-0 me-3"> <i class="fas fa-edit"
											style="color: var(--axsos-purple)"></i>
										</a>

										<!-- Delete button -->
										<form:form
											action="/admin/dashboard/${selectedAlumni.id}/delete"
											method="post" class="m-0">
											<button type="submit" class="btn btn-link p-0">
												<i class="fas fa-trash-alt text-danger"></i>
											</button>
										</form:form>
									</div>
								</c:if>
							</div>

							<!-- Profile Content -->
							<c:if test="${selectedAlumni != null}">
								<div class="profile-details">
									<p class="card-text">
										<strong>First Name:</strong> ${selectedAlumni.firstName}<br>
										<strong>Last Name:</strong> ${selectedAlumni.lastName}<br>
										<strong>Email:</strong> ${selectedAlumni.email}<br> <br>
										<strong>Bootcamp:</strong> ${selectedAlumni.bootcamp}<br>
										<strong>Job Applications:</strong>
										${selectedAlumni.jobApplications.size()}<br> <strong>Tasks:</strong>
										${selectedAlumni.tasks.size()}<br>
									</p>
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
	</div>

	<footer>
		<div class="container">
			<p class="mb-0">
				&copy; 2025 AXSOS Academy. All rights reserved. | <a href="/aboutus"
					class="text-white">About Us</a>
			</p>
		</div>
	</footer>
	<div class="modal fade" id="exportModal" tabindex="-1"
		aria-labelledby="exportModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exportModalLabel">Export to Excel</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="modal-icon">
						<i class="fas fa-file-excel"></i>
					</div>
					<p>Are you sure you want to export this alumni's data to Excel?</p>
					<p class="text-muted">This will download all related data
						including job applications and tasks.</p>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-cancel"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="confirmExportBtn">Export
						Data</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


	<script>
	function confirmExport(alumniId) {
	    if (confirm("Are you sure you want to export this alumni's data to Excel?")) {
	        window.location.href = '/admin/dashboard/export/' + alumniId;
	    }
	}
	let currentAlumniId = null;

	function showExportModal(alumniId) {
	    currentAlumniId = alumniId;
	    const modal = new bootstrap.Modal(document.getElementById('exportModal'));
	    modal.show();
	}

	document.getElementById('confirmExportBtn').addEventListener('click', function() {
	    if (currentAlumniId) {
	        window.location.href = '/admin/dashboard/export/' + currentAlumniId;
	    }
	});
		$(document)
				.ready(
						
						function() {
							$('.select2').select2({
								theme : 'bootstrap-5',
								placeholder : 'Search Alumni...',
								allowClear : true,
								width : '100%',
							});

							$('#alumniDropdown')
									.on(
											'change',
											function() {
												const selectedValue = $(this)
														.val();
												if (selectedValue) {
													window.location.href = '/admin/dashboard/alumnis/'
															+ selectedValue;
												}
											});
						});
	</script>
</body>
</html>