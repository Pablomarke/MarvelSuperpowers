//
//  ErrorView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 16/11/23.
//

import SwiftUI

struct ErrorView: View {
    
    //MARK: - View -
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "xmark.circle")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
            Spacer()
            Text("ERROR!")
                .bold()
                .foregroundStyle(.red)
                .font(.largeTitle)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Image("wall1")
            .resizable()
        .opacity(0.8)
        .edgesIgnoringSafeArea(.all)
        
        )
    }
        
}

#Preview {
    ErrorView()
}
