package com.axsosacademy.dream.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "job_applications")
public class JobApplication {
	 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Application title is required.")
    @Size(min = 3, max = 40, message = "Application title must be between 3 and 40 characters.")
    private String title;
    
    @NotEmpty(message = "Organization is required.")
    @Size(min = 1, max = 30, message = "Organization required.")
    private String organization;
    
    @NotEmpty(message = "Location is required.")
    @Size(min = 1, max = 30, message = "Location required.")
    private String location;
    
    private String website;
    
    @Column(columnDefinition = "TEXT")
    private String notes;
    
    @NotEmpty(message = "Application status is required.")
    @Size(min = 1, max = 40, message = "Application status is required.")
    private String status;
    
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="alumni_id")
    private Alumni owner;
    
    
    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
    
    public JobApplication() {}
    

	public JobApplication(String title, String organization, String notes, String status, Alumni owner, String location, String website) {
		this.title = title;
		this.organization = organization;
		this.notes = notes;
		this.status = status;
		this.owner = owner;
		this.location = location;
		this.website = website;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	
	public String getStringId() {
		return id.toString();
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Alumni getOwner() {
		return owner;
	}

	public void setOwner(Alumni owner) {
		this.owner = owner;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

}