package com.winkelsoft.pos.shared.application.service

import com.winkelsoft.pos.shared.application.mapper.CrudMapper
import com.winkelsoft.pos.shared.domain.repository.CrudRepository
import kotlin.jvm.optionals.getOrNull
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.domain.Specification

abstract class CrudServiceImpl<REQUEST, RESPONSE, ENTITY : Any, ID : Any> : CrudService<REQUEST, RESPONSE, ENTITY, ID> {
    abstract val mapper: CrudMapper<REQUEST, RESPONSE, ENTITY>
    abstract val repository: CrudRepository<ENTITY, ID>

    override fun save(request: REQUEST): RESPONSE =
        this.mapper.modelToDto(this.repository.save(this.mapper.dtoToModel(request)))

    override fun update(id: ID, request: REQUEST): RESPONSE? = this.repository.findById(id).get().let { entity ->
        this.mapper.merge(request, entity)
        this.mapper.modelToDto(this.repository.save(entity))
    }

    override fun delete(id: ID) = this.repository.deleteById(id)

    override fun findById(id: ID): RESPONSE? = this.repository.findById(id).getOrNull()?.let { entity ->
        this.mapper.modelToDto(entity)
    }

    override fun findAll(specification: Specification<ENTITY>?, pageable: Pageable?, projection: String?): Any {
        return if (specification != null && pageable != null) {
            this.repository.findAll(specification, pageable).map(this.mapper::modelToDto)
        } else if (specification != null) {
            this.repository.findAll(specification).map(this.mapper::modelToDto)
        } else if (pageable != null) {
            this.repository.findAll(pageable).map(this.mapper::modelToDto)
        } else {
            this.repository.findAll().map(this.mapper::modelToDto)
        }
    }
}