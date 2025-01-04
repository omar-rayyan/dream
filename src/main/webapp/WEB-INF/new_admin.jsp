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
    <title>Add Admin | DreamTracker</title>
    <link rel="icon" href="https://i.ibb.co/3NLmf1N/image-2024-12-31-193140352.png" type="image/icon type">
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
    width: 35vh;  /* This is already set */
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
    max-height: 115%;  /* Add this to ensure image stays within height bounds */
    width: auto;       /* Let width adjust automatically */
    height: auto;      /* Let height adjust automatically */
    object-fit: contain; /* This ensures the image maintains its aspect ratio */
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
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/admin/dashboard"><div class="logo-placeholder bg-white">
            <img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
                 alt="AXSOS Academy Logo"
                 style="max-width: 100%; height: auto;">
                 <img src="/imgs/dream_logo.png"
                 alt="DreamTracker Logo"
                 style="max-width: 100%; height: auto;">
        </div></a>
            <div class="d-flex align-items-center">
                <div class="nav-buttons">
                    <a href="/admin/dashboard/admins" class="btn btn-secondary">Back to Site Admins Dashboard</a>
                </div>
                <a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center"><strong>Register A New Admin Account</strong></h3>
                    
                    <form:form action="/admin/dashboard/register" id="registrationForm" method="post" modelAttribute="newUser">
                        <div class="mb-3">
                            <form:label path="firstName" cssClass="form-label" for="registerFirstName">First Name:</form:label>
                            <form:input path="firstName" id="registerFirstName" class="form-control" placeholder="Enter your first name" />
                            <form:errors path="firstName" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="lastName" cssClass="form-label" for="registerLastName">Last Name:</form:label>
                            <form:input path="lastName" id="registerLastName" class="form-control" placeholder="Enter your last name" />
                            <form:errors path="lastName" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="email" cssClass="form-label" for="registerEmail">Email:</form:label>
                            <form:input path="email" id="registerEmail" class="form-control" placeholder="Enter your email" />
                            <form:errors path="email" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="password" cssClass="form-label" for="registerPassword">Password:</form:label>
                            <form:input path="password" id="registerPassword" type="password" class="form-control" placeholder="Enter your password" />
                            <form:errors path="password" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="confirm" cssClass="form-label" for="confirmPassword">Confirm Password:</form:label>
                            <form:input path="confirm" id="confirmPassword" type="password" class="form-control" placeholder="Confirm your password" />
                            <form:errors path="confirm" cssClass="text-danger" />
                        </div>

                        <form:hidden path="accountType" value="Admin"/>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Register</button>
                        </div>
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
