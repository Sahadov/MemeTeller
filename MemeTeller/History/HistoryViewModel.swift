//
//  HistoryViewModel.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 06/02/2025.
//

import Foundation

class HistoryViewModel: ObservableObject {
    @Published var questions = [Question]()
    
    init(){
        questions = StorageManager.shared.getQuestions()
        print(questions)
    }
}
