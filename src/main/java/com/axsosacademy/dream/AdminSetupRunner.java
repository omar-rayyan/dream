package com.axsosacademy.dream;

import com.axsosacademy.dream.services.AdminService;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class AdminSetupRunner implements CommandLineRunner {
    private final AdminService adminService;

    public AdminSetupRunner(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public void run(String... args) throws Exception {
        adminService.createDefaultAdmin();
    }
}
