//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

@AppActor
public final class MyApp: Observable, Sendable {
    public let observable: AppObservable
    public let greetingsService: GreetingsService
    public let namesService: NamesService

    public init() async {
        self.namesService = NamesService()
        self.greetingsService = GreetingsService(namesService: namesService)

        self.observable = await AppObservable(greetingsService: greetingsService, namesService: namesService)
    }
}
