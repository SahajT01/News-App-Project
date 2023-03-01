//
//  News_App_ProjectApp.swift
//  News App Project
//
//  Created by Sahaj Totla on 18/11/22.
//

import SwiftUI

@main
struct News_App_ProjectApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
