<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job Application | DreamTracker</title>
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
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/alumni/dashboard"><div class="logo-placeholder bg-white">
            <img src="https://i.ibb.co/kSSZV8j/image-2024-12-31-123153782.png"
                 alt="AXSOS Academy Logo"
                 style="max-width: 100%; height: auto;">
                 <img src="/imgs/dream_logo.png"
                 alt="DreamTracker Logo"
                 style="max-width: 100%; height: auto;">
        </div></a>
            <div class="d-flex align-items-center">
                <div class="nav-buttons">
                    <a href="/alumni/dashboard" class="btn btn-secondary">Back to Dashboard</a>
                </div>
                <a href="/logout" class="btn btn-outline-light ms-3">Logout</a>
            </div>
        </div>
    </nav>
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="page-title mb-0">Edit Job Application</h2>
                        <form method="post" action="/alumni/dashboard/jobApplication/delete/${jobApplication.id}">
                            <button type="submit" class="btn btn-danger">Delete Job Application</button>
                        </form>
                    </div>
                    
                    <form:form method="post" action="/alumni/dashboard/jobApplication/edit/${jobApplication.id}" modelAttribute="jobApplication">
                        <form:hidden path="id"/>
                        
                        <div class="mb-4">
                            <label for="title" class="form-label">Title</label>
                            <form:input path="title" class="form-control" value="${jobApplication.title}"/>
                            <form:errors path="title" cssClass="text-danger" />
                        </div>

                        <div class="mb-4">
                            <label for="organization" class="form-label">Organization</label>
                            <form:input path="organization" class="form-control" value="${jobApplication.organization}"/>
                            <form:errors path="organization" cssClass="text-danger" />
                        </div>

                        <div class="mb-4">
                            <label for="notes" class="form-label">Notes</label>
                            <form:textarea path="notes" class="form-control" rows="4" value="${jobApplication.notes}"/>
                            <form:errors path="notes" cssClass="text-danger" />
                        </div>

                        <form:hidden path="status" value="${jobApplication.status}"/>
                        
                        <button type="submit" class="btn btn-primary">Save Changes</button>
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