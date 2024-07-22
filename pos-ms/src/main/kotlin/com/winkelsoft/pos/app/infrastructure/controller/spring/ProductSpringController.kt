package com.winkelsoft.pos.app.infrastructure.controller.spring

import com.winkelsoft.pos.app.application.dto.product.request.ProductRequest
import com.winkelsoft.pos.app.application.dto.product.response.ProductResponse
import com.winkelsoft.pos.app.application.service.ProductService
import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.infrastructure.controller.spring.CrudControllerSpring
import java.util.UUID
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/product")
class ProductSpringController(override val service: ProductService) :
    CrudControllerSpring<ProductRequest, ProductResponse, Product, UUID>()