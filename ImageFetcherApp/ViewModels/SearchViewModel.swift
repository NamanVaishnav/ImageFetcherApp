//
//  SearchViewModel.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import Foundation
import imgurUtil
import Combine

@MainActor
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
    
    private var cancellables = Set<AnyCancellable>()
    private let imgurAPI: NetworkManager
    
    init(query: String = "", imgurAPI: NetworkManager = ImgurUtil(clientID: "")) {
        self.query = query
        self.imgurAPI = imgurAPI
     
        startObserving()
    }
    
    private func startObserving() {
        $query
            .debounce(for: 0.25, scheduler: DispatchQueue.main)
            .sink { _ in
                Task { [weak self] in await self?.searchImages() }
            }
            .store(in: &cancellables)
        
        $query
            .filter { $0.isEmpty }
            .sink { [weak self] _ in self?.phase = .initial }
            .store(in: &cancellables)
    }
    
    func searchImages() async {
        let searchQuery = trimmedQuery
        guard !searchQuery.isEmpty else { return }
        phase = .fetching
        
        do {
            let images = try await imgurAPI.searchImages(query: searchQuery)
            if searchQuery != trimmedQuery { return }
            if images.isEmpty {
                phase = .empty
            } else {
                phase = .success(images)
            }
        } catch {
            if searchQuery != trimmedQuery { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
