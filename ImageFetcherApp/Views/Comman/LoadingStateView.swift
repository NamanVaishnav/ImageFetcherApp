//
//  LoadingStateView.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import SwiftUI

struct LoadingStateView: View {
    var body: some View {
        HStack{
            Spacer()
            ProgressView()
                .progressViewStyle(.circular)
            Spacer()
        }
    }
}

#Preview {
    LoadingStateView()
}
