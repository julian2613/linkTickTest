package com.winkelsoft.pos.app.application.service

import com.winkelsoft.pos.app.application.dto.product.request.ProductRequest
import com.winkelsoft.pos.app.application.dto.product.response.ProductResponse
import com.winkelsoft.pos.app.application.mapper.ProductMapper
import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.app.domain.repository.ProductRepository
import com.winkelsoft.pos.shared.application.service.CrudServiceImpl
import com.winkelsoft.pos.shared.application.service.support.FileService
import com.winkelsoft.pos.shared.application.service.support.FileService.Companion.PRODUCT_PATH
import java.util.UUID
import kotlin.jvm.optionals.getOrNull
import org.springframework.stereotype.Service

@Service
class ProductService(
    override val mapper: ProductMapper, override val repository: ProductRepository, private val fileService: FileService
) : CrudServiceImpl<ProductRequest, ProductResponse, Product, UUID>() {
    override fun save(request: ProductRequest): ProductResponse {
        val entity = this.mapper.dtoToModel(request)
        if (!entity.image.isNullOrEmpty()) {
            entity.image = this.fileService.upload(entity.id.toString(), entity.image!!, PRODUCT_PATH)
        }
        return this.mapper.modelToDto(this.repository.save(entity))
    }

    override fun update(id: UUID, request: ProductRequest): ProductResponse? =
        this.repository.findById(id).getOrNull()?.let { entity ->
            this.mapper.merge(request, entity)
            if (!entity.image.isNullOrEmpty()) {
                entity.image = this.fileService.upload(entity.id.toString(), entity.image!!, PRODUCT_PATH)
            }
            this.mapper.modelToDto(this.repository.save(entity))
        }

    override fun delete(id: UUID) {
        this.fileService.delete(id.toString())
        this.repository.deleteById(id)
    }
}