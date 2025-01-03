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
    <title>Admin Dashboard | DreamTracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
    :root {
        --axsos-purple: #691489;
        --axsos-light-gray: #D9D9D9;
        --axsos-dark: #3A0A4C;
        --axsos-hover: #5a0c9a;
    }
    .alert, .alert-info {
    background-color: #691489; /* Example Axsos color */
    color: #ffffff; /* Ensure the text is readable */
    border-color: #D9D9D9;
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
    
    .btn-primary:disabled {
	    background-color: var(--axsos-purple);
	    border-color: none;
	    font-weight: 500;
	    opacity: 0.65;
	    cursor: not-allowed;
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

    .alert {
        border-radius: 8px;
        padding: 1rem;
    }

    .select2-container--bootstrap-5 {
        width: 100% !important; /* Ensure full width */
    }

    .select2-container--bootstrap-5 .select2-selection {
        height: auto; /* Allow height to adjust */
        min-height: 38px; /* Set a minimum height */
        border: 1px solid var(--axsos-dark);
        border-radius: 0.375rem; /* Bootstrap default border radius */
        padding: 0.375rem 0.75rem; /* Bootstrap default padding */
    }

    .select2-container--bootstrap-5 .select2-selection--single .select2-selection__rendered {
        line-height: 1.5; /* Align text vertically */
        padding: 0.375rem 0.75rem; /* Match Bootstrap padding */
        color: #000; /* Text color */
    }

    .select2-container--bootstrap-5 .select2-selection--single .select2-selection__arrow {
        height: 100%; /* Ensure the arrow is vertically centered */
    }

    .select2-container--bootstrap-5 .select2-selection--single .select2-selection__placeholder {
        color: var(--axsos-dark); /* Placeholder color */
    }

    .select2-container--bootstrap-5 .select2-selection--single .select2-selection__arrow b {
        border-color: transparent transparent var(--axsos-dark) transparent; /* Arrow color */
    }
/* Fancy Checkbox Styles */
.fancy-checkbox-wrapper {
    position: relative;
    display: inline-block;
}

.fancy-checkbox {
    display: none;
}

.fancy-checkbox-label {
    display: inline-block;
    width: 22px;
    height: 22px;
    border: 2px solid var(--axsos-purple);
    border-radius: 4px;
    position: relative;
    cursor: pointer;
    transition: all 0.3s ease;
}

.fancy-checkbox-label:hover {
    border-color: var(--axsos-hover);
}

.fancy-checkbox-label:after {
    content: '';
    position: absolute;
    left: 6px;
    top: 2px;
    width: 6px;
    height: 11px;
    border: solid white;
    border-width: 0 2px 2px 0;
    transform: rotate(45deg);
    opacity: 0;
    transition: all 0.2s ease;
}

.fancy-checkbox:checked + .fancy-checkbox-label {
    background-color: var(--axsos-purple);
    border-color: var(--axsos-purple);
}

.fancy-checkbox:checked + .fancy-checkbox-label:after {
    opacity: 1;
}

.fancy-checkbox:checked + .fancy-checkbox-label:hover {
    background-color: var(--axsos-hover);
    border-color: var(--axsos-hover);
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
        <div class="container-fluid">
            <div class="row">
                <!-- Left Side: Add Task Form -->
                <div class="col -md-3 border-end">
                    <h3 class="text-center">Add a Task</h3>
                    <c:if test="${selectedAlumni == null}">
                        <div class="alert alert-info">Select an Alumni to display and manage their tasks.</div>
                    </c:if>
                    <form action="/admin/dashboard/tasks/add/${selectedAlumni.id}" method="post">
                        <div class="mb-3">
                            <label for="taskDescription" class="form-label">Task Description</label>
                            <textarea name="description" class="form-control" 
                                <c:if test='${selectedAlumni == null}'> disabled</c:if>
                                id="taskDescription" rows="3" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" 
                                <c:if test='${selectedAlumni == null}'> disabled</c:if>>Add</button>
                        </div>
                    </form>
                    <!-- Tasks Section -->
                    <div class="mt-4">
                        <h3 class="text-center">Tasks</h3>
                        <c:forEach var="task" items="${selectedAlumniTasks}">
                            <div class="card mb-3">
    <div class="card-body d-flex justify-content-between align-items-center">
        <div>
            <h6 class="card-title">${task.author.firstName} ${task.author.lastName}</h6>
            <p class="card-text mb-0">${task.description}</p>
        </div>
        
        <div class="d-flex align-items-center">
            <!-- Fancy Checkbox Form -->
            <form action="/admin/dashboard/tasks/update" method="post" class="me-3">
                <input type="hidden" name="taskId" value="${task.id}">
                <div class="fancy-checkbox-wrapper">
                    <input type="checkbox" 
                           id="checkbox-${task.id}" 
                           class="fancy-checkbox" 
                           name="completed" 
                           value="true"
                           <c:if test="${task.completed}">checked</c:if>
                           onchange="this.form.submit()">
                    <label for="checkbox-${task.id}" class="fancy-checkbox-label"></label>
                </div>
            </form>
            
            <!-- Delete Form -->
            <form action="/admin/dashboard/tasks/delete/${task.id}" method="post">
                <button type="submit" class="btn btn-link p-0">
                    <i class="fas fa-trash-alt text-danger"></i>
                </button>
            </form>
        </div>
    </div>
</div>
                        </c:forEach>
                        <c:if test="${empty selectedAlumniTasks}">
                            <div class="alert alert-info">No tasks to display.</div>
                        </c:if>
                    </div>
                </div>

                <!-- Middle Section: Dropdown and Tables -->
                <div class="col-md-6 border-end">
                    <div class="mb-4">
                        <div class="mb-4 d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center">
                                <div></div>
                            </div>
                            <div>
                                <a href="/admin/dashboard/admins" class="btn btn-primary me-2">Manage Site Admins</a>
                                <a href="/admin/dashboard/alumnis/add" class="btn btn-secondary">Add Alumni</a>
                            </div>
                        </div>

						<select id="alumniDropdown" class="form-select select2"
							name="alumniId">
							<c:if test="${selectedAlumni == null}">
								<option value="" disabled selected>Search Alumni...</option>
							</c:if>
							<c:if test="${selectedAlumni != null}">
								<option value="${selectedAlumni.id}" selected>${selectedAlumni.getFullName()}</option>
							</c:if>
							<c:forEach var="alumni" items="${alumnis}">
								<c:if
									test="${selectedAlumni == null || alumni.id != selectedAlumni.id}">
									<option value="${alumni.id}">${alumni.firstName}
										${alumni.lastName}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>

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

                <!-- Right Side: Profile Card -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Alumni Profile</h5>
                            <c:if test="${selectedAlumni != null}">
                                <p class="card-text">
                                    <strong>First Name:</strong> ${selectedAlumni.firstName}<br>
                                    <strong>Last Name:</strong> ${selectedAlumni.lastName}<br>
                                    <strong>Email:</strong> ${selectedAlumni.email}<br>
                                </p>
                                <div class="d-flex justify-content-between">
                                    <a href="/admin/dashboard/alumnis/edit/${selectedAlumni.id}" class="btn btn-primary">Edit Profile</a>
                                    <form:form action="/admin/dashboard/${selectedAlumni.id}/delete" method="post">
                                        <button type="submit" class="btn btn-secondary">Delete</button>
                                    </form:form>
                                </div>
                            </c:if>
                            <c:if test="${selectedAlumni == null}">
                                <div class="alert alert-info">Select an Alumni to display their profile.</div>
                            </c:if>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    

    <script>
        $(document).ready(function() {
            $('.select2').select2({
                theme: 'bootstrap-5',
                placeholder: 'Search Alumni...',
                allowClear: true,
                width: '100%',
            });

            $('#alumniDropdown').on('change', function() {
                const selectedValue = $(this).val();
                if (selectedValue) {
                    window.location.href = '/admin/dashboard/alumnis/' + selectedValue;
                }
            });
        });
    </script>
</body>
</html>