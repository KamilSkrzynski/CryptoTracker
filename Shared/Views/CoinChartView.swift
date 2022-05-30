//
//  CoinChartView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 27/05/2022.
//

import SwiftUI

struct CoinChartView: View {
    
    @State private var tappedData: Double?
    
    let historicalPrice: Price
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Historical price (last 7 days)")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.gray)
                .onTapGesture {
                    withAnimation {
                        self.tappedData = nil
                    }
                }
            
            ZStack {
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .bottom, spacing: 2) {
                        ForEach(historicalPrice.price, id: \.self) { data in
                            RoundedRectangle(cornerRadius: 5)
                                .fill(LinearGradient(colors: [Color.blue, Color.blue.opacity(0.5), Color.blue.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                                .frame(width: 30, height: data * (300/historicalPrice.price.max()!))
                                .onTapGesture {
                                    withAnimation {
                                        self.tappedData = data
                                    }
                                }
                        }
                    }
                }
                
                if let selectedData = tappedData {
                    VStack(alignment: .leading, spacing: 6) {
                      Text("$\(Double(selectedData) ?? 0)").font(.system(size: 16))
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6).zIndex(1)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 8)
                  }
            }
        }
        .padding()
    }
}
