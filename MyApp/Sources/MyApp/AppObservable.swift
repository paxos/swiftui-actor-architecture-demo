//
//  AppObservable.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

@Observable
public class AppObservable {
    @MainActor public private(set) var greetings: [String] = []
    @MainActor public private(set) var names: [String] = []

    private var subscriptions = Set<AnyCancellable>()

    private let greetingsService: GreetingsService
    private let namesService: NamesService

    init(greetingsService: GreetingsService, namesService: NamesService) {
        self.greetingsService = greetingsService
        self.namesService = namesService
    }

    @MainActor
    func setup() {
        greetingsService.updatedPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.greetings, on: self)
            .store(in: &subscriptions)

        namesService.updatedPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.names, on: self)
            .store(in: &subscriptions)
    }
}
