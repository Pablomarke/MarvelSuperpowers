//
//  ErrorView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 13/11/23.
//

import SwiftUI

struct ErrorView: View {
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
            Spacer()
        }
    }
}

#Preview {
    ErrorView()
}
