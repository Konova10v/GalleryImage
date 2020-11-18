//
//  OpenImageView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 16.11.2020.
//

import SwiftUI

struct OpenImageView: View {
    
    
    var body: some View {
        HStack {
            Button(action: {
                print("button pressed")
                
            }) {
                Image(systemName: "arrow.left")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            
            Spacer()
            
            Button(action: {
                      print("button pressed")

                    }) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.horizontal)
        
        
        
        
    }
}

struct OpenImageView_Previews: PreviewProvider {
    static var previews: some View {
        OpenImageView()
    }
}
