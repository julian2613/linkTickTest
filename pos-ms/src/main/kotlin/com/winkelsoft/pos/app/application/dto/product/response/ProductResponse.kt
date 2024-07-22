package com.winkelsoft.pos.app.application.dto.product.response

import java.math.BigDecimal
import java.util.UUID

data class ProductResponse(
    val warehouse: ProductWarehouseResponse,
    val id: UUID,
    val name: String,
    val description: String?,
    val image: String?,
    val basePrice: BigDecimal,
    val categories: List<ProductCategoryResponse>?,
)