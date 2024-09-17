//
//  ToDoApp.swift
//  ToDo
//
//  Created by Mustafa Emre Tatlıcı on 15.09.2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
