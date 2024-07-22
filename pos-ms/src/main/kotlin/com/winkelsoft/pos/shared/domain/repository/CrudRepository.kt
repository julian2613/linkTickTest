package com.winkelsoft.pos.shared.domain.repository

import java.util.Optional
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.domain.Specification

interface CrudRepository<ENTITY, ID> {
    fun <S : ENTITY?> save(entity: S & Any): S
    fun findById(id: ID & Any): Optional<ENTITY>
    fun deleteById(id: ID & Any)
    fun findAll(): List<ENTITY>
    fun findAll(pageable: Pageable): Page<ENTITY>
    fun findAll(specification: Specification<ENTITY>): List<ENTITY>
    fun findAll(spec: Specification<ENTITY>, pageable: Pageable): Page<ENTITY>
}