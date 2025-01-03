<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Admin Profile | DreamTracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    .logo-placeholder {
        width: 200px;
        height: 60px;
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-style: italic;
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
</style>
</head>
<body>
    <nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="logo-placeholder">AXSOS Academy Logo</div>
        <div class="d-flex align-items-center">
            <a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
        </div>
    </div>
</nav>
    <div class="main-content">
        <div class="container">
            <a href="/admin/dashboard/admins" class="btn btn-secondary back-button">Back to Site Admins Dashboard</a>
            
            <div class="card">
                <div class="card-body">
                    <h2 class="page-title">Edit Admin Profile</h2>
                    
                    <form:form action="/admin/dashboard/admins/edit/${user.id}" method="post" modelAttribute="profileForm">
                        <div class="mb-4">
                            <form:label path="firstName" cssClass="form-label">First Name:</form:label>
                            <form:input path="firstName" class="form-control" value="${user.firstName}" />
                            <form:errors path="firstName" cssClass="text-danger" />
                        </div>

                        <div class="mb-4">
                            <form:label path="lastName" cssClass="form-label">Last Name:</form:label>
                            <form:input path="lastName" class="form-control" value="${user.lastName}" />
                            <form:errors path="lastName" cssClass="text-danger" />
                        </div>

                        <div class="mb-4">
                            <form:label path="email" cssClass="form-label">Email:</form:label>
                            <form:input path="email" class="form-control" value="${user.email}" />
                            <form:errors path="email" cssClass="text-danger" />
                        </div>

                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form:form>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-body">
                    <h2 class="page-title">Change Password</h2>
                    
                    <form:form action="/admin/dashboard/password/update/${user.id}" method="post" modelAttribute="passwordForm">
                        <div class="mb-4">
                            <form:label path="newPassword" cssClass="form-label">New Password:</form:label>
                            <form:password path="newPassword" class="form-control" />
                            <form:errors path="newPassword" cssClass="text-danger" />
                        </div>

                        <div class="mb-4">
                            <form:label path="confirmPassword" cssClass="form-label">Confirm New Password:</form:label>
                            <form:password path="confirmPassword" class="form-control" />
                            <form:errors path="confirmPassword" cssClass="text-danger" />
                        </div>

                        <button type="submit" class="btn btn-primary">Update Password</button>
                    </form:form>
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