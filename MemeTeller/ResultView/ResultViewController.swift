//
//  ResultViewController.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import Foundation

class ResultViewController: ObservableObject {
    @Published var memes = [Meme]()
    @Published var chosenMeme = ""
    @Published var errorMessage = ""
    @Published var selectedImage: Int? = nil
    
    
    private let service = NetworkService()
    
    init() {
        fetchMemes()
    }
    
    func fetchMemes() {
        service.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let memes):
                    self?.memes = memes
                    self?.chosenMeme = memes.randomElement()?.url ?? ""
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        
    }
    
    func updateMeme() {
        chosenMeme = memes.randomElement()?.url ?? ""
    }
}
