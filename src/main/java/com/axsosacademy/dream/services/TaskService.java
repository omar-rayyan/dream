package com.axsosacademy.dream.services;

import com.axsosacademy.dream.models.Task;
import com.axsosacademy.dream.repositories.TaskRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class TaskService {
    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> findAll() {
        return taskRepository.findAll();
    }
    
    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
    
    public Task saveTask(Task task) {
        return taskRepository.save(task);
    }
    
    public List<Task> findRecentAlumniTasks(Long alumniId) {
        return taskRepository.findByOwnerIdOrderByCreatedAtDesc(alumniId);
    }
    
    public Task findById(Long id) {
    	Optional<Task> optionalTask = taskRepository.findById(id);
        if(optionalTask.isPresent()) {
            return optionalTask.get();
        } else {
            return null;
        }
    }
    
}
