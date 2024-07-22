package com.winkelsoft.pos.app.application.dto.adjustment.request

import jakarta.validation.constraints.NotNull
import java.util.UUID

class AdjustmentDetailProductRequest {
    @NotNull
    val id: UUID? = null
}