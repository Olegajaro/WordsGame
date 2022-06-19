//
//  GameView.swift
//  WordsGame
//
//  Created by Олег Федоров on 18.06.2022.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("quit")
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
            
            Text("Магнитотерапия")
                .font(.custom("AvenirNext-Bold", size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .red, radius: 4)
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    
                    Text("Петя")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(26)
                    .shadow(color: .purple, radius: 4)

            }
            
            WordTextField(word: $word, placeholder: "Ваше слово")
                .padding(.horizontal)
            
            Button {
                print("done")
                word = ""
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

            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(0.0)
            
        }.background(Image("background"))
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
