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
    @MainActor public internal(set) var greetings: [String] = []
    @MainActor public internal(set) var names: [String] = []
}
