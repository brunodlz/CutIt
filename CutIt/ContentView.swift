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
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.cyan, lineWidth: 2)
                            }
                            .padding(EdgeInsets(top: 2,
                                                leading: 2,
                                                bottom: 2,
                                                trailing: 2))

                    }
                }
            }
            .padding(EdgeInsets(top: 2,
                                leading: 2,
                                bottom: 2,
                                trailing: 2))

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
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: .init())
}
