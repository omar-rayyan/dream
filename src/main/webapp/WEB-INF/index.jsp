<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | DreamTracker</title>
    <link rel="icon" href="https://i.ibb.co/3NLmf1N/image-2024-12-31-193140352.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    :root {
        --axsos-purple: #691489;
        --axsos-light-gray: #D9D9D9;
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

    .login-container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem;
    }

    .login-box {
        background-color: #FFFFFF;
        padding: 2.5rem;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    .form-control {
        border: 1px solid #3A0A4C;
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
        background-color: #5a0c9a;
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
<body>
    <!-- Header -->
    <nav class="navbar">
        <div class="container d-flex justify-content-center">
            <div class="logo-placeholder bg-white">
            <img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
                 alt="AXSOS Academy Logo"
                 style="max-width: 100%; height: auto;">
        </div>
        </div>
    </nav>

    <!-- Login Container -->
    <div class="login-container">
        <div class="login-box">
            <form:form action="/login" method="post" modelAttribute="newLogin">
                <div class="mb-4">
                    <form:label path="email" cssClass="form-label" for="loginEmail"><strong>Email Address:</strong></form:label>
                    <form:input path="email" id="loginEmail" class="form-control" placeholder="Enter your email address..." />
                    <form:errors path="email" cssClass="text-danger" />
                </div>
                <div class="mb-4">
                    <form:label path="password" class="form-label" for="loginPassword"><strong>Password:</strong></form:label>
                    <form:input path="password" id="loginPassword" type="password" class="form-control" placeholder="Enter your password..." />
                    <form:errors path="password" cssClass="text-danger" />
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form:form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p class="mb-0">&copy; 2025 AXSOS Academy. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>