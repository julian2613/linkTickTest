package com.winkelsoft.pos.app.domain.repository

import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import java.util.UUID

interface CategoryRepository : CrudRepository<Category, UUID>