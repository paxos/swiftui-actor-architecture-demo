//
//  ContentView.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import MyApp
import SwiftUI

struct ContentView: View {
    let app = MyApp.shared
    var body: some View {
        VStack {
            Button("Add") {
                Task {
                    await app.greetingsService.add(greeting: "Yo")
                }
            }

            List(app.observable.greetings, id: \.self) { greeting in
                Text(greeting)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
