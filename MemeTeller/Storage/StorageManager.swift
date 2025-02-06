//
//  StorageManager.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 06/02/2025.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    private let defaults = UserDefaults.standard
    private let questionsKey = "questions"

    private init() {}
    
    func saveQuestions(_ questions: [Question]) {
        if let encoded = try? JSONEncoder().encode(questions) {
            defaults.set(encoded, forKey: questionsKey)
        }
    }

    func addQuestion(_ question: Question) {
        var questions = getQuestions()
        questions.append(question)
        saveQuestions(questions)
        print("ADDED")
    }

    func getQuestions() -> [Question] {
        if let data = defaults.data(forKey: questionsKey),
            let decoded = try? JSONDecoder().decode([Question].self, from: data) {
            return decoded
        }
        return []
    }
    
    func deleteQuestion(withName question: String) {
            var questions = getQuestions()
            questions.removeAll { $0.question == question }
            saveQuestions(questions)
    }
}
