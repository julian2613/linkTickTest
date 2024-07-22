package com.winkelsoft.pos.app.infrastructure.controller.spring

import com.winkelsoft.pos.app.application.dto.warehouse.request.WarehouseRequest
import com.winkelsoft.pos.app.application.dto.warehouse.response.WarehouseResponse
import com.winkelsoft.pos.app.application.service.WarehouseService
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import com.winkelsoft.pos.shared.infrastructure.controller.spring.CrudControllerSpring
import java.util.UUID
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/warehouse")
class WarehouseSpringController(override val service: WarehouseService) :
    CrudControllerSpring<WarehouseRequest, WarehouseResponse, Warehouse, UUID>()