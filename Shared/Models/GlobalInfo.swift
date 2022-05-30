//
//  GlobalInfo.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 27/05/2022.
//

import Foundation

struct GlobalInfo: Codable {
    
    let data: CryptoData?
}

struct CryptoData: Codable {
    
    let activeCryptocurrencies: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    
    var activeCrypto: Int {
        return activeCryptocurrencies
    }
    
    var btcDominance: String {
        
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return String(item.value).percentageFormatter()
        }
        return ""
    }
    
    var ethDominance: String {
        
        if let item = marketCapPercentage.first(where: { $0.key == "eth" }) {
            return String(item.value).percentageFormatter()
        }
        return ""
    }
    
    var dominanceDict: [String: Double] {
        if !marketCapPercentage.isEmpty {
            return marketCapPercentage
        }
        return ["": 0.0]
    }
}
