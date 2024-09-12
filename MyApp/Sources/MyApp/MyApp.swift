//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

public final class MyApp: Observable {
    public var observable: AppObservable

    public var greetingsService: GreetingsService
    public var namesService: NamesService

    public init() {
        self.namesService = NamesService()
        self.greetingsService = GreetingsService(namesService: namesService)
        self.observable = AppObservable(greetingsService: greetingsService, namesService: namesService)
        Task { @MainActor in
            self.observable.setup()
        }
    }
}
