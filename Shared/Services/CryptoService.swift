//
//  CryptoService.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import Combine
import Foundation

final class CryptoService {
    
    let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
    
    func fetchCoins() -> AnyPublisher<[Coin], Error> {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: [Coin].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
