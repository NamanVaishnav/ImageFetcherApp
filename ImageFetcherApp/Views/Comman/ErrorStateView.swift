//
//  ErrorStateView.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import SwiftUI

struct ErrorStateView: View {
    let error: String
    var retryCallback: (() -> ())?
    var body: some View {
        HStack {
            Spacer()
            VStack (spacing: 16) {
                Text(error)
                if let retryCallback {
                    Button(action: retryCallback) {
                        Text("Retry")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
            Spacer()
        }
        .padding(64)
    }
}

struct ErrorStateView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorStateView(error: "An Error occured") { }
                .previewDisplayName("With Retry Button")
            
            ErrorStateView(error: "An Error occured")
                .previewDisplayName("Without Retry Button")
        }
    }
}


