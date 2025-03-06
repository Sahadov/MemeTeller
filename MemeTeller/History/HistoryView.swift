//
//  HistoryView.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 06/02/2025.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = HistoryViewModel()
    @Binding var showHistoryView: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Spacer()
                Text("🧿 )))")
                    .font(.system(size: 200))
                    .offset(x: 50, y: -150)
                    .opacity(0.7)
            }
            Button {
                showHistoryView.toggle()
            } label: {
                Image(systemName: "arrow.backward")
                    .foregroundStyle(.blue)
                    .fontWeight(.semibold)
            }
            .offset(x: 15, y: -10)
            Text("History")
                .font(.title)
                .padding()
                .foregroundStyle(.blue)
                .offset(y: 30)
            
            List() {
                ForEach(viewModel.questions, id: \.self) { question in
                    HStack {
                        Text(question.question)
                            .foregroundStyle(.gray)
                        Spacer()
                        AsyncImage(
                            url: URL(string: question.answerImage),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .frame(maxWidth: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                    
                }
                .onDelete(perform: viewModel.deleteQuestion)
            }
            .listStyle(.plain)
            .offset(y:90)
        }
        
    }
}


