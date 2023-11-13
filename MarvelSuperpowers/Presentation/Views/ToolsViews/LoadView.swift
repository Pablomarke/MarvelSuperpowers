//
//  LoadView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 9/11/23.
//

import SwiftUI

struct LoadView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("marvel")
                .resizable()
                .frame(height: 120)
                .padding(30)
            Spacer()
                ActivityIndicator()
            Spacer()
            Spacer()
        }
    }
}

struct ActivityIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(2.0, anchor: .center)
            .padding(50)
    }
}
#Preview {
    LoadView()
}
