package com.axsosacademy.dream.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "admins")
public class Admin extends User {

    public Admin() {
        super();
    }
    
    @OneToMany(mappedBy="author", fetch=FetchType.LAZY)
	private List<Task> authoredTasks;

    public Admin(String email, String password, String first_name, String last_name, String confirm) {
        super(email, password, first_name, last_name, confirm);
    }
}
