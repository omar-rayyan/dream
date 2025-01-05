package com.axsosacademy.dream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.AlumniRegistrationForm;
import com.axsosacademy.dream.models.PasswordForm;
import com.axsosacademy.dream.models.AdminRegistrationForm;
import com.axsosacademy.dream.models.Task;
import com.axsosacademy.dream.models.User;
import com.axsosacademy.dream.models.UserProfileUpdateDTO;
import com.axsosacademy.dream.services.AdminService;
import com.axsosacademy.dream.services.AlumniService;
import com.axsosacademy.dream.services.ExcelExportService;
import com.axsosacademy.dream.services.JobApplicationService;
import com.axsosacademy.dream.services.TaskService;
import com.axsosacademy.dream.services.UserService;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {
	@Autowired
	AlumniService alumniService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	JobApplicationService jobApplicationService;
	
	@Autowired
    private ExcelExportService excelExportService;
	
    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
    		return "redirect:/";
        }
    	model.addAttribute("alumnis", alumniService.findAll());
        return "admin_dashboard.jsp";
    }
    
    @GetMapping("/admin/dashboard/admins")
    public String siteAdminsManagement(HttpSession session, Model model) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
    		return "redirect:/";
        }
    	model.addAttribute("admins", adminService.findAll());
        return "site_admins_management_dashboard.jsp";
    }
    
    @GetMapping("/admin/dashboard/admins/edit/{id}")
    public String editAdmin(@PathVariable Long id, HttpSession session, Model model) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
    		return "redirect:/";
        }
    	User admin = (User) adminService.findById(id);

        UserProfileUpdateDTO profileForm = new UserProfileUpdateDTO();
        profileForm.setFirstName(admin.getFirstName());
        profileForm.setLastName(admin.getLastName());
        profileForm.setEmail(admin.getEmail());

        model.addAttribute("profileForm", profileForm);
        model.addAttribute("passwordForm", new PasswordForm());
        model.addAttribute("user", admin);
        return "edit_admin_profile.jsp";
    }
    
    @GetMapping("/admin/dashboard/alumnis/edit/{id}")
    public String editAlumni(@PathVariable Long id, HttpSession session, Model model) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
    		return "redirect:/";
        }
    	User alumni = (User) alumniService.findById(id);

        UserProfileUpdateDTO profileForm = new UserProfileUpdateDTO();
        profileForm.setFirstName(alumni.getFirstName());
        profileForm.setLastName(alumni.getLastName());
        profileForm.setEmail(alumni.getEmail());

        model.addAttribute("profileForm", profileForm);
        model.addAttribute("passwordForm", new PasswordForm());
        model.addAttribute("user", alumni);

        return "edit_alumni_profile.jsp";
    }
    
    @PostMapping("/admin/dashboard/admins/edit/{id}")
    public String updateAdminProfile(@PathVariable Long id, @Valid @ModelAttribute("profileForm") UserProfileUpdateDTO profileForm, 
                                    BindingResult result, HttpSession session, Model model) {
    	Admin originalAdmin = (Admin) adminService.findById(id);
    	if (result.hasErrors()) {
        	model.addAttribute("passwordForm", new PasswordForm());
        	model.addAttribute("user", originalAdmin);
            return "edit_admin_profile.jsp";
        }

    	originalAdmin.setFirstName(profileForm.getFirstName());
        originalAdmin.setLastName(profileForm.getLastName());
        originalAdmin.setEmail(profileForm.getEmail());
        
        try {
            userService.updateUserProfile(originalAdmin);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred while updating alumni profile.");
            return "error.jsp";
        }

        return "redirect:/admin/dashboard/admins";
    }
    
    @PostMapping("/admin/dashboard/alumnis/edit/{id}")
    public String updateAlumniProfile(@PathVariable Long id, @Valid @ModelAttribute("profileForm") UserProfileUpdateDTO profileForm, 
                                    BindingResult result, HttpSession session, Model model) {
    	Alumni originalAlumni = (Alumni) alumniService.findById(id);
    	if (result.hasErrors()) {
        	model.addAttribute("passwordForm", new PasswordForm());
        	model.addAttribute("user", originalAlumni);
            return "edit_alumni_profile.jsp";
        }

        originalAlumni.setFirstName(profileForm.getFirstName());
        originalAlumni.setLastName(profileForm.getLastName());
        originalAlumni.setEmail(profileForm.getEmail());
        
        try {
            userService.updateUserProfile(originalAlumni);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "An error occurred while updating alumni profile.");
            return "error.jsp";
        }

        return "redirect:/admin/dashboard";
    }
    
    @GetMapping("/admin/dashboard/export/{alumniId}")
    public ResponseEntity<Resource> exportJobApplications(@PathVariable Long alumniId, HttpServletRequest request) {
        try {
            // Get the alumni and their job applications
            Alumni alumni = alumniService.findById(alumniId);
            if (alumni == null) {
                return ResponseEntity.notFound().build();
            }

            // Create a temporary file
            String fileName = alumni.getFirstName() + "_" + alumni.getLastName() + "_applications.xlsx";
            Path tempFile = Files.createTempFile(null, ".xlsx");
            
            // Export to Excel
            excelExportService.exportJobApplicationsToExcel(
                new ArrayList<>(alumni.getJobApplications()), 
                tempFile.toString()
            );

            // Prepare the response
            ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(tempFile));

            return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(resource);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }
    
    @PostMapping("/admin/dashboard/tasks/add/{id}")
    public String addTask(@PathVariable Long id, HttpSession session, Model model, @RequestParam(value="description") String description) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
        Admin admin = (Admin) session.getAttribute("loggedUser");
        Alumni alumni = (Alumni) alumniService.findById(id);
        
        Task task = new Task(description, admin, alumni);
        taskService.saveTask(task);
        
        return "redirect:/admin/dashboard/alumnis/{id}";
    }
    
    @PostMapping("/admin/dashboard/password/update/{id}")
    public String updatePassword(@ModelAttribute("passwordForm") PasswordForm passwordForm, @PathVariable Long id,
                               BindingResult result, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User userToEdit = (User) userService.findById(id);
        
        // Check if new password matches confirmation
        if (!passwordForm.getNewPassword().equals(passwordForm.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "Matches", "New passwords do not match");
        }
        if (passwordForm.getNewPassword().isEmpty()) {
            result.rejectValue("newPassword", "Matches", "New password is required.");
        }
        
        if (result.hasErrors()) {
            // Repopulate the profile form
            UserProfileUpdateDTO profileForm = new UserProfileUpdateDTO();
            profileForm.setFirstName(userToEdit.getFirstName());
            profileForm.setLastName(userToEdit.getLastName());
            profileForm.setEmail(userToEdit.getEmail());
            
            model.addAttribute("profileForm", profileForm);
            model.addAttribute("user", userToEdit);
            
            // Return to the appropriate edit profile page
            if (userToEdit instanceof Alumni) {
                return "edit_alumni_profile.jsp";
            } else {
                return "edit_admin_profile.jsp";
            }
        }

        // Update password
        try {
            userService.updatePassword(id, passwordForm.getNewPassword());
            redirectAttributes.addFlashAttribute("successMessage", "Password updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update password. Please try again.");
        }
        
        return "redirect:/admin/dashboard";
    }
    
    @GetMapping("/admin/dashboard/alumnis/{id}")
    public String adminDashboardAlumniSelected(@PathVariable Long id, HttpSession session, Model model) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
    		return "redirect:/";
        }
    	model.addAttribute("alumnis", alumniService.findAll());
    	model.addAttribute("selectedAlumni", alumniService.findById(id));
    	model.addAttribute("selectedAlumniTasks", taskService.findRecentAlumniTasks(id));
    	model.addAttribute("alumniJobApplications", jobApplicationService.findAlumniJobApplications(id));
        return "admin_dashboard.jsp";
    }
    
    @GetMapping("/admin/dashboard/alumnis/add")
    public String newAlumni(Model model, HttpSession session) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
    	model.addAttribute("newUser", new AlumniRegistrationForm());
        return "new_alumni.jsp";
    }
    
    @GetMapping("/admin/dashboard/admins/add")
    public String newAdmin(Model model, HttpSession session) {
    	if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
    	model.addAttribute("newUser", new AdminRegistrationForm());
        return "new_admin.jsp";
    }
    
    @PostMapping("/admin/dashboard/admins/register")
    public String registerAdmin(@Valid @ModelAttribute("newUser") AdminRegistrationForm registrationForm, BindingResult bindingResult,
                           Model model, HttpSession session) {

        // Validate registration including password match
        userService.validateAdminRegistration(registrationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "new_admin.jsp";
        }

        userService.registerAdmin(registrationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "new_admin.jsp";
        }
        return "redirect:/admin/dashboard/admins";
    }
    
    @PostMapping("/admin/dashboard/tasks/update")
    public String updateTask(@RequestParam("taskId") Long taskId, 
                            @RequestParam(value="completed", defaultValue="false") boolean completed,
                            HttpSession session) {
        if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
        
        Task task = taskService.findById(taskId);
        if (task != null) {
            task.setCompleted(completed);
            taskService.saveTask(task);
        }
        
        return "redirect:/admin/dashboard/alumnis/" + task.getOwner().getId();
    }
    
    @PostMapping("/admin/dashboard/admins/delete/{id}")
    public String deleteAdmin(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
        adminService.deleteAdmin(id);
        
        return "redirect:/admin/dashboard/admins";
    }
    @PostMapping("/admin/dashboard/tasks/delete/{id}")
    public String deleteTask(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("loggedUser") == null || !(session.getAttribute("loggedUser") instanceof Admin)) {
            return "redirect:/";
        }
        
        Task task = taskService.findById(id);
        Long alumniId = task.getOwner().getId();
        taskService.deleteTask(id);
        
        return "redirect:/admin/dashboard/alumnis/" + alumniId;
    }
    
    @PostMapping("/admin/dashboard/register")
    public String register(@Valid @ModelAttribute("newUser") AlumniRegistrationForm registrationForm, BindingResult bindingResult,
                           Model model, HttpSession session) {

        // Validate registration including password match
        userService.validateAlumniRegistration(registrationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "new_alumni.jsp";
        }

        userService.registerAlumni(registrationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "new_alumni.jsp";
        }
        return "redirect:/admin/dashboard";
    }
    
    @PostMapping("/admin/dashboard/{id}/delete")
    public String deleteAlumni(@PathVariable Long id) {
    	alumniService.deleteAlumni(id);
        return "redirect:/admin/dashboard";
    }
}
