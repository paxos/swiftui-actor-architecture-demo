//
//  GreetingsService.swift
//  SwiftUIActorArchitecture
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

@AppActor
public class GreetingsService {
    let updatedPublisher: CurrentValueSubject<[String], Never>
    private let namesService: NamesService

    private var greetings: [String] {
        get { updatedPublisher.value }
        set(value) { updatedPublisher.send(value) }
    }

    init(namesService: NamesService) {
        self.namesService = namesService
        self.updatedPublisher = .init(["Hello"])
    }

    public func add(greeting: String) {
        greetings.append(greeting + " " + (namesService.updatedPublisher.value.randomElement() ?? "Nobody"))
    }
}
