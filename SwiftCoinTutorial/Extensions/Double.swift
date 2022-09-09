//
//  Double.swift
//  SwiftCoinTutorial
//
//  Created by Mobarak Hossen on 31/8/22.
//

import Foundation

extension Double{
    private var currencyFormatter:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        return formatter
    }
    func toCurrency()->String{
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    
    private var numberFormatter:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toPercentString()->String{
        guard let num = numberFormatter.string(for: self) else {return "0.00%"}
        return num + "%"
    }
}
