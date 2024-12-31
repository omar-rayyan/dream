package com.axsosacademy.dream.repositories;

import com.axsosacademy.dream.models.Admin;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Long> {
    Optional<Admin> findByEmail(String email);
}