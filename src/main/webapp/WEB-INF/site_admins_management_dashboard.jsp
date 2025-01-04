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
<link rel="icon"
	href="https://i.ibb.co/3NLmf1N/image-2024-12-31-193140352.png"
	type="image/icon type">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
:root {
	--axsos-purple: #691489;
	--axsos-light-gray: #D9D9D9;
	--axsos-dark: #3A0A4C;
	--axsos-hover: #5a0c9a;
}

body {
	background-color: var(--axsos-light-gray);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.navbar {
	background-color: var(--axsos-purple);
	height: 80px;
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

.table {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.table-dark {
	background-color: var(--axsos-dark);
	color: white;
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

.btn-danger {
	background-color: #dc3545;
	border: none;
	padding: 0.5rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-danger:hover {
	background-color: #c82333;
	transform: translateY(-1px);
}

footer {
	background-color: var(--axsos-purple);
	color: white;
	padding: 1rem 0;
	text-align: center;
	margin-top: auto;
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
.logo-placeholder {
    width: 20vh;  /* This is already set */
    height: 8vh;  /* This is already set */
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 10vh;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;  /* Add this to prevent image overflow */
    padding: 5px;     /* Add some padding */
}

.logo-placeholder img {
    max-width: 130%;
    max-height: 120%;  /* Add this to ensure image stays within height bounds */
    width: auto;       /* Let width adjust automatically */
    height: auto;      /* Let height adjust automatically */
    object-fit: contain; /* This ensures the image maintains its aspect ratio */
}
</style>
</head>

<body>
	<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="/admin/dashboard"><div class="logo-placeholder bg-white">
            <img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
                 alt="AXSOS Academy Logo"
                 style="max-width: 100%; height: auto;">
        </div></a>
        <div class="d-flex align-items-center">
            <div class="nav-buttons">
                <a href="/admin/dashboard" class="btn btn-secondary">Back to Dashboard</a>
            </div>
            <a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
        </div>
    </div>
</nav>

	<div class="main-content">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h2 class="mt-3">
					<strong>Site Admins</strong>
				</h2>
				<a href="/admin/dashboard/admins/add" class="btn btn-primary">Register
					Admin</a>
			</div>
			<table class="table table-striped table-bordered">
				<thead class="table-dark">
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email Address</th>
						<th>Created Date</th>
						<th class="text-center">Actions</th>
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
								<div class="d-flex align-items-center">
									<!-- Edit button -->
									<a href="/admin/dashboard/admins/edit/${admin.id}"
										class="btn btn-link p-0 me-3"> <i class="fas fa-edit"
										style="color: var(--axsos-purple)"></i>
									</a>

									<!-- Delete button -->
									<form method="post"
										action="/admin/dashboard/admins/delete/${admin.id}"
										class="m-0">
										<input type="hidden" name="adminId" value="${admin.id}">
										<button type="submit" class="btn btn-link p-0">
											<i class="fas fa-trash-alt text-danger"></i>
										</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<footer>
		<div class="container">
			<p class="mb-0">&copy; 2025 AXSOS Academy. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>
