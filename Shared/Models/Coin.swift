//
//  Coin.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import Foundation

struct Coin: Identifiable, Codable {
    
    let id, name, symbol, image, athDate: String
    let currentPrice, priceChangePercentage24H, marketCap, ath: Double
    let sparklineIn7D: Price
    
    var formattedPrice: String {
        return String(currentPrice).currencyFormatter()
    }
    
    var formattedMarketCap: String {
        return String(marketCap).currencyFormatter()
    }
    
    var formattedAth: String {
        return String(ath).currencyFormatter()
    }
    
    var formattedPriceChangePercentage24H: String {
        return String(priceChangePercentage24H).percentageFormatter()
    }
    
    var formattedAthDate: Date {
        
        return athDate.toDate() ?? Date()
    }
    
}

struct Price: Codable, Hashable {
    
    let price: [Double]
}
