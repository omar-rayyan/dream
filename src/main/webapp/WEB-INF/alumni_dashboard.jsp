<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alumni Dashboard | DreamTracker</title>
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

        .draggable-card {
            cursor: grab;
        }

        .draggable-card:active {
            cursor: grabbing;
        }

        .sortable-ghost {
            opacity: 0.5;
        }

        .job-table td {
            min-width: 250px;
        }
        input[type="checkbox"].fancy-checkbox {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid var(--axsos-dark);
    border-radius: 5px;
    position: relative;
    cursor: pointer;
    background-color: #fff;
    transition: background-color 0.2s ease, border-color 0.2s ease;
}

input[type="checkbox"].fancy-checkbox:checked {
    background-color: var(--axsos-purple);
    border-color: var(--axsos-purple);
}

input[type="checkbox"].fancy-checkbox:checked::after {
    content: "";
    position: absolute;
    top: 3px;
    left: 3px;
    width: 10px;
    height: 10px;
    background-color: #fff;
    border-radius: 50%;
}

input[type="checkbox"].fancy-checkbox:hover {
    border-color: var(--axsos-hover);
}

input[type="checkbox"].fancy-checkbox:checked:hover {
    background-color: var(--axsos-hover);
    border-color: var(--axsos-hover);
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title text-center">Alumni Dashboard</h3>
                    
                    <div class="row">
                        <div class="col-md-2 border-end">
                            <h4 class="text-center">Tasks</h4>
                            <c:forEach var="task" items="${alumniTasks}">
                                <div class="card mb-3">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="card-title">${task.author.firstName} ${task.author.lastName}</h6>
                                            <p class="card-text">${task.description}</p>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <form action="/alumni/dashboard/tasks/update" method="post" class="me-2">
                                                <input type="hidden" name="taskId" value="${task.id}">
                                                <input type="checkbox" class="fancy-checkbox" name="completed" value="true"
    <c:if test="${task.completed}">checked</c:if>
    onchange="this.form.submit()">

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty alumniTasks}">
                                <div class="alert alert-info">No tasks to display.</div>
                            </c:if>
                        </div>

                        <div class="col-md-10">
                            <h4 class="d-flex justify-content-between align-items-center">
                                <span>Job Applications</span>
                                <div>
                                    <a href="/alumni/dashboard/jobApplication/new" class="btn btn-primary">Add Job Application</a>
                                </div>
                            </h4>

                            <div class="d-flex justify-content-between">
                                <c:forEach var="status" items="Applied,Interviewed,Offer,Accepted,Rejected">
                                    <table class="job-table table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>${status}</th>
                                            </tr>
                                        </thead>
                                        <tbody class="sortable" data-status="${status}">
                                            <c:forEach var="jobApplication" items="${alumniJobApplications}">
                                                <c:if test="${jobApplication.status.equals(status)}">
                                                    <tr>
    <td>
        <div class="card mb-3 draggable-card" data-id="${jobApplication.getStringId()}">
            <div class="card-body">
                <!-- Header section with title and action buttons -->
                <div class="d-flex justify-content-between align-items-center mb-1">
                    <h6 class="card-title mb-0"><strong>${jobApplication.title}</strong></h6>
                    
                    <div class="d-flex align-items-center">
                        <!-- Edit button -->
                        <a href="/alumni/dashboard/jobApplication/edit/${jobApplication.id}" 
                           class="btn btn-link p-0 me-3">
                            <i class="fas fa-edit text-primary"></i>
                        </a>
                        
                        <!-- Delete button -->
                        <form action="/alumni/dashboard/jobApplication/delete/${jobApplication.id}" 
                              method="post">
                            <button type="submit" class="btn btn-link p-0">
                                <i class="fas fa-trash-alt text-danger"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Job details section -->
                <div class="job-details">
                    <p class="card-text mb-2">
                        ${jobApplication.organization}
                    </p>
                    <p class="card-text mb-0">
                        ${jobApplication.notes}
                    </p>
                </div>
            </div>
        </div>
    </td>
</tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:forEach>
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

    <script>
        // Initialize Sortable for each status column
        document.querySelectorAll('.sortable').forEach(el => {
            new Sortable(el, {
                group: 'shared',
                animation: 150,
                onEnd: function(evt) {
                    const applicationId = evt.item.querySelector('.draggable-card').dataset.id;
                    const newStatus = evt.to.dataset.status;
                    updateApplicationStatus(applicationId, newStatus);
                }
            });
        });

        function updateApplicationStatus(applicationId, newStatus) {
            console.log('Updating:', applicationId, newStatus);

            if (!applicationId) {
                console.error('Application ID is missing');
                alert('Failed to update status: Application ID is missing');
                return;
            }

            // Encode the parameters
            const params = new URLSearchParams({
                applicationId: applicationId,
                status: newStatus
            });

            console.log('Payload:', params.toString());

            fetch('/alumni/dashboard/jobApplication/updateStatus', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params.toString()
            })
            .then(response => {
                console.log('Response:', response);
                if (!response.ok) {
                    throw new Error(response.statusText);
                }
                return response.text();
            })
            .then(data => {
                console.log('Data:', data);
                if (data === "Success") {
                    console.log('Update successful');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to update status');
                location.reload();
            });
        }

    </script>
</body>
</html>
