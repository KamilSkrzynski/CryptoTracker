//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import SwiftUI

struct CoinDetailView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.primary)
                    Text(coin.symbol.uppercased())
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Current price")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .bold))
                    VStack(alignment: .leading) {
                        Text(coin.formattedPrice)
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                        Text(coin.formattedPriceChangePercentage24H)
                            .foregroundColor(coin.formattedPriceChangePercentage24H.hasPrefix("-") ? .red : .green)
                            .font(.system(size: 13, weight: .bold))
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
                
                VStack(alignment: .leading) {
                    Text("All time high (ATH)")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .bold))
                    Text(coin.formattedAth)
                        .foregroundColor(.primary)
                        .font(.system(size: 17, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
            }
            .frame(maxWidth: .infinity)
            VStack(alignment: .leading) {
                Text("Market cap")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .bold))
                Text(coin.formattedMarketCap)
                    .foregroundColor(.primary)
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
            Spacer()
        }
        .padding(.horizontal)
    }
}

//struct CoinDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let coin = Coin(id: "", name: "Bitcoin", symbol: "BTC", image: "", currentPrice: 0.0, priceChangePercentage24h: 0.0, ath: 0.0, marketCap: 0.0)
//
//        CoinView(coin: coin)
//    }
//}
