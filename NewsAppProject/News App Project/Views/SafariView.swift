//
//  SafariView.swift
//  News App Project
//
//  Created by Sahaj Totla on 18/11/22.
//

import SwiftUI
import SafariServices

struct SafariView : UIViewControllerRepresentable {
    
    let url : URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        	SFSafariViewController(url : url)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){}
}
