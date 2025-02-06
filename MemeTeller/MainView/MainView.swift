//
//  MainView.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        viewModel.showHistoryView.toggle()
                    }
                } label: {
                    Text("💎")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .padding()
            }
            .offset(y: 50)
            
            Spacer()
            
            TextField("Задай вопрос и узнай свое будущее", text: $viewModel.question)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundStyle(.blue)
                .padding()
            Button {
                withAnimation(.easeInOut(duration: 1.5)) {
                    viewModel.showResultView.toggle()
                }
            } label: {
                Text("Узнать")
                    .foregroundStyle(.white)
            }

            Spacer()
            Text("🧙‍♂️")
                .font(.system(size: 300))
                .offset(y: 30)
        }
        .ignoresSafeArea()
        .background(.blue)
        .fullScreenCover(isPresented: $viewModel.showResultView) {
                ResultView(showResultView: $viewModel.showResultView, question: $viewModel.question)
        }
        .fullScreenCover(isPresented: $viewModel.showHistoryView) {
            HistoryView(showHistoryView: $viewModel.showHistoryView)
        }
    }
}

#Preview {
    MainView()
}
