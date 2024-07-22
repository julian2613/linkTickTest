package com.winkelsoft.pos.app.infrastructure.controller.spring

import com.winkelsoft.pos.app.application.dto.category.request.CategoryRequest
import com.winkelsoft.pos.app.application.dto.category.response.CategoryResponse
import com.winkelsoft.pos.app.application.service.CategoryService
import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.shared.infrastructure.controller.spring.CrudControllerSpring
import java.util.UUID
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/category")
class CategorySpringController(override val service: CategoryService) :
    CrudControllerSpring<CategoryRequest, CategoryResponse, Category, UUID>()