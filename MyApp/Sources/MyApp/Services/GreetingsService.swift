//
//  GreetingsService.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

public final class GreetingsService {
    private let namesService: NamesService
    private let appState: AppState

    @MainActor
    private var greetings: [String] {
        get { appState.greetings }
        set(value) { appState.greetings = value }
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
}
