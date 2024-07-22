package com.winkelsoft.pos.app.domain.model.product

import com.winkelsoft.pos.app.domain.model.category.Category
import com.winkelsoft.pos.shared.domain.model.support.IdUuid
import com.winkelsoft.pos.app.domain.model.warehouse.Warehouse
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.FetchType
import jakarta.persistence.JoinColumn
import jakarta.persistence.JoinTable
import jakarta.persistence.ManyToMany
import jakarta.persistence.ManyToOne
import java.math.BigDecimal

@Entity
class Product : IdUuid() {
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "warehouse_id", nullable = false)
    var warehouse: Warehouse? = null

    @Column(name = "name", nullable = false, length = 50)
    var name: String? = null

    @Column(name = "description", nullable = true)
    var description: String? = null

    @Column(name = "image", nullable = true)
    var image: String? = null

    @Column(name = "base_price", nullable = false)
    var basePrice: BigDecimal? = null

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "product_category",
        joinColumns = [JoinColumn(name = "product_id")],
        inverseJoinColumns = [JoinColumn(name = "category_id")]
    )
    var categories: List<Category>? = null
}