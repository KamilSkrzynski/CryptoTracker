//
//  Coin.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import Foundation

struct Coin: Codable {
    
    let id, name, symbol, image: String
    let currentPrice: Double
    
}

