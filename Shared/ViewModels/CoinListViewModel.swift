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
    
    @Published private var coins = [Coin]()
    
    func fetchCoins() {
        cancellables = cryptoService
            .fetchCoins()
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { coins in
                self.coins = coins
            })
        

    }
}
