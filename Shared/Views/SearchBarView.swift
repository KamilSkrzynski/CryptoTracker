//
//  SearchBarView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 26/05/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .font(.system(size: 16, weight: .regular))
                .textFieldStyle(.plain)
                .onChange(of: searchText) { newValue in
                    
                }
        }
        .padding(.vertical, 6)
        .padding(.horizontal)
        .background(.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
