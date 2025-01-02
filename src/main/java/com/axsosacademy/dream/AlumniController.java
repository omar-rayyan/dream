package com.axsosacademy.dream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.Task;
import com.axsosacademy.dream.services.TaskService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlumniController {
	
	@Autowired
	TaskService taskService;

    @GetMapping("/alumni/dashboard")
    public String alumniDashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedUser") != null && session.getAttribute("loggedUser") instanceof Alumni) {
        	Alumni alumni = (Alumni) session.getAttribute("loggedUser");
        	model.addAttribute("alumniTasks", taskService.findRecentAlumniTasks(alumni.getId()));
            return "alumni_dashboard.jsp";
        }
        return "redirect:/";
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
