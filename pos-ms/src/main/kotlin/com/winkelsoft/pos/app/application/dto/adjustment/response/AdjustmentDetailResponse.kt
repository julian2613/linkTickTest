package com.winkelsoft.pos.app.application.dto.adjustment.response

import com.winkelsoft.pos.app.domain.model.adjustment.AdjustmentType
import java.math.BigDecimal
import java.util.UUID

data class AdjustmentDetailResponse(
    val id: UUID,
    val product: AdjustmentDetailProductResponse,
    val quantity: Int,
    val unitCost: BigDecimal,
    val type: AdjustmentType
)