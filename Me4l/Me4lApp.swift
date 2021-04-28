//
//  Me4lApp.swift
//  Me4l
//
//  Created by Leonardo Viana on 27/04/21.
//

import SwiftUI

@main
struct Me4lApp: App {
    //    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
        }
    }
}
