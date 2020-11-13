//
//  DetailView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 13.11.2020.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 20, content: {
                Image("mountain")
                    .resizable()
                    .frame(height: 300)
                
                HStack(spacing: 30, content: {
                    Button(action: {
                              print("button pressed")

                            }) {
                        Image(systemName: "heart")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Button(action: {
                              print("button pressed")

                            }) {
                        Image(systemName: "message")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            }
                    
                    Button(action: {
                              print("button pressed")

                            }) {
                        Image("add")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            }
                    
                    Button(action: {
                              print("button pressed")

                            }) {
                        Image("share")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Button(action: {
                              print("button pressed")

                            }) {
                        Image("more")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                })
                .padding(.leading, 10)
                
                HStack(spacing: 20) {
                    Image("mountain")
                        .renderingMode(.original)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    
                    VStack(spacing: 20) {
                        Text("Winter Wonderland")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        HStack(spacing: 30) {
                            Text("by Devid Meron")
                            
                            Button(action: {
                                      print("button pressed")
                                    }) {
                                Text("Follow")
                                    .foregroundColor(.blue)
                            }
                        }
                        .font(.system(size: 15))
                    }
                }
                .padding(.leading, 10)
                
                HStack(spacing: 10, content: {
                    Image("location")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Antarctica")
                })
                .padding(.leading, 10)
                
                
                HStack(spacing: 40) {
                    HStack {
                        Text("Taken:")
                            .fontWeight(.bold)
                        Text("20 янв. 2018")
                    }
                    
                    HStack {
                        Text("Uploaded:")
                            .fontWeight(.bold)
                        Text("3 years ago")
                    }
                }
                .font(.system(size: 15))
                .padding(.leading, 10)
                
                
                VStack {
                    Text("Print avaliable HERE Follow on INSTAGRAM")
                        .font(.system(size: 18))
                    Button(action: {
                              print("button pressed")
                            }) {
                        Text("View more")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.leading, 10)
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Pulse")
                            .font(.system(size: 20))
                        Text("99,2")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        Text("Imperssions")
                            .font(.system(size: 20))
                        Text("126,1K")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Editors' Choice")
                            .font(.system(size: 20))
                        Image("best-seller")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 140)
                }
                .padding(.leading, 10)
                
                Text("3,3K people liked this photo >")
                    .font(.system(size: 18))
                    .padding(.leading, 10)
            })
            
            VStack(alignment: .leading, content: {
                HStack(spacing: 10, content: {
                    Image("camera")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Canon EOS 5D MArk IV >")
                })
                
                HStack(spacing: 10, content: {
                    Image("lens")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 20, height: 20)
                    Text("Canon EF 70-200mm f/2.8L IS II USM >")
                })
            })
            .padding(.leading, 10)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView()
        }
    }
}
