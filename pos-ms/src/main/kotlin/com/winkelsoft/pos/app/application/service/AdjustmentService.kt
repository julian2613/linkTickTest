package com.winkelsoft.pos.app.application.service

import com.winkelsoft.pos.app.application.dto.adjustment.request.AdjustmentRequest
import com.winkelsoft.pos.app.application.dto.adjustment.response.AdjustmentResponse
import com.winkelsoft.pos.app.application.mapper.AdjustmentMapper
import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.app.domain.repository.AdjustmentRepository
import com.winkelsoft.pos.shared.application.service.CrudServiceImpl
import java.util.UUID
import org.springframework.stereotype.Service

@Service
class AdjustmentService(override val mapper: AdjustmentMapper, override val repository: AdjustmentRepository) :
    CrudServiceImpl<AdjustmentRequest, AdjustmentResponse, Adjustment, UUID>()