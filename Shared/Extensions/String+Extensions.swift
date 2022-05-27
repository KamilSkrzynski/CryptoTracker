//
//  String+Extensions.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import Foundation

extension String {
    
    func currencyFormatter() -> String {
        
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "USD"
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            
            if let string = formatter.string(for: value) {
                return string
            }
        }
        return ""
    }
    
    func percentageFormatter() -> String {
        
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 4
            formatter.minimumFractionDigits = 2
            
            if let string = formatter.string(for: value/100) {
                return string
            }
        }
        return ""
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date? {

            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
            dateFormatter.locale = Locale(identifier: "fa-IR")
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateFormat = format
            let date = dateFormatter.date(from: self)

            return date

        }
}
