package com.winkelsoft.pos.shared.domain.model.support

import jakarta.persistence.Column
import jakarta.persistence.Id
import jakarta.persistence.MappedSuperclass
import jakarta.persistence.PrePersist
import java.util.UUID

@MappedSuperclass
abstract class IdUuid : AuditMetadata() {
    @Id
    @Column(name = "id", nullable = false, updatable = false, length = 36)
    var id: UUID? = UUID.randomUUID()
}