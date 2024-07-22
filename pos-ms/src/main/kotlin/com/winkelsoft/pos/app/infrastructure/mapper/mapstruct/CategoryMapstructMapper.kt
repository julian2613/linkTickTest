package com.winkelsoft.pos.app.infrastructure.mapper.mapstruct

import com.winkelsoft.pos.app.application.dto.category.request.CategoryRequest
import com.winkelsoft.pos.app.application.dto.category.response.CategoryResponse
import com.winkelsoft.pos.app.application.mapper.CategoryMapper
import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.shared.infrastructure.mapper.mapstruct.CrudMapstructMapper
import org.mapstruct.Mapper
import org.mapstruct.ReportingPolicy

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
interface CategoryMapstructMapper : CrudMapstructMapper<CategoryRequest, CategoryResponse, Category>, CategoryMapper