package com.winkelsoft.pos.app.application.dto.adjustment.response

data class AdjustmentResponse(
    val warehouse: AdjustmentWarehouseResponse, val observations: String?, val details: List<AdjustmentDetailResponse>
)