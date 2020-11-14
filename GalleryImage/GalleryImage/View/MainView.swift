//
//  ContentView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 13.11.2020.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var contentVM: GalleryImageViewModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(contentVM: GalleryImageViewModel())
    }
}
