//
//  ContentView.swift
//  News App Project
//
//  Created by Sahaj Totla on 18/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            BookmarkTabView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
        }
        //ArticleListView(articles: Article.previewData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
