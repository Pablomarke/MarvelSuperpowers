//
//  HeroRowView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 9/11/23.
//

import SwiftUI

struct HeroRowView: View {
    var hero: HeroeData
    
    //MARK: - View -
    var body: some View {
        HStack {
            Text(hero.name ?? "")
                .font(.title)
                .frame(width: 120)
                .foregroundStyle(.white)
                .padding()
            AsyncImage(url: (hero.thumbnail?.thumbnailComplete())) { photo in
                photo
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
            } placeholder: {
                Image(systemName: "photo")
            }
            .padding()
        }
        .frame(width: 320, height: 160)
        .background(Color.white.opacity(0.4))
        .cornerRadius(30)
    }
}

struct HeroRowView_Preview: PreviewProvider {
    static var previews: some View {
        HeroRowView(hero: HeroeData(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItem(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpeg", name: "Serie 1")], returned: 2)))
            .previewLayout(.fixed(width: 320, height: 160))
    }
}
