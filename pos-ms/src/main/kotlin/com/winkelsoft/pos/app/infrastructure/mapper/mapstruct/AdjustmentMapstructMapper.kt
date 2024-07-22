package com.winkelsoft.pos.app.infrastructure.mapper.mapstruct

import com.winkelsoft.pos.app.application.dto.adjustment.request.AdjustmentRequest
import com.winkelsoft.pos.app.application.dto.adjustment.response.AdjustmentResponse
import com.winkelsoft.pos.app.application.mapper.AdjustmentMapper
import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.shared.infrastructure.mapper.mapstruct.CrudMapstructMapper
import org.mapstruct.Mapper
import org.mapstruct.ReportingPolicy

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
interface AdjustmentMapstructMapper : CrudMapstructMapper<AdjustmentRequest, AdjustmentResponse, Adjustment>,
    AdjustmentMapper