package com.axsosacademy.dream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.axsosacademy.dream.models.Admin;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session) {
        if (session.getAttribute("loggedUser") != null && session.getAttribute("loggedUser") instanceof Admin) {
            return "adminDashboard.jsp";
        }
        return "redirect:/";
    }
}
