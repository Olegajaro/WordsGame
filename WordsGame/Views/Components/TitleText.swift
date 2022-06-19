//
//  TitleText.swift
//  WordsGame
//
//  Created by Олег Федоров on 18.06.2022.
//

import SwiftUI

struct TitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
    }
    
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "testText")
    }
}
