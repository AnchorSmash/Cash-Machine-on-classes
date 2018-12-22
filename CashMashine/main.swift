//
//  main.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 03/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

let accountant = Accountant()
let billPrinter = BillPrint()
let discounter = Discountant(descriptorsArray: [DiscountedDiscriptor(itemId: 1, discountValue: 0.5)])

var cashMachine = Cashmachine(accountable: accountant,
                              billPrinter: billPrinter,
                              discounter: discounter)

let trItem1 = TradableItem(barcode: 789998,
                              countType: .item,
                              tradableDiscription: TradableDiscription(name: "Греча",
                                                                       originCountry: "Russia"))
let total1 = Total(billPositions: [], discount: 10, tax: 10, sum: 100, totalSumDiscountTax: 10)
let tax1 = Tax(priceValue: 49, type: .share, currentCountry: "RU", fixType: .noType)
let dis1 = Discount(itemId: 1, price: tax1.priceValue)

let good1 = Good(tradable: trItem1, billable: total1, taxable: tax1, discountable: dis1)

let trItem2 = TradableItem(barcode: 838391,
                               countType: .item,
                               tradableDiscription: TradableDiscription(name: "Портвейн 777",
                                                                        originCountry: "Russia"))
let total2 = Total(billPositions: [], discount: 10, tax: 5, sum: 70, totalSumDiscountTax: 5)
let tax2 = Tax(priceValue: 399, type: .fix, currentCountry: "RU", fixType: .alcohol)
let dis2 = Discount(itemId: 2, price: tax2.priceValue)

let good2 = Good(tradable: trItem2, billable: total2, taxable: tax2, discountable: dis2)

let trItem3 = TradableItem(barcode: 130120,
                               countType: .item,
                               tradableDiscription: TradableDiscription(name: "Сигареты Беломор",
                                                                        originCountry: "RU"))
let total3 = Total(billPositions: [], discount: 10, tax: 10, sum: 3, totalSumDiscountTax: 10)
let tax3 = Tax(priceValue: 100, type: .fix, currentCountry: "RU", fixType: .cigaretts)
let dis3 = Discount(itemId: 3, price: tax3.priceValue)

let good3 = Good(tradable: trItem3, billable: total3, taxable: tax3, discountable: dis3)

let trItem4 = TradableItem(barcode: 880055,
                               countType: .item,
                               tradableDiscription: TradableDiscription(name: "Dr.Peper",
                                                                        originCountry: "USA"))
let total4 = Total(billPositions: [], discount: 10, tax: 18, sum: 3, totalSumDiscountTax: 10)
let tax4 = Tax(priceValue: 129, type: .share, currentCountry: "USA", fixType: .noType)
let dis4 = Discount(itemId: 4, price: tax4.priceValue)

let good4 = Good(tradable: trItem4, billable: total4, taxable: tax4, discountable: dis4)

cashMachine.register(good: good1)
cashMachine.register(good: good2)
cashMachine.register(good: good3)
cashMachine.register(good: good4)

let scanItem1 = ScanItem(id: 1, quant: 1)
let scanItem2 = ScanItem(id: 2, quant: 1)
let scanItem3 = ScanItem(id: 3, quant: 1)
let scanItem4 = ScanItem(id: 4, quant: 2)
cashMachine.scan(items: [scanItem1, scanItem2, scanItem3, scanItem4])
