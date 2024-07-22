package com.winkelsoft.pos.app.application.dto.product.request

import jakarta.validation.constraints.NotNull
import java.util.UUID

class ProductCategoryRequest {
    @NotNull
    val id: UUID? = null
}