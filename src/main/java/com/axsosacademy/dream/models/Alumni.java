package com.axsosacademy.dream.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "alumnis")
public class Alumni extends User {

    public Alumni() {
        super();
    }
    
    @OneToMany(mappedBy="owner", fetch=FetchType.LAZY)
	private List<JobApplication> jobApplications;
    
    @OneToMany(mappedBy="owner", fetch=FetchType.LAZY)
	private List<Task> tasks;
    
    @NotEmpty(message = "Bootcamp is required.")
    @Size(min = 1, max = 40, message = "Bootcamp is required.")
    private String bootcamp;
    
    private boolean changedDefaultPassword = false;

    public Alumni(String email, String password, String firstName, String lastName, String bootcamp) {
        super(email, password, firstName, lastName);
        this.bootcamp = bootcamp;
    }

	public List<JobApplication> getJobApplications() {
		return jobApplications;
	}

	public void setJobApplications(List<JobApplication> jobApplications) {
		this.jobApplications = jobApplications;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	public boolean isChangedDefaultPassword() {
		return changedDefaultPassword;
	}

	public String getBootcamp() {
		return bootcamp;
	}

	public void setBootcamp(String bootcamp) {
		this.bootcamp = bootcamp;
	}

	public void setChangedDefaultPassword(boolean changedDefaultPassword) {
		this.changedDefaultPassword = changedDefaultPassword;
	}

}
