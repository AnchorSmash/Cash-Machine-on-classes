//
//  Good.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 10/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

class Good {
    private let tradable: Tradable
    private let billable: Billable
    private let taxable: Taxable
    private let discountable: Discountable
    
    init(tradable: Tradable, billable: Billable, taxable: Taxable, discountable: Discountable) {
        self.tradable = tradable
        self.billable = billable
        self.taxable = taxable
        self.discountable = discountable
    }
}

extension Good: Tradable  {
    var barcode: Int {
        return tradable.barcode
    }
    
    var countType: CountType {
        return tradable.countType
    }
    
    var tradableDiscription: TradableDiscription {
        return tradable.tradableDiscription
    }
    

}

extension Good: Taxable {
    var priceValue: Double {
        return taxable.priceValue
    }
    
    var type: TaxType {
       return taxable.type
    }
    
    var currentCountry: String {
        return taxable.currentCountry
    }
    
    var fixType: FixType {
        return taxable.fixType
    }
    
    
}

extension Good: Discountable {
    var itemId: Int {
        return discountable.itemId
    }
    
    var price: Double {
        return discountable.price
    }
    
    
}

extension Good: Billable {
    var positions: [BillPosition] {
        return billable.positions
    }
    
    var totalDiscount: Double {
        return billable.totalDiscount
    }
    
    var totalTax: Double {
        return billable.totalTax
    }
    
    var totalSum: Double {
        return billable.totalSum
    }
    
    var totalSumDiscountTax: Double {
        return billable.totalSumDiscountTax
    }
    
    
}

class TradableItem: Tradable {
    var barcode: Int
    var countType: CountType
    var tradableDiscription: TradableDiscription
    
    init(barcode: Int, countType: CountType, tradableDiscription: TradableDiscription ) {
        self.barcode = barcode
        self.countType = countType
        self.tradableDiscription = tradableDiscription
    }
}

class Tax: Taxable {
    
    var priceValue: Double
    var type: TaxType
    var currentCountry: String
    var fixType: FixType
    
    init( priceValue: Double, type: TaxType, currentCountry: String, fixType: FixType) {
        
        self.priceValue = priceValue
        self.type = type
        self.currentCountry = currentCountry
        self.fixType = fixType
        
    }
}

class Discount: Discountable {
   
    var itemId: Int
    var price: Double
    
    init(itemId: Int, price: Double) {
        
        self.itemId = itemId
        self.price = price
    }
    
}

class Bill: Billable {
    
    var positions: [BillPosition]
    var totalDiscount: Double
    var totalTax: Double
    var totalSum: Double
    var totalSumDiscountTax: Double
    
    init(positions: [BillPosition],
         totalDiscount: Double,
         totalTax: Double,
         totalSum: Double,
         totalSumDiscountTax: Double) {
        self.positions = positions
        self.totalDiscount = totalDiscount
        self.totalTax = totalTax
        self.totalSum = totalSum
        self.totalSumDiscountTax = totalSumDiscountTax
    }
}
