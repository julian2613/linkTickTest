package com.winkelsoft.pos.app.infrastructure.persistence.postgresql

import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.app.domain.repository.WarehouseRepository
import com.winkelsoft.pos.shared.infrastructure.persistence.postgresql.CrudPostgresqlRepository
import java.util.UUID
import org.springframework.stereotype.Repository

@Repository
interface WarehousePostgresqlRepository : CrudPostgresqlRepository<Warehouse, UUID>, WarehouseRepository