//
//  GreetingsService.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

public final class GreetingsService: Sendable {
    private let namesService: NamesService
    private let appState: AppState

    @MainActor
    private var greetings: [String] {
        get { appState.greetings }
        set(value) { appState.greetingsPublisher.send(value) }
    }

    init(appState: AppState, namesService: NamesService) {
        self.appState = appState
        self.namesService = namesService
    }

    @MainActor
    public func add(greeting: String) {
        greetings
            .append(
                greeting + " " + (appState.names.randomElement() ?? "Nobody") + " " + UUID()
                    .uuidString
            )
    }

    @AppActor
    public func addAsync(greeting: String) async {
        let randomName = await appState.names.randomElement()
        let newGreeting = greeting + " " + (randomName ?? "Nobody") + " " + UUID()
            .uuidString

        Task { @MainActor in
            var newGreetings = appState.greetings
            newGreetings.append(newGreeting)
            appState.greetingsPublisher.value = []
            appState.greetingsPublisher.send(newGreetings)
        }
    }
}
