//
//  LaunchView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 17/11/23.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack{
            Image("redwall")
                .resizable()
                .opacity(0.8)
               .edgesIgnoringSafeArea(.all)
            ZStack{
                
                VStack{
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                               
                               .scaleEffect(6.0, anchor: .center)
                               .padding()
                         Spacer()
                    Spacer()
                    Text("Loading Heroes...")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}