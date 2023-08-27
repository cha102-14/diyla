package com.cha102.diyla.diycate;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DiyCateRepository extends JpaRepository<DiyCateEntity, Integer> {
    // Additional custom query methods if needed
}
