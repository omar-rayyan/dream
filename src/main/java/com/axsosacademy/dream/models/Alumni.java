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
	private List<JobApplication> job_applications;
    
    @OneToMany(mappedBy="owner", fetch=FetchType.LAZY)
	private List<Task> tasks;

    public Alumni(String email, String password, String firstName, String lastName, String confirm) {
        super(email, password, firstName, lastName, confirm);
    }
}
