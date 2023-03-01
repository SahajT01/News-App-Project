//
//  NewsAPI.swift
//  News App Project
//
//  Created by Sahaj Totla on 18/11/22.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apiKey = "b9ee8cfb1013447793092b5275256285"
    private let session = URLSession.shared
    private let jsonDecoder : JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        try await fetchArticles(from: generateNewsURL(from: category))
    }
    
    func search(for query : String) async throws -> [Article] {
        try await fetchArticles(from: generateSearchURL(from: query))
    }
    
    private func fetchArticles(from url : URL) async throws -> [Article] {
        let (data, response) = try await session.data(from : url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateErrorCode(description: "Bad Response")
        }
        
        switch response.statusCode {
            
        case(200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(newsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw generateErrorCode(description: apiResponse.message ?? "An error occurred")
            }
            
        default:
            throw generateErrorCode(description: "A server error occurred")
        }
    }
    
    private func generateErrorCode(code: Int = 1, description : String) -> Error {
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey : description])
    }
    
    private func generateSearchURL(from query : String) -> URL {
        let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(percentEncodedString)"
        return URL(string: url)!
    }
    
    private func generateNewsURL(from category: Category) -> URL {
        ////"https://newsapi.org/v2/top-headlines?country=in&apiKey=b9ee8cfb1013447793092b5275256285"
        var url = "https://newsapi.org/v2/top-headlines?country=in&"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        return URL(string : url)!
    }
}
