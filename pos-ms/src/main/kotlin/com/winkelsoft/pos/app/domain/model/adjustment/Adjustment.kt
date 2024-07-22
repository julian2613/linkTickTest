package com.winkelsoft.pos.app.domain.model.adjustment

import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany

@Entity
class Adjustment : IdUuid() {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "warehouse_id", nullable = false)
    var warehouse: Warehouse? = null

    @Column(name = "observations", nullable = true)
    var observations: String? = null

    @OneToMany(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "adjustment_id", nullable = false)
    var details: List<AdjustmentDetail>? = null
}