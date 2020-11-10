//
//  Double+asCurrency.swift
//  Budget Tracker App
//
//  Created by Andrey Pereslavtsev on 10.11.2020.
//

import Foundation

extension Double {
    func asCurrency(_ symbol: String = "₽") -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
        formatter.currencySymbol = symbol //"☭ "
        return formatter.string(from: NSNumber(value: self))
    }
}
