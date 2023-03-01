//
//  newsAPIResponse.swift
//  News App Project
//
//  Created by Sahaj Totla on 18/11/22.
//

import Foundation

struct newsAPIResponse : Decodable {
    let status : String
    let totalResults : Int?
    let articles : [Article]?
    
    let code : String?
    let message : String?
    
}
