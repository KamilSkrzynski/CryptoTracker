//
//  ContentView.swift
//  Shared
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                CoinListView()
            }
            .navigationTitle("Coins")
        }
        .tint(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
