package com.winkelsoft.pos.shared.infrastructure.persistence.postgresql

import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.JpaSpecificationExecutor
import org.springframework.data.repository.NoRepositoryBean

@NoRepositoryBean
interface CrudPostgresqlRepository<ENTITY, ID> : JpaRepository<ENTITY, ID>, JpaSpecificationExecutor<ENTITY>,
    CrudRepository<ENTITY, ID>