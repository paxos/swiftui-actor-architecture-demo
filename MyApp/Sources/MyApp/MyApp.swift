//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

@Observable
public final class MyApp {
    public let greetingsService: GreetingsService
    public var observable: AppObservable!

    @AppActor
    public init() async {
        self.greetingsService = GreetingsService()
        self.observable = await AppObservable(greetingsService: greetingsService)
    }
}
