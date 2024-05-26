import SwiftUI

struct ScreenshotView: View {
    @StateObject var viewModel: ScreenshotViewModel

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
                                    .stroke(.mint, lineWidth: 2)
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
        }
        .padding()
    }
}

#Preview {
    ScreenshotView(viewModel: .init())
}
