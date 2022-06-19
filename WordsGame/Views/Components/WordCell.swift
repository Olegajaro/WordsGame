//
//  WordCell.swift
//  WordsGame
//
//  Created by Олег Федоров on 19.06.2022.
//

import SwiftUI

struct WordCell: View {
    
    let word: String
    
    var body: some View {
        HStack {
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
            Text("\(word.count)")
                .foregroundColor(.white)
                .padding()
                .font(.custom("AvenirNext-Bold", size: 22))
        }
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: "Магнит")
    }
}
