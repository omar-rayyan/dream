package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.Alumni;
import com.axsosacademy.dream.repositories.AlumniRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class AlumniService {
    private final AlumniRepository alumniRepository;

    public AlumniService(AlumniRepository alumniRepository) {
        this.alumniRepository = alumniRepository;
    }

    public List<Alumni> findAll() {
        return alumniRepository.findAll();
    }
    
    public void deleteAlumni(Long id) {
        alumniRepository.deleteById(id);
    }
    
    public Alumni findById(Long id) {
    	Optional<Alumni> optionalAlumni = alumniRepository.findById(id);
        if(optionalAlumni.isPresent()) {
            return optionalAlumni.get();
        } else {
            return null;
        }
    }
    
}
