package com.winkelsoft.pos

import org.springframework.boot.autoconfigure.EnableAutoConfiguration
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@EnableAutoConfiguration
@SpringBootApplication
class PosApplication

fun main(args: Array<String>) {
    runApplication<PosApplication>(*args)
}