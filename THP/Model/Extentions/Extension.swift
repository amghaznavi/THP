//
//  Extension.swift
//  THP
//
//  Created by Am GHAZNAVI on 08/11/2021.
//

import Foundation

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_GB")
            formatter.minimumIntegerDigits = 2
            formatter.maximumFractionDigits = 2
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}
