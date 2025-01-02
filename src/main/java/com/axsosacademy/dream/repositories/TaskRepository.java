package com.axsosacademy.dream.repositories;

import com.axsosacademy.dream.models.Task;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
    List<Task> findAll();
    @Query("SELECT t FROM Task t WHERE t.owner.id = :alumniId ORDER BY t.createdAt DESC")
    List<Task> findByOwnerIdOrderByCreatedAtDesc(@Param("alumniId") Long alumniId);
}