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
//                SearchBarView()
//                    .padding(.bottom, 10)
                CoinListView()
//#if os(macOS)
//                    .frame(minWidth: 400, minHeight: 400)
//                #endif
            }
            .navigationTitle("Coins")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
