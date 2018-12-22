//
//  ScanItem.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

class ScanItem {
    let itemId: Int
    let quantity: Double
    
    init(id: Int, quant: Double) {
        self.itemId = id
        self.quantity = quant
    }
}
