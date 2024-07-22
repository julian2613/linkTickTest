package com.winkelsoft.pos.app.infrastructure.persistence.postgresql

import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.app.domain.repository.AdjustmentRepository
import com.winkelsoft.pos.shared.infrastructure.persistence.postgresql.CrudPostgresqlRepository
import java.util.UUID
import org.springframework.stereotype.Repository

@Repository
interface AdjustmentPostgresqlRepository : CrudPostgresqlRepository<Adjustment, UUID>, AdjustmentRepository
