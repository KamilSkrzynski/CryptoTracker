//
//  InfoViewModel.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 27/05/2022.
//

import Foundation
import Combine

final class InfoViewModel: ObservableObject {
    
    @Published var globalInfoData: CryptoData? = nil

    private let cryptoService = CryptoService()
    private var cancellables: AnyCancellable?
    
    init(globalInfoData: CryptoData? = nil) {
        self.globalInfoData = globalInfoData
        fetchGlobalInfoData()
    }
    
    func fetchGlobalInfoData() {
        
        cancellables = cryptoService
            .fetchGlobalInfo()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
              //  self.isLoading = false
            }, receiveValue: { returnedData in
                DispatchQueue.main.async {
                    self.globalInfoData = returnedData.data
                    print(self.globalInfoData)
                }
            })
    }
}
