<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Alumni | DreamTracker</title>
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

    footer {
        background-color: var(--axsos-purple);
        color: white;
        padding: 1rem 0;
        text-align: center;
        margin-top: auto;
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
            <a href="/admin/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>
            
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center"><strong>Register A New Alumni Account</strong></h3>
                    
                    <form:form action="/admin/dashboard/register" id="registrationForm" method="post" modelAttribute="newUser">
                        <div class="mb-3">
                            <form:label path="firstName" cssClass="form-label" for="registerFirstName">First Name:</form:label>
                            <form:input path="firstName" id="registerFirstName" class="form-control" />
                            <form:errors path="firstName" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="lastName" cssClass="form-label" for="registerLastName">Last Name:</form:label>
                            <form:input path="lastName" id="registerLastName" class="form-control" />
                            <form:errors path="lastName" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="email" cssClass="form-label" for="registerEmail">Email:</form:label>
                            <form:input path="email" id="registerEmail" class="form-control" />
                            <form:errors path="email" cssClass="text-danger" />
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Register</button>
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
