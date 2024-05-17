//
//  LoadView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 15/11/23.
//

import SwiftUI

struct LoadView: View {
    //MARK: - View -
    var body: some View {
        VStack{
            Spacer()
            Text("Loading...")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                       .scaleEffect(2.0, anchor: .center)
            Spacer()
                .navigationBarBackButtonHidden()
        }
        .frame(maxWidth: .infinity)
        .background(Image("redwall")
            .resizable()
            .opacity(0.8)
           .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    LoadView()
}
