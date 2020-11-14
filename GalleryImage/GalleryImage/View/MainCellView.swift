//
//  MainCellView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 14.11.2020.
//

import SwiftUI

struct MainCellView: View {
    @State var cocktail: GalleryImage
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: cocktail.downloadUrl)!,
                       cache: self.cache,
                       placeholder: Text("Loading"),
                       configuration: {$0.resizable() }
            )
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
        }
    }
}

struct MainCellView_Previews: PreviewProvider {
    static var previews: some View {
        MainCellView(cocktail: GalleryImage.getDefault())
    }
}
