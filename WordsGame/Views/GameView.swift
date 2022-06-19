//
//  GameView.swift
//  WordsGame
//
//  Created by Олег Федоров on 18.06.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State private var alertText = ""
    var viewModel: GameViewModel
    
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal, 16)
                        .background(Color("Orange"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold", size: 18))
                }
                
                Spacer()
            }
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 30))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    
                    Text(viewModel.player1.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(26)
                    .shadow(color: viewModel.isFirst ? .red : .clear,
                            radius: 4)
                
                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    
                    Text(viewModel.player2.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(26)
                    .shadow(color: !viewModel.isFirst ? .purple : .clear,
                            radius: 4)
                
            }
            
            WordTextField(word: $word, placeholder: "Ваше слово")
                .padding(.horizontal)
            
            Button {
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "слово было составлено ранее"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "слишком короткое слово"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "составленное слово не должно быть исходным словом"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "такое слово не может быть составлено"
                    isAlertPresent.toggle()
                } catch {
                    alertText = "Неизвестная ошибка"
                    isAlertPresent.toggle()
                }
                
                if score > 1 {
                    word = ""
                }
            } label: {
                Text("Готово!")
                    .padding(12)
                    .foregroundColor(.white)
                    .font(.custom("AvenirNext-Bold", size: 26))
                    .frame(maxWidth: .infinity)
                    .background(Color("Orange"))
                    .cornerRadius(26)
                    .padding(.horizontal)
            }
            
            ScrollView {
                ForEach(0..<viewModel.words.count, id: \.description) { item in
                    WordCell(word: viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer" ) : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }.background(Image("background"))
            .confirmationDialog(
                "Вы уверены, что хотите завершить игру?",
                isPresented: $confirmPresent,
                titleVisibility: .visible
            ) {
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Text("Yes")
                }
                
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
            }
            .alert(
                alertText,
                isPresented: $isAlertPresent
            ) {
                Text("OK!")
            }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"),
                                          player2: Player(name: "Петя"),
                                          word: "Магнитотерапия"))
    }
}
