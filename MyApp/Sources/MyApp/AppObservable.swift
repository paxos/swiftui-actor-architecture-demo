//
//  AppObservable.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Foundation
import Combine

@Observable
public class AppObservable {
    public private(set) var greetings: [String] = []
    
    private var subscriptions = Set<AnyCancellable>()

    init(greetingsService: GreetingsService) {
        greetingsService.updatedPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.greetings, on: self)
            .store(in: &subscriptions)
    }
}
