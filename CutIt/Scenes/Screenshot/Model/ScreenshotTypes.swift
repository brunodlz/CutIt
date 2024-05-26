enum ScreenshotTypes {
    case full
    case window
    case area

    var processArguments: [String] {
        switch self {
            case .full:
                ["-c"]
            case .window:
                ["-cw"]
            case .area:
                ["-cs"]
        }
    }
}
