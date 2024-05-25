import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: ScreenCaptureViewModel

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(
                        .adaptive(
                            minimum: 200,
                            maximum: 300
                        )
                    )]
                ) {
                    Text("Test")
                }
            }

            HStack {
                Button("Make a Full Screenshot") {
                    viewModel.takeScreenshot(for: .full)
                }

                Button("Make a Window Screenshot") {
                    viewModel.takeScreenshot(for: .window)
                }

                Button("Make a Area Screenshot") {
                    viewModel.takeScreenshot(for: .area)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(viewModel: .init())
}
