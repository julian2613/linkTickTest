package com.winkelsoft.pos.app.application.mapper

import com.winkelsoft.pos.app.application.dto.warehouse.request.WarehouseRequest
import com.winkelsoft.pos.app.application.dto.warehouse.response.WarehouseResponse
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.shared.application.mapper.CrudMapper

interface WarehouseMapper : CrudMapper<WarehouseRequest, WarehouseResponse, Warehouse>