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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.AlumniPasswordForm;
import com.axsosacademy.dream.models.JobApplication;
import com.axsosacademy.dream.models.Task;
import com.axsosacademy.dream.models.User;
import com.axsosacademy.dream.services.AlumniService;
import com.axsosacademy.dream.services.JobApplicationService;
import com.axsosacademy.dream.services.TaskService;
import com.axsosacademy.dream.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AlumniController {
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	JobApplicationService jobApplicationService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AlumniService alumniService;

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
	
	@PostMapping("/alumni/dashboard/password/update/{id}")
    public String updatePassword(@ModelAttribute("passwordForm") AlumniPasswordForm passwordForm, @PathVariable Long id,
                               BindingResult result, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User userToEdit = (User) userService.findById(id);
        
        if (!userService.checkPassword(userToEdit.getId(), passwordForm.getCurrentPassword())) {
            result.rejectValue("currentPassword", "Invalid", "Current password is incorrect");
        }
        
        // Check if new password matches confirmation
        if (!passwordForm.getNewPassword().equals(passwordForm.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "Matches", "New passwords do not match");
        }
        if (passwordForm.getNewPassword().isEmpty()) {
            result.rejectValue("newPassword", "Matches", "New password is required.");
        }
        
        if (result.hasErrors()) {
            return "change_alumni_password.jsp";
        }

        // Update password
        try {
            userService.updatePassword(id, passwordForm.getNewPassword());
            alumniService.setFlagForDefaultPasswordChange(id);
            redirectAttributes.addFlashAttribute("successMessage", "Password updated successfully!");
            session.setAttribute("loggedUser", alumniService.findById(id));
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update password. Please try again.");
        }
        
        return "redirect:/alumni/dashboard";
    }
	
	@GetMapping("/alumni/dashboard/password/change")
    public String viewChangePassword(Model model, HttpSession session) {
		if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Alumni)) {
            return "redirect:/";
        }
        model.addAttribute("passwordForm", new AlumniPasswordForm());
        return "change_alumni_password.jsp";
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
