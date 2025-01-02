<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Job Application | DreamTracker</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<div class="row g-4">
			<!-- Registration Card -->
			<div>
				<a href="/alumni/dashboard" class="btn btn-secondary mb-3">Back
					to Dashboard</a>
				<div class="card shadow-sm border-primary">
					<div class="card-body">
						<h3 class="card-title text-center text-primary">Create a Job
							Application Card</h3>
						<form:form action="/alumni/dashboard/jobApplication/new"
							method="post" modelAttribute="jobApplication">
							<div class="mb-3">
								<form:label path="title" cssClass="form-label" for="title">Title:</form:label>
								<form:input path="title" id="title" class="form-control"
									placeholder="Enter application title" />
								<form:errors path="title" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="organization" cssClass="form-label"
									for="organization">Organization:</form:label>
								<form:input path="organization" id="organization"
									class="form-control" placeholder="Enter the organization" />
								<form:errors path="organization" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<form:label path="status" cssClass="form-label" for="status">Status:</form:label>
								<div class="mb-3">
									<form:select path="status" cssClass="form-select" id="status">
										<form:option value="" disabled="true">Select a status</form:option>
										<form:option value="Applied">Applied</form:option>
										<form:option value="Interviewed">Interviewed</form:option>
										<form:option value="Offer">Offer</form:option>
										<form:option value="Accepted">Accepted</form:option>
										<form:option value="Rejected">Rejected</form:option>
									</form:select>
								</div>
								<form:errors path="status" cssClass="text-danger" />
							</div>
							<div class="mb-3">
								<label for="notes" class="form-label">Notes</label>
								<form:textarea path="notes" id="notes"
									class="form-control" rows="4" />
								<form:errors path="notes" class="text-danger" />
							</div>
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