import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ScreenshotViewModel

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        TabsView(tabViewModel: .init(),
                screenshotViewModel: .init())

        Text(colorScheme == .dark ? "In dark mode" : "In light mode")
    }
}

#Preview {
    ContentView(viewModel: .init())
}
