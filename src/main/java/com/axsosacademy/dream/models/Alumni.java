package com.axsosacademy.dream.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

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

    public Alumni(String email, String password, String firstName, String lastName) {
        super(email, password, firstName, lastName);
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
}
