//
//  AppObservable.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

@Observable
@MainActor
public class AppObservable {
    public private(set) var greetings: [String] = []
    public private(set) var names: [String] = []

    private var subscriptions = Set<AnyCancellable>()

    init(greetingsService: GreetingsService, namesService: NamesService) {
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
