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
    @State var listSelection: Bool = false
    
    
    let gridColumns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    let listColumns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        
        VStack {
            SearchBarView(searchText: $searchVM.query)
            
            imageContainer
                .padding(.horizontal)
            //                .searchable(text: $searchVM.query, placement: .navigationBarDrawer(displayMode: .always))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Switch Animation")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            listSelection.toggle()
                        }, label: {
                            Text(listSelection ? "List" : "Grid")
                        })
                    }
                })
                .overlay {
                    listSearchOverLay
                }
        }
    }
    
    @ViewBuilder
    private var imageContainer: some View {
        if listSelection {
            ScrollView {
                LazyVGrid(columns: gridColumns, content: {
                    ForEach(searchVM.images) { item in
                        ImageCell(gallery: item)
                            .frame(height: 150)
                    }
                })
            }
        } else {
            ScrollView {
                LazyVGrid(columns: listColumns, content: {
                    ForEach(searchVM.images) { item in
                        ImageCell(gallery: item)
                            .frame(height: 260)
                    }
                })
            }
        }
    }
    
    @ViewBuilder
    private var listSearchOverLay: some View {
        switch searchVM.phase {
        case .fetching:
            LoadingStateView()
            
        case .failure(let error):
            ErrorStateView(error: error.localizedDescription) {
                // Reload Search Results
                Task {
                    await searchVM.searchImages()
                }
            }
        case .empty:
            EmptyStateView(text: searchVM.emptyStateListText)
            
        default: EmptyView()
        }
    }
    
    struct ImageCell:View {
        let gallery: Gallery
        
        var url:URL?{
            let link = gallery.imageURL
            return URL(string: link)
        }
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable(resizingMode: .stretch)
                    } else if phase.error != nil {
                        Color.red // Indicates an error.
                    } else {
                        Rectangle()
                            .fill(Color.gray.gradient.opacity(0.2)) // Acts as a placeholder.
                            .overlay(content: {
                                Spacer()
                                ProgressView()
                                    .progressViewStyle(.circular)
                                Spacer()
                            })
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
                VStack(alignment: .leading) {
                    Text(gallery.title)
                    Text(gallery.filterdDate)
                    Text("count: \(gallery.images?.count ?? 0)")
                }
                .lineLimit(1)
                .font(.caption2)
                .padding(6)
                .background(.ultraThinMaterial, in: UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topTrailing: 6)))
            }
        }
    }
}

struct SearchView_Preview : PreviewProvider {
    
    @StateObject static var stubbedSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.phase = .success(Gallery.stubs)
        return vm
        //        var mock = MockSearchAPI()
        //        mock.stubbedSearchedTickersCallback = { Gallery.stubs }
        //        return SearchViewModel(query: "Apple", imgurAPI: mock)
    }()
    
    @StateObject static var emptySearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.query = "Apple"
        vm.phase = .empty
        return vm
        //        var mock = MockSearchAPI()
        //        mock.stubbedSearchedTickersCallback = { [] }
        //        return SearchViewModel(query: "Thanos", imgurAPI: mock)
    }()
    
    @StateObject static var loadingSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        vm.query = "HeyEmptysdnasjdfn"
        vm.phase = .fetching
        return vm
        //        var mock = MockSearchAPI()
        //        mock.stubbedSearchedTickersCallback = {
        //            await withCheckedContinuation { _ in }
        //        }
        //        return SearchViewModel(query: "Apple", imgurAPI: mock)
    }()
    
    @StateObject static var errorSearchVM: SearchViewModel = {
        let vm = SearchViewModel()
        
        vm.phase = .failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "An Error has been occured"]))
        return vm
        
        //        var mock = MockSearchAPI()
        //        mock.stubbedSearchedTickersCallback = {
        //            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "An Error has been occured"])
        //        }
        //        return SearchViewModel(query: "Apple", imgurAPI: mock)
    }()
    
    static var previews: some View {
        Group {
            NavigationStack {
                SearchView(searchVM: stubbedSearchVM)
            }
            //            .searchable(text: $stubbedSearchVM.query)
            .previewDisplayName("Results")
            
            NavigationStack {
                SearchView(searchVM: emptySearchVM)
            }
            //            .searchable(text: $emptySearchVM.query)
            .previewDisplayName("Empty Results")
            
            NavigationStack {
                SearchView(searchVM: loadingSearchVM)
            }
            //            .searchable(text: $loadingSearchVM.query)
            .previewDisplayName("Loading Results")
            
            NavigationStack {
                SearchView(searchVM: errorSearchVM)
            }
            //            .searchable(text: $errorSearchVM.query)
            .previewDisplayName("Error Results")
        }
    }
}

