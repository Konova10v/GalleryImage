//
//  ContentView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 13.11.2020.
//

import Foundation
import SwiftUI

struct MainView: View {
    @ObservedObject var contentVM: GalleryImageViewModel
    @State private var showDatail = false
    @State var image: GalleryImage = GalleryImage.getDefault()
    
    var body: some View {        
        VStack {
            if !contentVM.image.isEmpty {
                ForEach($contentVM.image.wrappedValue, id: \.downloadUrl) { image in
                    Text("test")
                }
            }
        }
        .onAppear(perform: fetch)
    }
    
    private func fetch() {
        DispatchQueue.global(qos: .userInitiated).async {
            contentVM.fetchWeatherMoscow()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(contentVM: GalleryImageViewModel())
    }
}
