//
//  Tradable.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

enum CountType: String {
    case item = "шт"
    case weigth = "г"
    case liquid = "мл"
}

class TradableDiscription {
    var name: String
    var originCountry: String
    var prettyPrinted: String {
        return name + "\n" + originCountry
    }
    
    init(name: String, originCountry: String) {
        self.name = name
        self.originCountry = originCountry
    }
}
protocol Tradable {
    var barcode: Int { get }
    var countType: CountType { get }
    var tradableDiscription: TradableDiscription { get }
}

