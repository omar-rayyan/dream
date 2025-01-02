package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.JobApplication;
import com.axsosacademy.dream.repositories.JobApplicationRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class JobApplicationService {
    private final JobApplicationRepository jobApplicationRepository;

    public JobApplicationService(JobApplicationRepository jobApplicationRepository) {
        this.jobApplicationRepository = jobApplicationRepository;
    }

    public List<JobApplication> findAll() {
        return jobApplicationRepository.findAll();
    }
    
    public void deleteJobApplication(Long id) {
    	jobApplicationRepository.deleteById(id);
    }
    
    public JobApplication saveJobApplication(JobApplication jobApplication) {
        return jobApplicationRepository.save(jobApplication);
    }
    
    public List<JobApplication> findAlumniJobApplications(Long alumniId) {
        return jobApplicationRepository.findByOwnerId(alumniId);
    }
    
    public JobApplication findById(Long id) {
    	Optional<JobApplication> optionalJobApplication = jobApplicationRepository.findById(id);
        if(optionalJobApplication.isPresent()) {
            return optionalJobApplication.get();
        } else {
            return null;
        }
    }
    
}
