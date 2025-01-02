package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.Admin;
import com.axsosacademy.dream.repositories.AdminRepository;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    private final AdminRepository adminRepository;

    public AdminService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }
    
    public void deleteAdmin(Long id) {
    	adminRepository.deleteById(id);
    	createDefaultAdmin();
    }
    
    public Admin findById(Long id) {
    	Optional<Admin> optionalAdmin = adminRepository.findById(id);
        if(optionalAdmin.isPresent()) {
            return optionalAdmin.get();
        } else {
            return null;
        }
    }

    public void createDefaultAdmin() {
        if (!adminRepository.findAll().iterator().hasNext()) {
        	String hashed_password = BCrypt.hashpw("axsosdreamadmin2024xyz", BCrypt.gensalt());
            Admin defaultAdmin = new Admin("admin@axsosacademy.com", hashed_password, "Admin", "Account");
            adminRepository.save(defaultAdmin);
        }
    }
    
    public List<Admin> findAll() {
        return adminRepository.findAll();
    }
}
