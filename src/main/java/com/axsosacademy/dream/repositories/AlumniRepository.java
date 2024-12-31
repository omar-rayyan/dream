package com.axsosacademy.dream.repositories;

import com.axsosacademy.dream.models.Alumni;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AlumniRepository extends CrudRepository<Alumni, Long> {
    Optional<Alumni> findByEmail(String email);
}