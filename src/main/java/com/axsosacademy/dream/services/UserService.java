package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.models.LoginUser;
import com.axsosacademy.dream.models.RegistrationForm;
import com.axsosacademy.dream.models.User;
import com.axsosacademy.dream.repositories.AdminRepository;
import com.axsosacademy.dream.repositories.AlumniRepository;
import com.axsosacademy.dream.repositories.UserRepository;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final AlumniRepository alumniRepository;
    private final AdminRepository adminRepository;

    public UserService(UserRepository userRepository, AlumniRepository alumniRepository, AdminRepository adminRepository) {
        this.userRepository = userRepository;
        this.adminRepository = adminRepository;
        this.alumniRepository = alumniRepository;
    }
    
    public User findById(Long id) {
    	Optional<User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }

    /**
     * Registers a new user (Admin or Alumni).
     * @param newUser The new user to register.
     * @param bindingResult Validation container for errors.
     * @return The saved user or null if validation fails.
     */
    public User register(RegistrationForm registrationForm, BindingResult bindingResult) {
        validateRegistration(registrationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return null;
        }

        User newUser;
        switch (registrationForm.getAccountType()) {
            case "Alumni":
                newUser = new Alumni();
                break;
            case "Admin":
                newUser = new Admin();
                break;
            default:
                return null;
        }
        
        newUser.setFirstName(registrationForm.getFirstName());
        newUser.setLastName(registrationForm.getLastName());
        newUser.setEmail(registrationForm.getEmail());

        String hashedPassword = BCrypt.hashpw(registrationForm.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedPassword);

        return userRepository.save(newUser);
    }
    
    public void validateRegistration(RegistrationForm registrationForm, BindingResult bindingResult) {
        Optional<User> existingUser = userRepository.findByEmail(registrationForm.getEmail());
        if (existingUser.isPresent()) {
            bindingResult.rejectValue("email", "EmailExists", "This email is already registered.");
        }

        if (!registrationForm.isPasswordMatch()) {
            bindingResult.rejectValue("confirm", "Matches", "Passwords do not match.");
        }
    }

    /**
     * Logs in a user (Admin or Alumni).
     * @param loginUser The login credentials.
     * @param bindingResult Validation container for errors.
     * @return The logged-in user or null if validation fails.
     */
    public User login(LoginUser loginUser, BindingResult bindingResult) {
        Optional<User> existingUser = userRepository.findByEmail(loginUser.getEmail());

        if (existingUser.isEmpty()) {
            bindingResult.rejectValue("email", "NotFound", "No account with this email was found.");
            return null;
        }

        User user = existingUser.get();

        if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
            bindingResult.rejectValue("password", "Invalid", "Incorrect password.");
        }

        if (bindingResult.hasErrors()) {
            return null;
        }

        return user;
    }
    
    public boolean checkPassword(Long userId, String currentPassword) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if (optionalUser.isEmpty()) {
            return false;
        }

        User user = optionalUser.get();
        return BCrypt.checkpw(currentPassword, user.getPassword());
    }

    public void updateUserProfile(User user) {
        Optional<User> existingUser = userRepository.findById(user.getId());
        if (existingUser.isPresent()) {
            User currentUser = existingUser.get();
            currentUser.setFirstName(user.getFirstName());
            currentUser.setLastName(user.getLastName());
            currentUser.setEmail(user.getEmail());
            
            if (currentUser instanceof Alumni) {
                alumniRepository.save((Alumni) currentUser);
            } else if (currentUser instanceof Admin) {
                adminRepository.save((Admin) currentUser);
            }
        }
    }
    
    public void updatePassword(Long userId, String newPassword) {
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
            user.setPassword(hashedPassword);
            userRepository.save(user);
        }
    }
}