//
//  NetworkService.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import Foundation

class NetworkService {
    
    private let urlString = "https://api.imgflip.com/get_memes"
    
    func fetchData(completion: @escaping(Result<[Meme], APIError>) -> Void )  {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed ")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
                
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(apiResponse.data.memes))
            } catch {
                print("DEBUG: Failed to parse JSON with error: \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }
        .resume()
    }
}
