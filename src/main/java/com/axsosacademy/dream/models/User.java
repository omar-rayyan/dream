package com.axsosacademy.dream.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "users")
public abstract class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public User() {
    }

    public User(String email, String password, String firstName, String lastName) {
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
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
    
	public String getFullName() {
	    StringBuilder fullName = new StringBuilder();
	    fullName.append(firstName);
	    fullName.append(" ");
	    fullName.append(lastName);
	    return fullName.toString();
	}
}
