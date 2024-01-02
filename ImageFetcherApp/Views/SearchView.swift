//
//  SearchView.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import SwiftUI
import imgurUtil

struct SearchView: View {
    @ObservedObject var searchVM: SearchViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchView_Preview : PreviewProvider {
    
    @StateObject static var stubbedSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.phase = .success(Gallery.stubs)
        return vm
    }()
    
    @StateObject static var emptySearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.phase = .empty
        return vm
    }()
    
    @StateObject static var loadingSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.query = "HeyEmptysdnasjdfn"
        vm.phase = .empty
        return vm
    }()
    
    @StateObject static var errorSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        
        vm.phase = .failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "An Error has been occured"]))
        return vm
    }()
    
    
    
    static var previews: some View {
        Group {
            NavigationStack {
                SearchView(searchVM: stubbedSearchVM)
            }
            .searchable(text: $stubbedSearchVM.query)
            .previewDisplayName("Results")
            
            NavigationStack {
                SearchView(searchVM: emptySearchVM)
            }
            .searchable(text: $emptySearchVM.query)
            .previewDisplayName("Empty Results")
            
            NavigationStack {
                SearchView(searchVM: loadingSearchVM)
            }
            .searchable(text: $loadingSearchVM.query)
            .previewDisplayName("Loading Results")
            
            NavigationStack {
                SearchView(searchVM: errorSearchVM)
            }
            .searchable(text: $errorSearchVM.query)
            .previewDisplayName("Error Results")
        }
    }
}

