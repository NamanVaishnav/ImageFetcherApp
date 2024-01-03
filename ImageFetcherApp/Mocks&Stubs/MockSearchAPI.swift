//
//  MockSearchAPI.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 03/01/24.
//

import Foundation
import imgurUtil

#if DEBUG

struct MockSearchAPI: NetworkManager {
    var stubbedSearchedTickersCallback: (() async throws -> [Gallery])!
    func searchImages(query: String) async throws -> [Gallery] {
        try await stubbedSearchedTickersCallback()
    }
}

#endif
