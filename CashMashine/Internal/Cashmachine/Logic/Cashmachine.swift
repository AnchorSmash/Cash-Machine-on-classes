//
//  Cashmachine.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

// MARK: - Constructor & Injections

class Cashmachine {
    private let accountable: Accounter
    private let billPrinter: BillPrinter
    private let discounter: Discounter
    private var existingGoods: [Tradable & Taxable & Discountable & Billable]
    
    init(accountable: Accounter, billPrinter: BillPrinter, discounter: Discounter) {
        self.accountable = accountable
        self.billPrinter = billPrinter
        self.discounter = discounter
        existingGoods = [Tradable & Taxable & Discountable & Billable]()
    }
}
// MARK: - Adding/removing exitings goods

extension Cashmachine {
    func register(good: Tradable & Taxable & Discountable & Billable) {
    existingGoods.append(good)
    }
    
    func unregister(good: Tradable & Taxable & Discountable & Billable) {
        guard let indexToRemove = existingGoods.firstIndex(where: {$0.itemId == good.itemId}) else {
            return
        }
        existingGoods.remove(at: indexToRemove)
    }
}

// MARK: - Scanner

extension Cashmachine {
    func scan(items: [ScanItem]) {
        var billPositions = [BillPosition]()
        var totalDiscount = 0.0
        var totalTax = 0.0
        var totalSum = 0.0
        
        for item in items {
            guard let registeredItem = existingGoods.first(where: {$0.itemId == item.itemId}) else {
                continue
            }
            
            let tax = accountable.calculateTax(forTaxable: registeredItem)
            totalTax += tax * item.quantity
            let discount = discounter.calculateDiscount(for: registeredItem)
            totalDiscount += discount
            totalSum += registeredItem.priceValue * item.quantity
            let billPosition = BillPosition(title: (registeredItem as Tradable)
                .tradableDiscription.prettyPrinted,
                                            quantity: "\(item.quantity)",
                units: (registeredItem as Tradable).countType.rawValue,
                taxPrettyPrinted: "\(tax * item.quantity)",
                discountPrettyPrinted: "\(discount * item.quantity)",
                pricePrettyPrinted: "\(registeredItem.priceValue) ",
                quantitySumPricePrettyPrinted: "\(item.quantity * registeredItem.priceValue)")
            
            billPositions.append(billPosition)
        }
        
        let total = Total(billPositions: billPositions,
                          discount: totalDiscount,
                          tax: totalTax,
                          sum: totalSum,
                          totalSumDiscountTax: totalSum + totalTax - totalDiscount)
        printer(bill: total)
    }
}

// MARK: - Printing bill

extension Cashmachine {
    private func printer(bill: Billable) {
    billPrinter.billPrinter(bill: bill)
}
}
