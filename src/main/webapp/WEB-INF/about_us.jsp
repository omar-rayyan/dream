<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us | DreamTrackr</title>
<link rel="icon"
	href="https://i.ibb.co/3NLmf1N/image-2024-12-31-193140352.png"
	type="image/icon type">
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

body {
	background-color: var(--axsos-light-gray);
	min-height: 100vh;
	display: flex;
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

.table {
	background-color: white;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
}

.table thead {
	background-color: var(--axsos-purple);
	color: white;
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
	transition: all 0.3s ease;
}

.draggable-card:active {
	cursor: grabbing;
}

.draggable-card:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.job-table td {
	min-width: 250px;
	padding: 1rem;
}

.alert {
	border-radius: 8px;
	padding: 1rem;
}

.back-button {
	margin-bottom: 2rem;
}

.page-title {
	color: var(--axsos-purple);
	margin-bottom: 2rem;
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
</style>
</head>
<body>
	<nav class="navbar">
		<div class="container d-flex justify-content-center">
			<a href="/"><div class="logo-placeholder bg-white">
				<img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
					alt="AXSOS Academy Logo" style="max-width: 100%; height: auto;">
				<img src="/imgs/dream_logo.png" alt="DreamTracker Logo"
					style="max-width: 100%; height: auto;">
			</div></a>
		</div>
	</nav>
	<div class="main-content">
		<div class="container">
			<h1 class="page-title text-center mb-4">About DreamTrackr</h1>
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body p-4">
							<p class="lead text-center mb-4">Building Bridges Between
								Education and Career Success</p>
							<div class="about-content">
								<p>DreamTrackr is an innovative platform born from the
									collaboration between passionate Palestinian students and AXSOS
									Academy. As current students at AXSOS Academy, we developed
									this platform to strengthen the connection between our Career
									Services team and academy alumni.</p>
								<p>Our mission is to streamline the job search journey for
									AXSOS Academy graduates. DreamTrackr provides a comprehensive
									system that enables the Career Services team to effectively
									monitor and support alumni throughout their job application
									process. This platform represents our commitment to ensuring
									that every AXSOS Academy graduate receives continued support in
									their professional journey.</p>
								<p>By bridging the gap between academic achievement and
									professional success, DreamTrackr serves as a testament to the
									innovative spirit of Palestinian students and AXSOS Academy's
									dedication to student success beyond graduation.</p>
							</div>
							<div class="text-center mt-4">
								<p class="text-muted">
									<small>A project developed by Palestinian students at
										AXSOS Academy</small>
								</p>
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
</body>
</html>