import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ScreenshotViewModel

    var body: some View {
        TabView(viewModel: .init())
    }
}

#Preview {
    ContentView(viewModel: .init())
}
