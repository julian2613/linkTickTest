package com.winkelsoft.pos.shared.infrastructure.controller.spring

import com.winkelsoft.pos.shared.application.service.CrudService
import jakarta.validation.Valid
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam


abstract class CrudControllerSpring<REQUEST, RESPONSE, ENTITY, ID> {
    abstract val service: CrudService<REQUEST, RESPONSE, ENTITY, ID>

    @Autowired
    private lateinit var filterBuilderService: FilterBuilderService

    @PostMapping
    fun create(@RequestBody @Valid request: REQUEST): RESPONSE = this.service.save(request)

    @PutMapping("/{id}")
    fun update(@PathVariable id: ID, @RequestBody @Valid request: REQUEST): RESPONSE? = this.service.update(id, request)

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: ID) = this.service.delete(id)

    @GetMapping("/{id}")
    fun findById(@PathVariable id: ID): RESPONSE? = this.service.findById(id)

    @GetMapping
    fun findAll(
        @RequestParam(required = false) page: Int?,
        @RequestParam(required = false) size: Int?,
        @RequestParam(required = false) filterOr: String?,
        @RequestParam(required = false) filterAnd: String?,
        @RequestParam(required = false) orders: String?,
        @RequestParam(required = false) projection: String?
    ): Any {
        return this.service.findAll(
            GenericFilterCriteriaBuilder<ENTITY>().addCondition(
                filterBuilderService.getFilterCondition(filterAnd), filterBuilderService.getFilterCondition(filterOr)
            ), filterBuilderService.getPageable(orders, page, size), projection
        )
    }
}