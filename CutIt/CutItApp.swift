import SwiftUI

@main
struct CutItApp: App {
    @AppStorage("displayMode") private var displayMode: DisplayMode = .system
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("appearanceSelection") private var appearanceSelection: Int = 0

    var appearanceSwitch: ColorScheme? {
        if appearanceSelection == 1 {
            return .light
        }
        else if appearanceSelection == 2 {
            return .dark
        }
        else {
            return .none
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
                .frame(
                    minWidth: 800,
                    maxWidth: .infinity,
                    minHeight: 600,
                    maxHeight: .infinity
                )
                .preferredColorScheme(appearanceSwitch)
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) { }
        }

        Settings {
            SimpleTabView()
                
        }
    }
}
