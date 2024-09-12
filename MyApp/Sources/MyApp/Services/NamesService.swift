//
//  File.swift
//
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

public final class NamesService {
    let updatedPublisher: CurrentValueSubject<[String], Never> = .init(["Patrick", "Peter"])

    @AppActor
    private var names: [String] {
        get { updatedPublisher.value }
        set(value) { updatedPublisher.send(value) }
    }

    @AppActor
    public func add(name: String) {
        names.append(name)
    }
}
