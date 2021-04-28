//
//  MealView.swift
//  Me4l
//
//  Created by Leonardo Viana on 28/04/21.
//

import SwiftUI
import URLImage

struct MealView: View {
    let imageUrl: URL
    let name: String
    let instructions: String
    
    init(imageUrl: URL, name: String, instructions: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.instructions = instructions
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                URLImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .ignoresSafeArea()
                }
                .frame(width: geo.size.width, height: geo.size.height / 3)
                .background(Color.black)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.bottom, 8)
                    
                    Text(instructions)
                        .font(.body)
                        .fontWeight(.light)
                }
                .padding()
            }
        }
        .navigationBarTitle(name, displayMode: .inline)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(imageUrl: URL(string: "aaa")!,
                 name: "Macarronada",
                 instructions: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis est interdum, dictum orci in, tincidunt ante. Aenean ullamcorper at mi vitae fringilla. Proin commodo ipsum vel sollicitudin faucibus"
        )
    }
}
