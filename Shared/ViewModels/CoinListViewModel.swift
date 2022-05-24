//
//  CoinListViewModel.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import Foundation
import Combine

final class CoinListViewModel: ObservableObject {
    
    private let cryptoService = CryptoService()
    private var cancellables: AnyCancellable?
    
    @Published var coins = [Coin]()
    
    init() {
        fetchCoins()
    }
    
    func fetchCoins() {
        cancellables = cryptoService
            .fetchCoins()
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { coins in
                DispatchQueue.main.async {
                    self.coins = coins
                }
            })
        

    }
}
