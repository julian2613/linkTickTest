package com.winkelsoft.pos.app.application.mapper

import com.winkelsoft.pos.app.application.dto.category.request.CategoryRequest
import com.winkelsoft.pos.app.application.dto.category.response.CategoryResponse
import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.shared.application.mapper.CrudMapper

interface CategoryMapper : CrudMapper<CategoryRequest, CategoryResponse, Category>