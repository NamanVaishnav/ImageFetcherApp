//
//  NetworkManager.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 03/01/24.
//

import Foundation
import imgurUtil

protocol NetworkManager {
    func searchImages(query: String) async throws -> [Gallery]
}

extension ImgurUtil: NetworkManager {}
