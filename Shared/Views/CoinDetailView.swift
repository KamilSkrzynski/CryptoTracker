//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import SwiftUI


struct CoinDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let coin: Coin
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
            
            HStack {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    
                    Text(coin.name)
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.primary)
                    Text(coin.symbol.uppercased())
                        .font(.system(size: 19, weight: .semibold))
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                
                VStack(alignment: .leading) {
                    Text("Current price")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .bold))
                    HStack {
                        Text(coin.formattedPrice)
                            .foregroundColor(.primary)
                            .font(.system(size: 17, weight: .bold))
                        Text("\(coin.formattedPriceChangePercentage24H) (24h)")
                            .foregroundColor(coin.formattedPriceChangePercentage24H.hasPrefix("-") ? .red : .green)
                            .font(.system(size: 13, weight: .bold))
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("All time high (ATH)")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .bold))
                        Text("(\(coin.formattedAthDate.formatted(.dateTime.year().month().day())))")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    Text(coin.formattedAth)
                        .foregroundColor(.primary)
                        .font(.system(size: 17, weight: .bold))
                }
                
                VStack(alignment: .leading) {
                    Text("Market cap")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .bold))
                    Text(coin.formattedMarketCap)
                        .foregroundColor(.primary)
                        .font(.system(size: 17, weight: .bold))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
            
            CoinChartView(historicalPrice: coin.sparklineIn7D)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray.opacity(0.1)))
            Spacer()
        }
        .navigationTitle(coin.name)
        .padding(.horizontal)
    }
}
