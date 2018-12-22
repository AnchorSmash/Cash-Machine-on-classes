//
//  Accountant.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 10/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

// MARK : - empty

class Accountant {
    
}

//  MARK : - Implementation protocol of Accounter 

extension Accountant: Accounter {
    func calculateTax(forTaxable tax: Taxable) -> Double {
        var taxValue = 0.0
        if tax.type == .fix {
            switch tax.fixType {
            case .alcohol:
                taxValue = 100
            case .cigaretts:
                taxValue = 50
            case .noType:
                taxValue = 0
            }
            return taxValue
        } else {
            if tax.currentCountry == "RUS" {
                taxValue = 0.1
            } else {
                taxValue = 0.18
            }
            return taxValue * tax.priceValue
        }
    }
    
    
}
