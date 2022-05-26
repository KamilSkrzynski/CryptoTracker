//
//  CoinListView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import SwiftUI

struct CoinListView: View {
    
    @StateObject private var vm = CoinListViewModel()
    
    var body: some View {
        List {
            ForEach(vm.filteredCoins, id: \.id) { coin in
                NavigationLink {
                    CoinDetailView(coin: coin)
                } label: {
                    CoinView(coin: coin)
#if os(iOS)
                        .listRowSeparator(.hidden)
#endif
                }
            }
        }
        .listStyle(.plain)
        .searchable(text: $vm.searchText)
#if os(macOS)
        .frame(minWidth: 300)
#endif
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
