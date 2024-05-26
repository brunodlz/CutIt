import SwiftUI

enum TabOption {
    case window
    case full
    case area

    var image: String {
        switch self {
            case .window:
                return "macwindow.on.rectangle"
            case .full:
                return "macwindow"
            case .area:
                return "macwindow.and.cursorarrow"
        }
    }

    var text: String {
        switch self {
            case .window:
                return "Window Screenshot"
            case .full:
                return "Full Screenshot"
            case .area:
                return "Area Screenshot"
        }
    }
}
