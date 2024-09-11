//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

@Observable
public final class MyApp: Sendable {
    public let greetingsService: GreetingsService
    public let namesService: NamesService
    public let observable: AppObservable

    @AppActor
    public init() async {
        self.namesService = NamesService()
        self.greetingsService = GreetingsService(namesService: namesService)
        
        self.observable = await AppObservable(greetingsService: greetingsService, namesService: namesService)
    }
}
