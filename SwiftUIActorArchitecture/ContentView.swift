//
//  ContentView.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import MyApp
import SwiftUI

struct ContentView: View {
    @Environment(MyApp.self) private var app
    var body: some View {
        VStack {
            HStack {
                Button("Add") {
                    app.greetingsService.add(greeting: "Yo")
                }

                Button("Add Async") {
                    Task {
                        await app.greetingsService.addAsync(greeting: "Yo")
                    }
                }
            }
            List(app.appState.greetings, id: \.self) { greeting in
                Text(greeting)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
