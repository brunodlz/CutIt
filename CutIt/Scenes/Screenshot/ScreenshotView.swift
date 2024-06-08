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
                        ZStack(alignment: .topTrailing) {
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

                            saveIcon
                                .padding(8)
                                .onTapGesture {
                                    let path = viewModel.pathToSaveScreenshot()
                                    viewModel.save(image: image, path: path)
                                }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 10))
        }
    }

    private var saveIcon: some View {
        Image(systemName: "square.and.arrow.down.fill")
            .font(.body)
            .imageScale(.large)
            .foregroundColor(.white)
            .padding(4)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ScreenshotView(viewModel: .init())
}
