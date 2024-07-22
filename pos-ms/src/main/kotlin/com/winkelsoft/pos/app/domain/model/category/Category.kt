package com.winkelsoft.pos.app.domain.model.category

import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne

@Entity
class Category : IdUuid() {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "warehouse_id", nullable = false)
    var warehouse: Warehouse? = null

    @Column(name = "name", nullable = false, length = 50)
    var name: String? = null

    @Column(name = "description", nullable = true)
    var description: String? = null

    @Column(name = "image", nullable = true)
    var image: String? = null
}