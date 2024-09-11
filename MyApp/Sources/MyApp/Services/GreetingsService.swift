//
//  GreetingsService.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

@AppActor
public final class GreetingsService {
    let updatedPublisher: CurrentValueSubject<[String], Never> = .init(["Hello"])
    private let namesService: NamesService

    private var greetings: [String] {
        get { updatedPublisher.value }
        set(value) { updatedPublisher.send(value) }
    }

    init(namesService: NamesService) {
        self.namesService = namesService
    }

    public func add(greeting: String) {
        greetings.append(greeting + " " + (namesService.updatedPublisher.value.randomElement() ?? "Nobody"))
    }
}
