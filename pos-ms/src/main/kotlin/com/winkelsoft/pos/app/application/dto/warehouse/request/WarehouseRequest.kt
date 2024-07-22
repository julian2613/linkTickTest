package com.winkelsoft.pos.app.application.dto.warehouse.request

import jakarta.validation.constraints.NotEmpty

class WarehouseRequest {
    @NotEmpty
    val name: String? = null

    val address: String? = null
}