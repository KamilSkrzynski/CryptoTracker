//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 27/05/2022.
//

import Foundation
import Combine

final class CoinDetailViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    private let cryptoService = CryptoService()
    private var cancellables: AnyCancellable?

    
//    func fetchPriceRanges(coinId: String, timeRange: String) {
//        isLoading = true
//        cancellables = cryptoService
//            .fetchPriceRanges(coin: coinId, timeRange: timeRange)
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { _ in
//                self.isLoading = false
//                print(self.priceRanges)
//            }, receiveValue: { priceRanges in
//                DispatchQueue.main.async {
//                    self.priceRanges = priceRanges
//                }
//            })
//    }
}
