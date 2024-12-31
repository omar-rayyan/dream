package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.repositories.AdminRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    private final AdminRepository adminRepository;

    public AdminService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    public void createDefaultAdmin() {
        if (!adminRepository.findAll().iterator().hasNext()) {
        	String hashed_password = BCrypt.hashpw("axsosdreamadmin2024xyz", BCrypt.gensalt());
            Admin defaultAdmin = new Admin("admin@axsosacademy.com", hashed_password, "Admin", "Account", hashed_password);
            adminRepository.save(defaultAdmin);
        }
    }
}
