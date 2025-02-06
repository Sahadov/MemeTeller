//
//  MainViewModel.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var question: String = ""
    @Published var showResultView = false
    @Published var showHistoryView = false
}
