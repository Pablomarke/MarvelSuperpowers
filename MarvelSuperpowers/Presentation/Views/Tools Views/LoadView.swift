//
//  LoadView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import SwiftUI

struct LoadView: View {
    var body: some View {
        Spacer()
        VStack{
            Text("Loading...")
                .font(.largeTitle)
                .foregroundStyle(.gray)
            
            ProgressView()
                       .progressViewStyle(CircularProgressViewStyle())
                       .scaleEffect(2.0, anchor: .center)
                       .padding()
        }
        Spacer()
    }
}
#Preview {
    LoadView()
}
