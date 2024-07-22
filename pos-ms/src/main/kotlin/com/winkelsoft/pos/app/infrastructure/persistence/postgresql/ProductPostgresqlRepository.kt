package com.winkelsoft.pos.app.infrastructure.persistence.postgresql

import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.app.domain.repository.ProductRepository
import com.winkelsoft.pos.shared.infrastructure.persistence.postgresql.CrudPostgresqlRepository
import java.util.UUID
import org.springframework.stereotype.Repository

@Repository
interface ProductPostgresqlRepository : CrudPostgresqlRepository<Product, UUID>, ProductRepository