//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

public final class MyApp: Observable {
    public var greetingsService: GreetingsService
    public var namesService: NamesService
    public var appState = AppState()

    public init() {
        self.namesService = NamesService(appState: appState)
        self.greetingsService = GreetingsService(appState: appState, namesService: namesService)
    }
}
