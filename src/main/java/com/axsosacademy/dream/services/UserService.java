package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.LoginUser;
import com.axsosacademy.dream.models.User;
import com.axsosacademy.dream.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Registers a new user (Admin or Alumni).
     * @param newUser The new user to register.
     * @param bindingResult Validation container for errors.
     * @return The saved user or null if validation fails.
     */
    public User register(User newUser, BindingResult bindingResult) {
        validateRegistration(newUser, bindingResult);

        if (bindingResult.hasErrors()) {
            return null;
        }

        String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedPassword);

        return userRepository.save(newUser);
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

    /**
     * Validates registration input.
     * @param newUser The user object to validate.
     * @param bindingResult Validation container for errors.
     */
    private void validateRegistration(User newUser, BindingResult bindingResult) {
        Optional<User> existingUser = userRepository.findByEmail(newUser.getEmail());
        if (existingUser.isPresent()) {
            bindingResult.rejectValue("email", "EmailExists", "This email is already registered.");
        }

        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            bindingResult.rejectValue("confirm", "Matches", "Passwords do not match.");
        }
    }
}