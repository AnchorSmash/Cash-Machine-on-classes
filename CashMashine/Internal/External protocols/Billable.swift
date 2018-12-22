//
//  Billable.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation


struct BillPosition {
    var title: String
    var quantity: String
    var units: String
    var taxPrettyPrinted: String
    var discountPrettyPrinted: String
    var pricePrettyPrinted: String
    var quantitySumPricePrettyPrinted: String
   
    init(title: String,
         quantity: String,
         units: String,
         taxPrettyPrinted: String,
         discountPrettyPrinted: String,
         pricePrettyPrinted: String,
         quantitySumPricePrettyPrinted: String) {
        self.title = title
        self.quantity = quantity
        self.units = units
        self.taxPrettyPrinted = taxPrettyPrinted
        self.discountPrettyPrinted = discountPrettyPrinted
        self.pricePrettyPrinted = pricePrettyPrinted
        self.quantitySumPricePrettyPrinted = quantitySumPricePrettyPrinted
    }
}



protocol Billable {
    var positions: [BillPosition] { get }
    var totalDiscount: Double  { get }
    var totalTax: Double { get }
    var totalSum: Double { get }
    var totalSumDiscountTax: Double { get }
}

protocol BillPrinter {
    func billPrinter(bill: Billable)
}
