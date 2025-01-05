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
    <title>Add Job Application | DreamTrackr</title>
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
                    <h3 class="card-title text-center">Create a Job Application Card</h3>
                    
                    <form:form action="/alumni/dashboard/jobApplication/new" method="post" modelAttribute="jobApplication">
                        <div class="mb-3">
                            <form:label path="title" cssClass="form-label" for="title">Title:</form:label>
                            <form:input path="title" id="title" class="form-control" placeholder="Enter application title" />
                            <form:errors path="title" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <form:label path="organization" cssClass="form-label" for="organization">Organization:</form:label>
                            <form:input path="organization" id="organization" class="form-control" placeholder="Enter the organization" />
                            <form:errors path="organization" cssClass="text-danger" />
                        </div>
                        
                        <div class="mb-3">
                            <form:label path="location" cssClass="form-label" for="location">Location:</form:label>
                            <form:input path="location" id="location" class="form-control" placeholder="Enter the location" />
                            <form:errors path="location" cssClass="text-danger" />
                        </div>
                        
                        <div class="mb-3">
                            <form:label path="website" cssClass="form-label" for="website">Website Link:</form:label>
                            <form:input path="website" id="website" class="form-control" placeholder="Enter the website link" />
                            <form:errors path="website" cssClass="text-danger" />
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
                            <form:textarea path="notes" id="notes" class="form-control" rows="4" placeholder="Any notes about this job application..."/>
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

    <footer>
        <div class="container">
            <p class="mb-0">&copy; 2025 AXSOS Academy. All rights reserved. | <a href="/aboutus" class="text-white">About Us</a></p>
        </div>
    </footer>
</body>
</html>
