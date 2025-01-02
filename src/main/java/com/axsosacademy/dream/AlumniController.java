package com.axsosacademy.dream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.JobApplication;
import com.axsosacademy.dream.models.Task;
import com.axsosacademy.dream.services.JobApplicationService;
import com.axsosacademy.dream.services.TaskService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AlumniController {
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	JobApplicationService jobApplicationService;

    @GetMapping("/alumni/dashboard")
    public String alumniDashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null && session.getAttribute("loggedUser") instanceof Alumni) {
        	Alumni alumni = (Alumni) session.getAttribute("loggedUser");
        	model.addAttribute("alumniJobApplications", jobApplicationService.findAlumniJobApplications(alumni.getId()));
        	model.addAttribute("alumniTasks", taskService.findRecentAlumniTasks(alumni.getId()));
            return "alumni_dashboard.jsp";
        }
        return "redirect:/";
    }
    
    @CrossOrigin
    @PostMapping("/alumni/dashboard/jobApplication/updateStatus")
    public ResponseEntity<String> updateStatus(
            @RequestParam("applicationId") Long id,
            @RequestParam("status") String status,
            HttpSession session) {
    	
        if (session.getAttribute("loggedUser") == null || 
            !(session.getAttribute("loggedUser") instanceof Alumni)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Unauthorized");
        }

        JobApplication app = jobApplicationService.findById(id);
        if (app != null) {
            app.setStatus(status);
            jobApplicationService.saveJobApplication(app);
            return ResponseEntity.ok("Success");
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Application not found");
    }

	
	@GetMapping("/alumni/dashboard/jobApplication/new")
    public String newJobApplication(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null && session.getAttribute("loggedUser") instanceof Alumni) {
        	model.addAttribute("jobApplication", new JobApplication());
            return "new_job_application.jsp";
        }
        return "redirect:/";
    }
	
	@PostMapping("/alumni/dashboard/jobApplication/new")
    public String createJobApplication(@Valid @ModelAttribute JobApplication jobApplication, BindingResult bindingResult, HttpSession session) {
    	if (bindingResult.hasErrors()) {
            return "new_job_application.jsp";
        }
    	jobApplication.setOwner((Alumni)session.getAttribute("loggedUser"));
    	jobApplicationService.saveJobApplication(jobApplication);
        return "redirect:/alumni/dashboard";
    }
	
	@PostMapping("/alumni/dashboard/jobApplication/delete/{id}")
    public String deleteJobApplication(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Alumni)) {
            return "redirect:/";
        }
        jobApplicationService.deleteJobApplication(id);
        return "redirect:/alumni/dashboard";
    }
	
	@GetMapping("/alumni/dashboard/jobApplication/edit/{id}")
    public String viewEditJobApplication(@PathVariable Long id, Model model, HttpSession session) {
		if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Alumni)) {
            return "redirect:/";
        }
        model.addAttribute("jobApplication", jobApplicationService.findById(id));
        return "edit_job_application.jsp";
    }
	
	@PostMapping("/alumni/dashboard/jobApplication/edit/{id}")
	public String updateJobApplication(@Valid @ModelAttribute("jobApplication") JobApplication jobApplication, BindingResult result, @PathVariable Long id, HttpSession session) {
	    if (result.hasErrors()) {
	        return "edit_job_application.jsp";
	    } else {
	        jobApplication.setOwner((Alumni) session.getAttribute("loggedUser"));
	        jobApplicationService.saveJobApplication(jobApplication);
	        return "redirect:/alumni/dashboard";
	    }
	}
    
    @PostMapping("/alumni/dashboard/tasks/update")
    public String updateAlumniTask(@RequestParam("taskId") Long taskId, 
                            @RequestParam(value="completed", defaultValue="false") boolean completed,
                            HttpSession session) {
        if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Alumni)) {
            return "redirect:/";
        }
        
        Task task = taskService.findById(taskId);
        if (task != null) {
            task.setCompleted(completed);
            taskService.saveTask(task);
        }
        
        return "redirect:/alumni/dashboard";
    }
}
