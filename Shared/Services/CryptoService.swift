//
//  CryptoService.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import Combine
import Foundation

final class CryptoService {
    
    let coinsUrl = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
    
    func fetchCoins() -> AnyPublisher<[Coin], Error> {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession
            .shared
            .dataTaskPublisher(for: coinsUrl!)
            .map { $0.data }
            .decode(type: [Coin].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
//    func fetchPriceRanges(coin: String, timeRange: String) -> AnyPublisher<CoinPriceRange, Error> {
//        
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//
//            let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin)/market_chart?vs_currency=usd&days=\(timeRange)")
//            print(url)
//            
//            return URLSession
//                .shared
//                .dataTaskPublisher(for: url!)
//                .map { $0.data }
//                .decode(type: CoinPriceRange.self, decoder: decoder)
//                .eraseToAnyPublisher()
//    }
}
