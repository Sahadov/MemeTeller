//
//  APIError.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import Foundation

enum APIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case .requestFailed(let description): return "Request failed: \(description)"
        case .invalidStatusCode(let statusCode): return "Invalid status code: \(statusCode)"
        case .unknownError(let error): return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
