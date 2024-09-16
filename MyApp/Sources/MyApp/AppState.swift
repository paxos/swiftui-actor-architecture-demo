//
//  AppState.swift
//  MyApp
//
//  Created by Patrick Dinger on 9/12/24.
//

import Combine
import Foundation

@Observable
public final class AppState: Sendable {
    @MainActor public private(set) var greetings: [String] = []
    @MainActor public let greetingsPublisher: CurrentValueSubject<[String], Never> = .init([])
    
    @MainActor public internal(set) var names: [String] = []

    private var subscriptions = Set<AnyCancellable>()

    init() {
        Task {
            await self.setup()
        }
    }

    @MainActor
    func setup() {
        greetingsPublisher
            .receive(on: DispatchQueue.main)
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .assign(to: \.greetings, on: self)
            .store(in: &subscriptions)
    }
}
