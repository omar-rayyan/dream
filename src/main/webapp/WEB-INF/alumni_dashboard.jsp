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
<script
	src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
</head>
<style>
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
	min-width: 250px;
}
</style>
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
		</div>
	</div>

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
