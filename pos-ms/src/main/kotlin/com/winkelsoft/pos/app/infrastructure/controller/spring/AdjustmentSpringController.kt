package com.winkelsoft.pos.app.infrastructure.controller.spring

import com.winkelsoft.pos.app.application.dto.adjustment.request.AdjustmentRequest
import com.winkelsoft.pos.app.application.dto.adjustment.response.AdjustmentResponse
import com.winkelsoft.pos.app.application.service.AdjustmentService
import com.winkelsoft.pos.app.domain.model.adjustment.Adjustment
import com.winkelsoft.pos.shared.infrastructure.controller.spring.CrudControllerSpring
import java.util.UUID
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/adjustment")
class AdjustmentSpringController(override val service: AdjustmentService) :
    CrudControllerSpring<AdjustmentRequest, AdjustmentResponse, Adjustment, UUID>()