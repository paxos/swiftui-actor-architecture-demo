//
//  App.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation

@AppActor
public class MyApp {
    public static let shared = MyApp()
    public let greetingsService: GreetingsService
    @MainActor public let observable: AppObservable
    
    public init() {
        self.greetingsService = GreetingsService()
        self.observable = AppObservable(greetingsService: greetingsService)
    }
}
