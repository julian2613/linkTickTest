package com.winkelsoft.pos.shared.application.service

import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.domain.Specification

interface CrudService<REQUEST, RESPONSE, ENTITY, ID> {
    fun save(request: REQUEST): RESPONSE

    fun update(id: ID, request: REQUEST): RESPONSE?

    fun delete(id: ID)

    fun findById(id: ID): RESPONSE?

    fun findAll(specification: Specification<ENTITY>?, pageable: Pageable?, projection: String?): Any
}