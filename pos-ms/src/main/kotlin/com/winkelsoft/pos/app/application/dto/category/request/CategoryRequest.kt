package com.winkelsoft.pos.app.application.dto.category.request

import jakarta.validation.Valid
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.NotNull

class CategoryRequest {
    @NotNull
    @Valid
    val warehouse: CategoryWarehouseRequest? = null

    @NotEmpty
    val name: String? = null

    val description: String? = null

    val image: String? = null
}