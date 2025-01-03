package com.axsosacademy.dream.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "tasks")
public class Task {
	 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message = "Task description is required.")
    @Column(columnDefinition = "TEXT")
    private String description;
    
    private boolean completed = false;
    
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="alumni_id")
    private Alumni owner;
    
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="admin_id")
    private Admin author;
    
    
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
    
    public Task() {}
    

	public Task(String description, Admin author, Alumni owner) {
		this.description = description;
		this.author = author;
		this.owner = owner;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Alumni getOwner() {
		return owner;
	}

	public void setOwner(Alumni owner) {
		this.owner = owner;
	}

	public Admin getAuthor() {
		return author;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public void setAuthor(Admin author) {
		this.author = author;
	}
	
	

}