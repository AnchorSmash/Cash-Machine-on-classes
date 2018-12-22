//
//  BillPrinter.swift
//  CashMashine
//
//  Created by Виктор Кулаков on 10/11/2018.
//  Copyright © 2018 Виктор Кулаков. All rights reserved.
//

import Foundation

class BillPrint {
    private let tablePrint = TablePrint()
}


extension BillPrint: BillPrinter {
    func billPrinter(bill: Billable) {
        tablePrint.printHeader()
        for billPosition in bill.positions {
            tablePrint.printLine(name: billPosition.title,
                                 price: billPosition.pricePrettyPrinted+"₽",
                                 quantity: "\(billPosition.quantity)\(billPosition.units)",
                sum: billPosition.quantitySumPricePrettyPrinted+"₽",
                discount: billPosition.discountPrettyPrinted+"₽",
                tax: billPosition.taxPrettyPrinted+"₽")
        }
        tablePrint.printSeparator()
        tablePrint.printFooter(name: "Сумма:", sum: "\(bill.totalSum)"+"₽")
        tablePrint.printFooter(name: "Скидка:", sum: "\(bill.totalDiscount)"+"₽")
        tablePrint.printFooter(name: "НДС:", sum: "\(bill.totalTax)"+"₽")
        tablePrint.printFooter(name: "ИТОГО:", sum: "\(bill.totalSumDiscountTax)"+"₽")
    }
}

//MARK: - For pretty table print

class TablePrint {
    let column1PadLength = 15
    let columnDefaultPadLength = 10
    var headerString : String {
        return "Наименование".padding(toLength: column1PadLength, withPad: " ", startingAt: 0) +
            "Цена".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
            "Кол-во".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
            "Стоимость".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
            "Скидка".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
            "НДС".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0)
    }
    var lineString : String {
        return "".padding(toLength: headerString.count, withPad: "-", startingAt: 0)
    }
    func printHeader() {
        print(headerString)
        printSeparator()
    }
    func printSeparator() {
        print(lineString)
    }
    func printLine(name: String,
                   price: String,
                   quantity: String,
                   sum: String,
                   discount: String,
                   tax: String) {
        let dataString =
            name.padding(toLength: column1PadLength, withPad: " ", startingAt: 0) +
                price.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                quantity.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                sum.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                discount.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                tax.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0)
        print(dataString)
    }
    func printFooter(name: String, sum: String) {
        let dataString =
            name.padding(toLength: column1PadLength, withPad: " ", startingAt: 0) +
                "".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                "".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                "".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                "".padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0) +
                sum.padding(toLength: columnDefaultPadLength, withPad: " ", startingAt: 0)
        print(dataString)
    }
}
