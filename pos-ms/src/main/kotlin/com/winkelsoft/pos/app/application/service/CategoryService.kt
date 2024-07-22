package com.winkelsoft.pos.app.application.service

import com.winkelsoft.pos.app.application.dto.category.request.CategoryRequest
import com.winkelsoft.pos.app.application.dto.category.response.CategoryResponse
import com.winkelsoft.pos.app.application.mapper.CategoryMapper
import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.app.domain.repository.CategoryRepository
import com.winkelsoft.pos.shared.application.service.CrudServiceImpl
import com.winkelsoft.pos.shared.application.service.support.FileService
import com.winkelsoft.pos.shared.application.service.support.FileService.Companion.CATEGORY_PATH
import java.util.UUID
import kotlin.jvm.optionals.getOrNull
import org.springframework.stereotype.Service

@Service
class CategoryService(
    override val mapper: CategoryMapper,
    override val repository: CategoryRepository,
    private val fileService: FileService
) : CrudServiceImpl<CategoryRequest, CategoryResponse, Category, UUID>() {

    override fun save(request: CategoryRequest): CategoryResponse {
        val entity = this.mapper.dtoToModel(request)
        if (!entity.image.isNullOrEmpty()) {
            entity.image = this.fileService.upload(entity.id.toString(), entity.image!!, CATEGORY_PATH)
        }
        val savedEntity = this.repository.save(entity)
        return this.mapper.modelToDto(savedEntity)
    }

    override fun update(id: UUID, request: CategoryRequest): CategoryResponse? =
        this.repository.findById(id).getOrNull()?.let { entity ->
            this.mapper.merge(request, entity)
            if (!entity.image.isNullOrEmpty()) {
                entity.image = this.fileService.upload(entity.id.toString(), entity.image!!, CATEGORY_PATH)
            }
            this.mapper.modelToDto(this.repository.save(entity))
        }

    override fun delete(id: UUID) {
        this.fileService.delete(id.toString())
        this.repository.deleteById(id)
    }
}