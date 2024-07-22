package com.winkelsoft.pos.shared.infrastructure.controller.spring

import com.winkelsoft.pos.shared.application.dto.support.filter.FilterCondition
import com.winkelsoft.pos.shared.application.dto.support.filter.FilterOperation
import java.util.function.Consumer
import org.apache.coyote.BadRequestException
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Service


@Service
class FilterBuilderService {
    companion object {
        private const val FILTER_SEARCH_DELIMITER = "&"
        private const val FILTER_CONDITION_DELIMITER = "\\|"
        private const val FILTER_PATH_DELIMITER = "."
    }

    fun getFilterCondition(criteria: String?): List<FilterCondition> {
        val filters: MutableList<FilterCondition> = ArrayList()

        try {
            if (!criteria.isNullOrEmpty()) {
                val values = split(criteria, FILTER_SEARCH_DELIMITER)
                if (values.isNotEmpty()) {
                    values.forEach(Consumer { value: String ->
                        val filter = split(value, FILTER_CONDITION_DELIMITER)
                        val filterValue = try {
                            filter[2]
                        } catch (ex: Exception) {
                            null
                        }
                        filters.add(
                            FilterCondition(
                                filter[0].split(FILTER_PATH_DELIMITER).toMutableList(),
                                filterValue,
                                FilterOperation.valueOf(filter[1])
                            )
                        )
                    })
                }
            }

            return filters
        } catch (ex: Exception) {
            throw BadRequestException("Cannot create condition filter " + ex.message)
        }
    }

    private fun split(search: String, delimiter: String): List<String> =
        search.split(delimiter.toRegex()).dropLastWhile { it.isEmpty() }

    fun getPageable(order: String?, page: Int?, size: Int?): PageRequest? {
        try {
            if (page != null && size != null) {
                if (!order.isNullOrEmpty()) {
                    val values = split(order, FILTER_CONDITION_DELIMITER)
                    val column = values[0]
                    val sortDirection = Sort.Direction.valueOf(values[1])

                    return PageRequest.of(page, size, sortDirection, column)

                } else {
                    return PageRequest.of(page, size)
                }
            } else {
                return null
            }
        } catch (ex: Exception) {
            throw BadRequestException("Cannot create condition filter " + ex.message)
        }
    }
}