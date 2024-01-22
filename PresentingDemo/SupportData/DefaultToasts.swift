//
//  DefaultToasts.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/22/24.
//

import SwiftUI

enum DefaultToasts: CaseIterable, Identifiable {
    case debug, error, info, notice, success, warning

    var id: String {
        switch self {
        case .debug:
            "Debug"
        case .error:
            "Error"
        case .info:
            "Info"
        case .notice:
            "Notice"
        case .success:
            "Success"
        case .warning:
            "Warning"
        }
    }

    var sfSymbol: Image {
        switch self {
        case .debug:
            Image(systemName: "ladybug")
        case .error:
            Image(systemName: "exclamationmark.octagon")
        case .info:
            Image(systemName: "info.circle")
        case .notice:
            Image(systemName: "bell")
        case .success:
            Image(systemName: "checkmark.circle")
        case .warning:
            Image(systemName: "exclamationmark.triangle")
        }
    }

    var color: Color {
        switch self {
        case .debug:
            Color.purple
        case .error:
            Color.red
        case .info:
            Color.blue
        case .notice:
            Color.orange
        case .success:
            Color.green
        case .warning:
            Color.yellow
        }
    }
}
