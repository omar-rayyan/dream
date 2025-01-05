package com.axsosacademy.dream.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class AdminRegistrationForm {

    @NotEmpty(message = "First name is required.")
    @Size(min = 3, max = 30, message = "First name must be between 3 and 30 characters.")
    private String firstName;

    @NotEmpty(message = "Last name is required.")
    @Size(min = 3, max = 30, message = "Last name must be between 3 and 30 characters.")
    private String lastName;

    @NotEmpty(message = "Email is required.")
    @Email(message = "The email address you've entered is invalid.")
    private String email;

    @NotEmpty(message = "Password is required")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters.")
    private String password;

    @NotEmpty(message = "Password confirmation is required.")
    private String confirm;

    private String accountType;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

	public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public boolean isPasswordMatch() {
        return password != null && password.equals(confirm);
    }
    
    
}
