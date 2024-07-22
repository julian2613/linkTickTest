package com.winkelsoft.pos.app.application.dto.adjustment.request

import jakarta.validation.Valid
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.NotNull

class AdjustmentRequest {
    @NotNull
    @Valid
    val warehouse: AdjustmentWarehouseRequest? = null

    val observations: String? = null

    @Valid
    @NotEmpty
    val details: List<AdjustmentDetailRequest>? = null
}