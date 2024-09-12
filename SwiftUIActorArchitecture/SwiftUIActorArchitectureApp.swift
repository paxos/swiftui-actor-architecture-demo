//
//  SwiftUIActorArchitectureApp.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import MyApp
import SwiftUI

@main
struct SwiftUIActorArchitectureApp: App {
    @State private var app: MyApp? = MyApp()
    @State private var b = "a"

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(app)
        }
    }
}
