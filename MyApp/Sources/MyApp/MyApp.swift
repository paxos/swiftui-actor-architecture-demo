//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

public final class MyApp: Observable {
    public var observable: AppObservable! = nil

    public var greetingsService: GreetingsService! = nil
    public var namesService: NamesService! = nil

    public init() {
        self.namesService = NamesService()
        self.greetingsService = GreetingsService(namesService: namesService)
        self.observable = AppObservable(greetingsService: greetingsService, namesService: namesService)
        Task { @MainActor in
            self.observable.setup()
        }
    }
}
