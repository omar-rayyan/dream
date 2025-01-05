package com.axsosacademy.dream;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.LoginUser;
import com.axsosacademy.dream.models.User;
import com.axsosacademy.dream.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
    	if (session.getAttribute("loggedUser") != null) {
            User user = (User) session.getAttribute("loggedUser");
            if (user instanceof Admin) {
                return "redirect:/admin/dashboard";
            } else if (user instanceof Alumni) {
                return "redirect:/alumni/dashboard";
            }
        }
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @GetMapping("/home")
    public String home(HttpSession session) {
        if (session.getAttribute("loggedUser") != null) {
            User user = (User) session.getAttribute("loggedUser");
            if (user instanceof Admin) {
                return "redirect:/admin/dashboard";
            } else if (user instanceof Alumni) {
                return "redirect:/alumni/dashboard";
            }
        }
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult bindingResult,
            HttpSession session, Model model) {
        User loggedUser = userService.login(newLogin, bindingResult);

        if (bindingResult.hasErrors()) {
            return "index.jsp";
        }

        session.setAttribute("loggedUser", loggedUser);

        if (loggedUser instanceof Admin) {
            return "redirect:/admin/dashboard";
        } else if (loggedUser instanceof Alumni) {
            return "redirect:/alumni/dashboard";
        }

        return "redirect:/";
    }
    
    @GetMapping("/aboutus")
    public String aboutUs() {
        return "about_us.jsp";
    }
}
