import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: ScreenCaptureViewModel

    var body: some View {
        TabView(viewModel: .init())
    }
}

#Preview {
    ContentView(viewModel: .init())
}
