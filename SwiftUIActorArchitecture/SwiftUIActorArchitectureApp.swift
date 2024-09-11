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
    @State private var app: MyApp? = nil
    @State private var b = "a"

    var body: some Scene {
        WindowGroup {
            if app == nil {
                Text("Loading…")
                    .task {
                        app = await MyApp()
                    }
            } else {
                ContentView()
                    .environment(app)
            }
        }
    }
}

