//
//  PeopleWordView.swift
//  Demo_carsh
//
//  Created by Mini001 on 2023/4/19.
//

import SwiftUI

struct PeopleWordView : View {
    
    let entry: Poetry

    var body: some View {
        HStack(content: {
            Image(uiImage: WidgetImageLoader.shareLoader.getImage(entry.imgUrl, entry.icon))
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.origin)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text(entry.author)
                    .font(.system(size: 16))
                Text(entry.content)
                    .font(.system(size: 18))
            }
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [.init(red: 144 / 255.0, green: 252 / 255.0, blue: 231 / 255.0), .init(red: 50 / 204, green: 188 / 255.0, blue: 231 / 255.0)]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
}
