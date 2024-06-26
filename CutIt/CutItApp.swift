import SwiftUI

@main
struct CutItApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
                .frame(
                    minWidth: 800,
                    maxWidth: .infinity,
                    minHeight: 600,
                    maxHeight: .infinity
                )
                .background(BlurView().ignoresSafeArea())
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }
}
