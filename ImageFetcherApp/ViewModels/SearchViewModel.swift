//
//  SearchViewModel.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import Foundation
import imgurUtil

class SearchViewModel: ObservableObject {
    @Published var query : String = ""
    @Published var phase: FetchPhase<[Gallery]> = .initial
    
    private var trimmedQuery: String {
        query.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var images: [Gallery] { phase.value ?? [] }
    var error: Error? { phase.error }
    var isSearching: Bool { !trimmedQuery.isEmpty }
    
    var emptyStateListText: String{
        "Images not found for \n \"\(query)\""
    }
}
