package com.winkelsoft.pos.app.domain.repository

import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import java.util.UUID

interface AdjustmentRepository : CrudRepository<Adjustment, UUID>