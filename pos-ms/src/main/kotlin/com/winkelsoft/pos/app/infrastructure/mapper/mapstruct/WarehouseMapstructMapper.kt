package com.winkelsoft.pos.app.infrastructure.mapper.mapstruct

import com.winkelsoft.pos.app.application.dto.warehouse.request.WarehouseRequest
import com.winkelsoft.pos.app.application.dto.warehouse.response.WarehouseResponse
import com.winkelsoft.pos.app.application.mapper.WarehouseMapper
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.shared.infrastructure.mapper.mapstruct.CrudMapstructMapper
import org.mapstruct.Mapper
import org.mapstruct.ReportingPolicy

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
interface WarehouseMapstructMapper : CrudMapstructMapper<WarehouseRequest, WarehouseResponse, Warehouse>,
    WarehouseMapper