//
//  TagCloudView.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 16.11.2020.
//

import SwiftUI

struct TagCloud: View {
    var tags: [String]

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Button(action: {
                  print("button pressed")
                }) {
            Text(text)
                .padding(.all, 5)
                .font(.body)
                .background(Color.white)
                .foregroundColor(Color.gray)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
        }
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct TagCloudView : View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                Text("Category: ")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("Animals >")
            }
            TagCloud(tags: ["penguins", "birds", "bird", "canon", "antarctica", "antarctic", "animals", "animal", "flightless", "group", "party", "ice", "blue", "cold", "icey", "snow", "snowing", "moody", "mood", "adelie", "cute", "southern", "500px", "smooth", "500pxambassador", "family", "busy", "wildlife", "wilderness", "penguin"])
        }
    }
}

struct TestTagCloudView_Previews: PreviewProvider {
    static var previews: some View {
        TagCloudView()
    }
}
