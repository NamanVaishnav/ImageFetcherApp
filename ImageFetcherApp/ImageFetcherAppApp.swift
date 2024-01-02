//
//  ImageFetcherAppApp.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import SwiftUI

@main
struct ImageFetcherAppApp: App {
    @StateObject var searchVM = SearchViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SearchView(searchVM: searchVM)
            }
        }
    }
}
