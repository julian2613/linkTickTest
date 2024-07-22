package com.winkelsoft.pos.shared.application.mapper

interface CrudMapper<REQUEST, RESPONSE, ENTITY> {
    fun merge(dto: REQUEST, entity: ENTITY)
    fun dtoToModel(dto: REQUEST): ENTITY
    fun modelToDto(entity: ENTITY): RESPONSE
}