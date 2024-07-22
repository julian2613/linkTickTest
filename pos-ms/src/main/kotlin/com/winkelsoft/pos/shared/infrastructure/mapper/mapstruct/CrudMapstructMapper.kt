package com.winkelsoft.pos.shared.infrastructure.mapper.mapstruct

import com.winkelsoft.pos.shared.application.mapper.CrudMapper
import org.mapstruct.MappingTarget

interface CrudMapstructMapper<REQUEST, RESPONSE, ENTITY> : CrudMapper<REQUEST, RESPONSE, ENTITY> {
    override fun merge(dto: REQUEST, @MappingTarget entity: ENTITY)
}