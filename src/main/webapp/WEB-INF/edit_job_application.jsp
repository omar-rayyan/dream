<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job Application | DreamTracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <a href="/alumni/dashboard" class="btn btn-secondary mb-3">Back to Dashboard</a>
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h1 class="mb-2 mt-2">Edit Job Application</h1>
            <form method="post" action="/alumni/dashboard/jobApplication/delete/${jobApplication.id}" class="me-2">
                <button type="submit" class="btn btn-danger btn-sm">Delete Job Application</button>
            </form>
        </div>
        <form:form method="post" action="/alumni/dashboard/jobApplication/edit/${jobApplication.id}" modelAttribute="jobApplication" class="mt-4">
            <form:hidden path="id"/>
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <form:input path="title" id="title" class="form-control" value="${jobApplication.title}"/>
                <form:errors path="title" class="text-danger" />
            </div>
            <div class="mb-3">
                <label for="organization" class="form-label">Organization</label>
                <form:input path="organization" id="organization" class="form-control" value="${jobApplication.organization}"/>
                <form:errors path="organization" class="text-danger" />
            </div>
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <form:textarea path="notes" id="notes" class="form-control" rows="4" value="${jobApplication.notes}"/>
                <form:errors path="notes" class="text-danger" />
            </div>
            <form:hidden path="status" value="${jobApplication.status}"/>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</body>
</html>
