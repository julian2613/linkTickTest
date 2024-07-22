package com.winkelsoft.pos.app.infrastructure.mapper.mapstruct

import com.winkelsoft.pos.app.application.dto.product.request.ProductRequest
import com.winkelsoft.pos.app.application.dto.product.response.ProductResponse
import com.winkelsoft.pos.app.application.mapper.ProductMapper
import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.infrastructure.mapper.mapstruct.CrudMapstructMapper
import org.mapstruct.Mapper
import org.mapstruct.ReportingPolicy

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
interface ProductMapstructMapper : CrudMapstructMapper<ProductRequest, ProductResponse, Product>, ProductMapper