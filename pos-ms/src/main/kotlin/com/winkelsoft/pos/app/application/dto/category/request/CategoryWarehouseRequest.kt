package com.winkelsoft.pos.app.application.dto.category.request

import jakarta.validation.constraints.NotNull
import java.util.UUID

class CategoryWarehouseRequest {
    @NotNull
    val id: UUID? = null
}