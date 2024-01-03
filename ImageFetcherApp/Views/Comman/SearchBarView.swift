//
//  SearchBarView.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 03/01/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle( searchText.isEmpty ? Color.primary : Color.secondary)
            TextField("Search", text: $searchText)
                .foregroundStyle(Color.accentColor)
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundStyle(Color.primary)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.gray.opacity(0.1))
                .shadow(color: Color.accentColor, radius: 10, x:0, y:0)
        }
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
