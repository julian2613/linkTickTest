package com.winkelsoft.pos.app.infrastructure.persistence.postgresql

import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.app.domain.repository.CategoryRepository
import com.winkelsoft.pos.shared.infrastructure.persistence.postgresql.CrudPostgresqlRepository
import java.util.UUID
import org.springframework.stereotype.Repository

@Repository
interface CategoryPostgresqlRepository : CrudPostgresqlRepository<Category, UUID>, CategoryRepository