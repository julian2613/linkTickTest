package com.winkelsoft.pos.app.domain.model.warehouse

import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import jakarta.persistence.Column
import jakarta.persistence.Entity

@Entity
class Warehouse : IdUuid() {
    @Column(name = "name", nullable = false, length = 50)
    var name: String? = null

    @Column(name = "address", nullable = true)
    var address: String? = null
}