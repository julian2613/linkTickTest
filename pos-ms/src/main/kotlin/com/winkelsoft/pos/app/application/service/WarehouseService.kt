package com.winkelsoft.pos.app.application.service

import com.winkelsoft.pos.app.application.dto.warehouse.request.WarehouseRequest
import com.winkelsoft.pos.app.application.dto.warehouse.response.WarehouseResponse
import com.winkelsoft.pos.app.application.mapper.WarehouseMapper
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.app.domain.repository.WarehouseRepository
import com.winkelsoft.pos.shared.application.service.CrudServiceImpl
import java.util.UUID
import org.springframework.stereotype.Service

@Service
class WarehouseService(override val mapper: WarehouseMapper, override val repository: WarehouseRepository) :
    CrudServiceImpl<WarehouseRequest, WarehouseResponse, Warehouse, UUID>()