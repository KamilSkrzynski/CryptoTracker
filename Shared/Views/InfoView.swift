//
//  InfoView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 27/05/2022.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = InfoViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    
                    VStack(alignment: .leading) {
                        Text("Active cryptocurrencies")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .bold))
                        Text("\(vm.globalInfoData?.activeCryptocurrencies ?? 1)")
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Total markets")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .bold))
                        Text("\(vm.globalInfoData?.markets ?? 1)")
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("BTC dominance")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .bold))
                        Text(vm.globalInfoData?.btcDominance ?? "")
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("ETH dominance")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .bold))
                        Text(vm.globalInfoData?.ethDominance ?? "")
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("Info")
            .toolbar {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
