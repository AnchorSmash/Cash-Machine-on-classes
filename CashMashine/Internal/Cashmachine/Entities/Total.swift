//
//  Total.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

class Total {
    private let billPositions: [BillPosition]
    private let discount: Double
    private let tax: Double
    private let sum: Double
    internal let totalSumDiscountTax: Double
    
    init(billPositions: [BillPosition],
         discount: Double,
         tax: Double,
         sum: Double,
         totalSumDiscountTax: Double) {
        self.billPositions = billPositions
        self.discount = discount
        self.tax = tax
        self.sum = sum
        self.totalSumDiscountTax = totalSumDiscountTax
    }
}

extension Total: Billable {
    
    var positions: [BillPosition] {
        return billPositions
    }
    
    var totalDiscount: Double {
        return discount
    }
    
    var totalTax: Double {
        return tax
    }
    
    var totalSum: Double {
        return sum
    }
}
