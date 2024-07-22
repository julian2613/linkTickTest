package com.winkelsoft.pos.app.domain.repository

import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import java.util.UUID

interface WarehouseRepository : CrudRepository<Warehouse, UUID>