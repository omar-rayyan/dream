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
<title>Alumni Dashboard | DreamTracker</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
:root {
	--axsos-purple: #691489;
	--axsos-light-gray: #D9D9D9;
	--axsos-dark: #3A0A4C;
	--axsos-hover: #5a0c9a;
}

.alert-info {
	background-color: #691489; /* Example Axsos color */
	color: #ffffff; /* Ensure the text is readable */
	border-color: #D9D9D9;
}
.alert-danger {
	color: #000000;
}

body {
	background-color: var(--axsos-light-gray);
	min-height: 100vh;
	display: flex;@media (max-width: 768px) {
    .navbar h2 {
        font-size: 1.5rem;
    }
    
    .logo-placeholder {
        max-width: 150px;
    }
}

@media (max-width: 576px) {
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
	flex-direction: column;
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
@media (max-width: 768px) {
    .navbar h2 {
        font-size: 1.5rem;
    }
    
    .logo-placeholder {
        max-width: 150px;
    }
}

@media (max-width: 576px) {
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

.draggable-card {
	cursor: grab;
}

.draggable-card:active {
	cursor: grabbing;
}

.sortable-ghost {
	opacity: 0.5;
}

.job-table td {
	min-width: 150px;
	max-width: 150px;
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
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar">
		<div
			class="container position-relative d-flex justify-content-between align-items-center">
			<a href="/alumni/dashboard"><div class="logo-placeholder bg-white">
					<img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
						alt="AXSOS Academy Logo" style="max-width: 100%; height: auto;">
					<img src="/imgs/dream_logo.png" alt="DreamTracker Logo"
						style="max-width: 100%; height: auto;">
				</div></a>
			<h2
				class="text-white mb-0 position-absolute start-50 translate-middle-x">
				<strong>Alumni Dashboard</strong>
			</h2>
			<div class="d-flex align-items-center">
				<a href="/alumni/dashboard/password/change" class="btn btn-outline-light ms-3">Change Password</a>
				<a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
			</div>
		</div>
	</nav>

	<div class="main-content">
		<div class="container">
			<c:if test="${not loggedUser.changedDefaultPassword}">
				<div class="alert alert-danger">You haven't changed your default password yet, <a href="/alumni/dashboard/password/change">click here to change it.</a></div>
			</c:if>
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-3 border-end">
							<h4 class="text-center">
								<strong>Tasks</strong>
							</h4>
							<c:forEach var="task" items="${alumniTasks}">
								<div class="card mb-3">
									<div
										class="card-body d-flex justify-content-between align-items-center">
										<div>
											<h6 class="card-title">
												<strong>${task.author.firstName}
													${task.author.lastName}</strong>
											</h6>
											<p class="card-text">${task.description}</p>
										</div>
										<div class="d-flex align-items-center">
											<form action="/alumni/dashboard/tasks/update" method="post"
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
										</div>
									</div>
								</div>
							</c:forEach>
							<c:if test="${empty alumniTasks}">
								<div class="alert alert-info">No tasks to display.</div>
							</c:if>
						</div>

						<div class="col-md-9">
							<div
								class="position-relative d-flex justify-content-center align-items-center mb-3">
								<h4 class="mb-1 mt-1">
									<strong>Job Applications</strong>
								</h4>
								<div class="position-absolute end-0">
									<a href="/alumni/dashboard/jobApplication/new"
										class="btn btn-primary">Add Job Application</a>
								</div>
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

																		<div class="d-flex align-items-center">
																			<!-- Edit button -->
																			<a
																				href="/alumni/dashboard/jobApplication/edit/${jobApplication.id}"
																				class="btn btn-link p-0 me-3"> <i
																				class="fas fa-edit"
																				style="color: var(--axsos-purple)"></i>
																			</a>

																			<!-- Delete button -->
																			<form
																				action="/alumni/dashboard/jobApplication/delete/${jobApplication.id}"
																				method="post">
																				<button type="submit" class="btn btn-link p-0">
																					<i class="fas fa-trash-alt text-danger"></i>
																				</button>
																			</form>
																		</div>
																	</div>

																	<!-- Job details section -->
																	<div class="job-details">
																		<p class="card-text mb-2">
																			<strong>@</strong> ${jobApplication.organization}
																		</p>
																		<p class="card-text mb-0">${jobApplication.notes}
																		</p>
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
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<p class="mb-0">&copy; 2025 AXSOS Academy. All rights reserved.</p>
		</div>
	</footer>

	<script>
        // Initialize Sortable for each status column
        document.querySelectorAll('.sortable').forEach(el => {
            new Sortable(el, {
                group: 'shared',
                animation: 150,
                onEnd: function(evt) {
                    const applicationId = evt.item.querySelector('.draggable-card').dataset.id;
                    const newStatus = evt.to.dataset.status;
                    updateApplicationStatus(applicationId, newStatus);
                }
            });
        });

        function updateApplicationStatus(applicationId, newStatus) {
            console.log('Updating:', applicationId, newStatus);

            if (!applicationId) {
                console.error('Application ID is missing');
                alert('Failed to update status: Application ID is missing');
                return;
            }

            // Encode the parameters
            const params = new URLSearchParams({
                applicationId: applicationId,
                status: newStatus
            });

            console.log('Payload:', params.toString());

            fetch('/alumni/dashboard/jobApplication/updateStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString()
            })
            .then(response => {
                console.log('Response:', response);
                if (!response.ok) {
                    throw new Error(response.statusText);
                }
                return response.text();
            })
            .then(data => {
                console.log('Data:', data);
                if (data === "Success") {
                    console.log('Update successful');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to update status');
                location.reload();
            });
        }

    </script>
</body>
</html>