//
//  String+Extension.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 29/10/21.
//

import Foundation

extension String {
    
    func localizedPrice() -> String {
        let formatter = NumberFormatter()
        let price: Double = Double(self) ?? 0.0
        formatter.numberStyle = .currency
        formatter.locale = .autoupdatingCurrent
        return formatter.string(from: NSNumber(value: price)) ?? "0.0"
        }
    
}
