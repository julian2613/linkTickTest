package com.winkelsoft.pos.shared.infrastructure.controller.spring.handler

import com.winkelsoft.pos.shared.application.dto.support.exception.ExceptionCode
import com.winkelsoft.pos.shared.application.dto.support.exception.ExceptionResponse
import org.apache.coyote.BadRequestException
import org.hibernate.query.sqm.PathElementException
import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException

@ControllerAdvice
class RestExceptionHandler {
    private val logger = LoggerFactory.getLogger(RestExceptionHandler::class.java)

    @ExceptionHandler(
        value = [MethodArgumentNotValidException::class, BadRequestException::class, PathElementException::class, HttpMessageNotReadableException::class, MethodArgumentTypeMismatchException::class]
    )
    fun handleBadRequest(ex: Exception): ResponseEntity<Any> {
        this.logger.error("--RestExceptionHandler:handleBadRequest" + ex.message)
        return ResponseEntity(ExceptionResponse().apply {
            code = ExceptionCode.INVALID_REQUEST
            message = ExceptionCode.INVALID_REQUEST.value
        }, HttpStatus.BAD_REQUEST)
    }
}