//
//  File.swift
//
//
//  Created by Patrick Dinger on 9/11/24.
//

import Combine
import Foundation

public final class NamesService: Sendable {
    private let appState: AppState

    init(appState: AppState) {
        self.appState = appState
    }

    @MainActor
    private var names: [String] {
        get { appState.names }
        set(value) { appState.names = value }
    }

    @MainActor
    public func add(name: String) {
        names.append(name)
    }
}
