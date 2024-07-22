package com.winkelsoft.pos.app.application.dto.adjustment.request

import com.winkelsoft.pos.app.domain.model.adjustment.AdjustmentType
import jakarta.validation.Valid
import jakarta.validation.constraints.NotNull
import java.math.BigDecimal

class AdjustmentDetailRequest {
    @NotNull
    @Valid
    val product: AdjustmentDetailProductRequest? = null

    @NotNull
    val quantity: Int? = null

    @NotNull
    val unitCost: BigDecimal? = null

    @NotNull
    val type: AdjustmentType? = null
}