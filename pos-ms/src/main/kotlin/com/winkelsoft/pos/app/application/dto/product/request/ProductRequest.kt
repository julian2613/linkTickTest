package com.winkelsoft.pos.app.application.dto.product.request

import jakarta.validation.Valid
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.NotNull
import java.math.BigDecimal

class ProductRequest {
    @NotNull
    @Valid
    val warehouse: ProductWarehouseRequest? = null

    @NotEmpty
    val name: String? = null

    val description: String? = null

    val image: String? = null

    @NotNull
    val basePrice: BigDecimal? = null

    @Valid
    val categories: List<ProductCategoryRequest>? = null
}