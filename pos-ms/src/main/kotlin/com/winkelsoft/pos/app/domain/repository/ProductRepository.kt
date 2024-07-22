package com.winkelsoft.pos.app.domain.repository

import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import java.util.UUID

interface ProductRepository : CrudRepository<Product, UUID>