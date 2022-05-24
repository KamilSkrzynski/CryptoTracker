//
//  CoinListView.swift
//  CryptoTracker (iOS)
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import SwiftUI

struct CoinListView: View {
    
    @StateObject private var vm = CoinListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.coins, id: \.id) { coin in
                    CoinView(coin: coin)
                        .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
