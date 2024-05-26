import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ScreenshotViewModel

    var body: some View {
        TabView(tabViewModel: .init(),
                screenshotViewModel: .init())
    }
}

#Preview {
    ContentView(viewModel: .init())
}
