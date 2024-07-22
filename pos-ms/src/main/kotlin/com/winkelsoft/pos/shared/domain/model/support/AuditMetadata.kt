package com.winkelsoft.pos.shared.domain.model.support

import jakarta.persistence.Column
import jakarta.persistence.MappedSuperclass
import jakarta.persistence.PrePersist
import jakarta.persistence.PreUpdate
import java.time.Instant

@MappedSuperclass
abstract class AuditMetadata {
    @Column(name = "created_at", nullable = false, updatable = false)
    var createdAt: Instant? = Instant.now()

    @Column(name = "updated_at", nullable = false)
    var updatedAt: Instant? = Instant.now()

    @PreUpdate
    fun preUpdate() {
        this.updatedAt = Instant.now()
    }
}