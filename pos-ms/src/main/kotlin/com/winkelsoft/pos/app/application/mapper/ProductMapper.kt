package com.winkelsoft.pos.app.application.mapper

import com.winkelsoft.pos.app.application.dto.product.request.ProductRequest
import com.winkelsoft.pos.app.application.dto.product.response.ProductResponse
import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.application.mapper.CrudMapper

interface ProductMapper : CrudMapper<ProductRequest, ProductResponse, Product>