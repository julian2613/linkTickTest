package com.winkelsoft.pos.app.application.dto.category.response

import java.util.UUID

data class CategoryResponse(
    val warehouse: CategoryWarehouseResponse,
    val id: UUID,
    val name: String,
    val description: String?,
    val image: String?
)