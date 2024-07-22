package com.winkelsoft.pos.shared.infrastructure.controller.spring

import com.winkelsoft.pos.shared.application.dto.support.filter.FilterCondition
import com.winkelsoft.pos.shared.application.dto.support.filter.FilterOperation
import jakarta.persistence.criteria.Path
import org.springframework.data.jpa.domain.Specification

class GenericFilterCriteriaBuilder<ENTITY> {
    private val filterCriteria: Map<FilterOperation, (FilterCondition) -> Specification<ENTITY>> = mapOf(
        FilterOperation.EQUAL to Companion::equal,
        FilterOperation.NOT_EQUAL to Companion::notEqual,
        FilterOperation.GREATER_THAN to Companion::greaterThan,
        FilterOperation.GREATER_THAN_OR_EQUAL_TO to Companion::greaterThanOrEqualTo,
        FilterOperation.LESS_THAN to Companion::lessThan,
        FilterOperation.LESS_THAN_OR_EQUAL_TO to Companion::lessThanOrEqualTo,
        FilterOperation.CONTAINS to Companion::contains
    )

    companion object {
        private const val LIKE_OPERATOR: String = "%"

        private fun <ENTITY> equal(filterCondition: FilterCondition) = Specification { root, _, criteriaBuilder ->
            criteriaBuilder.equal(
                getPath<ENTITY, Any>(root, filterCondition).`as`(String::class.java), filterCondition.value
            )
        }

        private fun <ENTITY> notEqual(filterCondition: FilterCondition) = Specification { root, _, criteriaBuilder ->
            criteriaBuilder.notEqual(
                getPath<ENTITY, Any>(root, filterCondition), filterCondition.value
            )
        }

        private fun <ENTITY> greaterThan(filterCondition: FilterCondition) =
            Specification<ENTITY> { root, _, criteriaBuilder ->
                criteriaBuilder.greaterThan(
                    getPath(root, filterCondition), Integer.parseInt(filterCondition.value.toString())
                )
            }

        private fun <ENTITY> greaterThanOrEqualTo(filterCondition: FilterCondition) =
            Specification<ENTITY> { root, _, criteriaBuilder ->
                criteriaBuilder.greaterThanOrEqualTo(
                    getPath(root, filterCondition), Integer.parseInt(filterCondition.value.toString())
                )
            }

        private fun <ENTITY> lessThan(filterCondition: FilterCondition) =
            Specification<ENTITY> { root, _, criteriaBuilder ->
                criteriaBuilder.lessThan(
                    getPath(root, filterCondition), Integer.parseInt(filterCondition.value.toString())
                )
            }

        private fun <ENTITY> lessThanOrEqualTo(filterCondition: FilterCondition) =
            Specification<ENTITY> { root, _, criteriaBuilder ->
                criteriaBuilder.lessThanOrEqualTo(
                    getPath(root, filterCondition), Integer.parseInt(filterCondition.value.toString())
                )
            }

        private fun <ENTITY> contains(filterCondition: FilterCondition) =
            Specification<ENTITY> { root, _, criteriaBuilder ->
                criteriaBuilder.like(
                    criteriaBuilder.lower(getPath(root, filterCondition)),
                    LIKE_OPERATOR + filterCondition.value.toString().lowercase() + LIKE_OPERATOR
                )
            }

        private fun <ENTITY, X> getPath(root: Path<ENTITY>, filterCondition: FilterCondition): Path<X> {
            var path = root.get<X>(filterCondition.field.first())
            if (filterCondition.field.size > 1) {
                filterCondition.field.removeFirst()
                path = getPath(path, filterCondition)
            }
            return path
        }
    }

    fun addCondition(
        andConditions: List<FilterCondition>, orConditions: List<FilterCondition>
    ): Specification<ENTITY>? {
        var specification: Specification<ENTITY>? = null
        andConditions.forEach { filterCondition ->
            specification = if (specification == null) {
                buildCriteria(filterCondition)
            } else {
                specification!!.and(buildCriteria(filterCondition))
            }
        }

        orConditions.forEach { filterCondition ->
            specification = if (specification == null) {
                buildCriteria(filterCondition)
            } else {
                specification!!.or(buildCriteria(filterCondition))
            }
        }
        return specification
    }

    private fun buildCriteria(filterCondition: FilterCondition): Specification<ENTITY> {
        val function =
            filterCriteria[filterCondition.operator] ?: throw IllegalArgumentException("Invalid function param type: ")
        return function.invoke(filterCondition)
    }
}