//
//  CoinListViewModel.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import Foundation
import Combine

final class CoinListViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var isLoading: Bool = false
    @Published var selectedCoin: Coin? = nil
    @Published var infoSelected: Bool = false

    private let cryptoService = CryptoService()
    private var cancellables: AnyCancellable?
    
    // MARK: Search
    @Published var searchText: String = ""
    
    var filteredCoins: [Coin] {
        if !searchText.isEmpty {
            return coins.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.symbol.lowercased().contains(searchText.lowercased())
            }
        } else {
            return coins
        }
    }
    
    // MARK: Initialize to start network call
    init() {
        fetchCoins()
    }
    
    // MARK: Fetching
    func fetchCoins() {
        isLoading = true
        cancellables = cryptoService
            .fetchCoins()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { coins in
                DispatchQueue.main.async {
                    self.coins = coins
                }
            })
    }
}

