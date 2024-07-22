package com.winkelsoft.pos.app.application.mapper

import com.winkelsoft.pos.app.application.dto.adjustment.request.AdjustmentRequest
import com.winkelsoft.pos.app.application.dto.adjustment.response.AdjustmentResponse
import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.shared.application.mapper.CrudMapper

interface AdjustmentMapper : CrudMapper<AdjustmentRequest, AdjustmentResponse, Adjustment>