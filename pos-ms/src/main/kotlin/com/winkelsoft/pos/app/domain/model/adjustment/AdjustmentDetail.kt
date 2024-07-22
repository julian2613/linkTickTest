package com.winkelsoft.pos.app.domain.model.adjustment

import com.winkelsoft.pos.app.domain.model.product.Product
import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EnumType
import jakarta.persistence.Enumerated
import jakarta.persistence.FetchType
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import java.math.BigDecimal

@Entity
class AdjustmentDetail : IdUuid() {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    var product: Product? = null

    @Column(name = "quantity", nullable = false)
    var quantity: Int? = null

    @Column(name = "unit_cost", nullable = false)
    var unitCost: BigDecimal? = null

    @Enumerated(EnumType.STRING)
    @Column(name = "type", nullable = false, length = 50)
    var type: AdjustmentType? = null
}