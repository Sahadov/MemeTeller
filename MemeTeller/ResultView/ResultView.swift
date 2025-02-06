//
//  ResultView.swift
//  MemeTeller
//
//  Created by Dmitry Volkov on 05/02/2025.
//

import SwiftUI

struct ResultView: View {
    @StateObject var viewModel = ResultViewController()
    @Binding var showResultView: Bool
    @Binding var question: String
    
        
        var body: some View {
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.all)
                    
                    if viewModel.selectedImage == nil {
                        VStack(spacing: 30) {
                            ForEach(0..<3, id: \.self) { index in
                                Image("Card")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(30)
                                    .shadow(radius: 7)
                                    .frame(width: 150, height: 200)
                                    .offset(x: index == 0 ? -30 : (index == 2 ? 30 : 0))
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            viewModel.selectedImage = index
                                        }
                                    }
                            }
                        }
                    } else {
                        VStack {
                            Text(question)
                                .foregroundStyle(.white)
                            AsyncImage(
                                url: URL(string: viewModel.chosenMeme),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(15)
                                        .padding(30)
                                    
                                        
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            .shadow(radius: 10)
                            HStack(spacing: 30) {
                                Button {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            StorageManager.shared.addQuestion(Question(question: question, answerImage: viewModel.chosenMeme))
                                            question = ""
                                            showResultView.toggle()
                                    }
                                } label: {
                                    Text("👍")
                                        .font(.largeTitle)
                                }
                                
                                Button {
                                        withAnimation(.easeInOut(duration: 1.5)) {
                                            viewModel.updateMeme()
                                        }
                                } label: {
                                    Text("👎")
                                        .font(.largeTitle)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    viewModel.selectedImage = nil
                                }
                            }
                        }
                    }
                }
        }
    }
