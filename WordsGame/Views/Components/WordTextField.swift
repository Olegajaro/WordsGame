//
//  WordTextField.swift
//  WordsGame
//
//  Created by Олег Федоров on 18.06.2022.
//

import SwiftUI

struct WordTextField: View {
    
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: word)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}
