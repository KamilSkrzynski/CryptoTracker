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
        NavigationView {
            VStack {
                if vm.isLoading {
                    ProgressView("Getting data, please wait...")
                } else {
                    List {
                        ForEach(vm.filteredCoins, id: \.id) { coin in
                            Button {
                                vm.selectedCoin = coin
                            } label: {
                                CoinView(coin: coin)
                            }.buttonStyle(.plain)
                            
#if os(iOS)
                                .listRowSeparator(.hidden)
#endif
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $vm.searchText)
                    .disableAutocorrection(true)
                }
            }
            .sheet(item: $vm.selectedCoin) { item in
                CoinDetailView(coin: item)
            }
#if os(macOS)
            .frame(minWidth: 300)
#endif
            .navigationTitle("Coins")
#if os(iOS)
            .navigationBarItems(trailing: Button {
                vm.infoSelected.toggle()
            } label: {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.gray)
            }.sheet(isPresented: $vm.infoSelected) {
                InfoView()
            }
            )
#endif
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}
