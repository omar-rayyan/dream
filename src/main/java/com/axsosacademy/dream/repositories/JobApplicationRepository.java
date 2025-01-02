package com.axsosacademy.dream.repositories;

import com.axsosacademy.dream.models.JobApplication;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobApplicationRepository extends CrudRepository<JobApplication, Long> {
    List<JobApplication> findAll();
    List<JobApplication> findByOwnerId(Long ownerId);
}