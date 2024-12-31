package com.axsosacademy.dream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.axsosacademy.dream.models.Alumni;

import jakarta.servlet.http.HttpSession;

@Controller
public class AlumniController {

    @GetMapping("/alumni/dashboard")
    public String alumniDashboard(HttpSession session) {
        if (session.getAttribute("loggedUser") != null && session.getAttribute("loggedUser") instanceof Alumni) {
            return "alumniDashboard.jsp";
        }
        return "redirect:/";
    }
}
