package com.winkelsoft.pos.app.domain.model.inventory

import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne

@Entity
class UnitStock : IdUuid() {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "warehouse_id", nullable = false)
    var warehouse: Warehouse? = null

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    var product: Product? = null
}