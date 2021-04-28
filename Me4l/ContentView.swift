//
//  ContentView.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            
        }
        .navigationBarTitle("Menu", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
