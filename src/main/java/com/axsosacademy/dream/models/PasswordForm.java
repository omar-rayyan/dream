package com.axsosacademy.dream.models;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class PasswordForm {
    private String newPassword;
    private String confirmPassword;

    @NotEmpty(message = "Password is required")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters.")
    public String getNewPassword() { return newPassword; }
    public void setNewPassword(String newPassword) { this.newPassword = newPassword; }

    public String getConfirmPassword() { return confirmPassword; }
    public void setConfirmPassword(String confirmPassword) { this.confirmPassword = confirmPassword; }
}

