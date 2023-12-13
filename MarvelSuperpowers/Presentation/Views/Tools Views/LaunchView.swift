//
//  LaunchView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 17/11/23.
//

import SwiftUI

struct LaunchView: View {
    
    //MARK: - View -
    var body: some View {
        ZStack{
            Image("redwall")
                .resizable()
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
